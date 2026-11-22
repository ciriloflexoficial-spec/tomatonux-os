#!/bin/sh
set -eu

ISO_DIR="${1:-build/live-build}"

ISO="$(find "$ISO_DIR" -maxdepth 1 -type f -name '*.iso' -print -quit)"

if [ -z "$ISO" ]; then
    echo "ERRO: ISO não encontrada."
    exit 1
fi

echo "ISO encontrada: $ISO"

WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT

xorriso -osirrox on -indev "$ISO" \
    -extract /live/filesystem.squashfs "$WORK/filesystem.squashfs"

test -s "$WORK/filesystem.squashfs"

unsquashfs -d "$WORK/rootfs" "$WORK/filesystem.squashfs"

ROOT="$WORK/rootfs"

echo "Verificando arquivos do desktop..."

for FILE in \
    etc/lightdm/lightdm.conf.d/50-tomatonux.conf \
    etc/xdg/openbox/autostart \
    etc/xdg/openbox/rc.xml \
    etc/xdg/tint2/tint2rc \
    etc/rofi/config.rasi \
    etc/rofi/tomatrix-red.rasi
do
    if [ ! -f "$ROOT/$FILE" ]; then
        echo "ERRO: arquivo ausente: $FILE"
        exit 1
    fi
    echo "OK: $FILE"
done

if [ ! -f "$ROOT/usr/lib/systemd/system/lightdm.service" ] &&
   [ ! -f "$ROOT/lib/systemd/system/lightdm.service" ]; then
    echo "ERRO: lightdm.service não encontrado."
    exit 1
fi

echo "OK: serviço LightDM encontrado."

echo "Verificação dos arquivos concluída."

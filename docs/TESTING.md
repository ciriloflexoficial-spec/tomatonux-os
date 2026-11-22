
## Validação do Live Build

- Ambiente: contêiner debian:trixie no GitHub Actions (runner ubuntu-24.04)
- Live Build: versão do repositório Trixie
- Resultado: `lb config` executado sem erro para debian/trixie/amd64
- Estrutura gerada: auto/, config/, local/
- Pendente: construção da ISO (`lb build`)

## Resultados do teste da versão 0.0.1 (22/11/2026)

### Verificado
- Build da ISO concluído no GitHub Actions (execução #19), com `lb build` sem erro e artefatos `tomatonux-iso` e `live-build-log`.
- Build concluído com a mensagem "P: Build completed successfully" no log.
- ISO `tomatonux-0.0.1-amd64.hybrid.iso` (cerca de 1,11 GB) extraída do artefato no celular.
- GRUB carregou na VM (QEMU) com a entrada "Debian GNU/Linux 13 (trixie) amd64".
- Kernel e systemd iniciaram com serviços em `[ OK ]`.
- `live-config.service` ficou aguardando por cerca de 4 minutos antes de terminar.
- Sessão gráfica no ar: cursor visível, applet do NetworkManager funcionando, e menu do Openbox (botão direito) abrindo o rofi com 12 entradas.
- Tty1 e tty2 com login automático `user`.

### Não observado ou com falha
- Barra de tarefas Tint2 não apareceu na tela, apesar de constar no menu do rofi.
- Papel de parede não apareceu (área de trabalho preta).
- Terminal gráfico (xfce4-terminal) não abriu. Erro: `cannot open display`.
- `serial.log` e `qemu-debug.log` ficaram vazios.

### Diagnóstico pendente
- A variável `DISPLAY` não foi verificada corretamente, porque a digitação pelo teclado virtual trocou `$` por `4` em vários testes. O `xhost` retornou `unable to open display ""`, o que indica `DISPLAY` vazio no shell de teste, não necessariamente falha do servidor X.
- Socket `/tmp/.X11-unix/X0` existe e pertence a root com permissão `srwxrwxrwx`.

### Próximo passo
- Corrigir a inicialização da sessão gráfica (variável `DISPLAY`, autostart do Openbox, papel de parede e Tint2) antes de um novo teste.
- Reduzir a dependência de digitação manual nos testes.

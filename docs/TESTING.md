
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

## Teste na VM: desktop da versão 0.0.1 (22/11/2026)

### Validado
- ISO gerada pela execução #26 (commit b31388a), com build de 2026-11-22 19:54 UTC.
- GRUB, kernel 6.12.117-1 e systemd iniciaram sem erro fatal.
- Login automático com o usuário `user`.
- Desktop Openbox com papel de parede Tomatonux (Tux com tomate).
- Barra do Tint2 com áreas de trabalho e relógio.
- Applet de rede do NetworkManager visível no painel.
- Menu rofi (botão direito) lista os aplicativos instalados.
- Aplicativos abertos com sucesso: Xfce Terminal, Tint2 Settings, PCMan File Manager e Htop.
- Uso de memória baixo (cerca de 199 MiB em 27 minutos de execução).

### Pendente ou observado
- Clique depende do cliente VNC; toque direto não aciona a ação, é preciso usar Enter ou o botão de mouse da barra.
- `live-config.service` pode demorar vários minutos no primeiro boot.
- Swap desativado (0K/0K); avaliar para o PC da Xuxa com 4 GB.
- Openbox Configuration Manager e comportamento completo do botão direito ainda não testados.
- Teste de boot automático no workflow (`test-boot`) só confirma que a VM ficou ligada por 90 segundos, não que a área de trabalho apareceu.
- Relógio mostra horário da VM; fuso horário ainda não configurado.

## Barra centralizada validada (ISO da execução #30, commit fc66662)

- Barra centralizada na parte inferior, em vermelho, com cantos quase retos.
- Botão Iniciar (tomate) abre o rofi com um clique (não precisa de Enter).
- Apps abertos aparecem no meio da barra, com ícone e nome.
- Ao fechar um app, o item some da barra.
- Relógio e rede visíveis à direita (22:17, 22/11 no horário da VM).

Pendente: menu Iniciar próprio em GTK (substituir o rofi), janela de configurações e lentidão do rofi ao abrir.

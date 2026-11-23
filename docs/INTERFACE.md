
## Decisão: navegador
- Padrão: Firefox ESR.
- Alternativo: Chromium, selecionável em Configurações > Aplicativos padrão.
- Chrome e Brave ficam fora da 0.1 (licença e manutenção).

## Referência visual (ideia de longo prazo)

A imagem de referência mostra 17 telas (boot, login, desktop, menu, arquivos, configurações, loja, terminal, monitor, atualizações, data e hora, idioma, notificações, dispositivos, Tomatinho Hub, sobre e atalhos). Ela é o objetivo visual do projeto, não uma lista de entrega. Cada tela entra na versão que tiver a infraestrutura necessária.

### 0.1 Alpha
- Área de trabalho com ícones desenhados pelo PCMan (Pasta pessoal, Lixeira, Rede, Computador).
- Barra centralizada com botão Iniciar e apps abertos (já validada).
- Menu Iniciar em grade com busca (já implementado; falta a lateral de categorias).
- Configurações com as seções Aparência e Organizador da área de trabalho.
- Atalhos do sistema definidos no `rc.xml` do Openbox.

### 0.2 Alpha
- Navegadores Firefox ESR (padrão) e Chromium (alternativo).
- Gerenciador de arquivos PCMan com tema vermelho.
- Terminal Xfce com tema vermelho.
- Organizador da área de trabalho, ações 4 e 5 (limpeza de cache).

### 0.5 Beta
- Login com idioma e teclado pt_BR e Português (Brasil) como padrão.
- Data e hora e idioma e teclado nas configurações.
- Tela "Sobre o sistema" com as informações da versão.
- Atualizações do sistema (`apt update` e `apt upgrade`) com tela de status.

### 0.9 RC
- Monitor de sistema e notificações.
- Dispositivos e impressoras (teste no PC da Xuxa).
- Tela de desligar, suspender, reiniciar e trocar usuário.

### Fora do escopo até a 1.0
- Loja de aplicativos (Tomatonux Software): instalação de apps pelo `apt` ou terminal até lá.
- Tomatinho Hub: pode ser uma página HTML simples, sem função técnica.
- Symbols do sistema: folha de ícones, feita junto com o tema.

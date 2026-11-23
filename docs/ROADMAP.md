# Roadmap do Tomatonux OS

Todas as versões antes da 1.0 são Alpha ou Beta e não são recomendadas para uso em produção. Cada versão só avança quando os critérios de saída forem cumpridos e registrados em `docs/TESTING.md`.

| Versão | Objetivo | Critério de saída |
|--------|----------|-------------------|
| 0.0.1 Alpha | ISO live sobe até o desktop | Desktop com wallpaper e Tint2 validados na VM (cumprido) |
| 0.1 Alpha | Barra centralizada, menu Iniciar próprio, configurações GTK e organizador (ações 1 a 3) | Cada item aberto e usado na VM, sem erro no log |
| 0.2 Alpha | Navegadores (Firefox ESR e Chromium), editor de texto e visualizador de imagens | Cada app instalado e aberto com 2 GB de RAM na VM |
| 0.5 Beta | Instalador em disco e atualizações (`apt update` e `apt upgrade`) | Instalação em VM vazia e atualização sem quebrar o boot |
| 0.9 RC | Testes em hardware real, incluindo o PC da Xuxa | Boot, rede, áudio e gráficos funcionando, com a GPU Ironlake testada |
| 1.0 Stable | Versão estável e instalável | Todos os critérios anteriores cumpridos e guia de instalação pronto |

## Pendências em aberto
- Ferramenta do instalador ainda não escolhida.
- Organizador: ações 4 e 5 (limpeza de cache) só depois das ações 1 a 3 validadas.
- Teste de atualização do APT ainda não feito.
- Fuso horário do sistema ainda não configurado.
- Warnings de Node.js 20 nas actions do GitHub (deprecação futura).

## Regra de versão
Só se muda o número quando o critério de saída da versão atual estiver cumprido e registrado.

## Contas de usuário (0.5 Beta)
- Tela de login com seleção de conta (lista de usuários do sistema).
- Cada conta tem pasta pessoal e configuração própria (`~/.config`), incluindo desktop, atalhos e Organizador.
- Botões no rodapé do menu Iniciar: Trocar usuário (volta à tela de login sem encerrar a sessão, via `dm-tool switch-to-greeter`), Bloquear, Suspender, Reiniciar e Desligar.
- Criação e remoção de contas feitas por ferramenta própria, com confirmação antes de apagar dados.
- Critério de saída: duas contas criadas na VM, cada uma com configuração própria, e troca de usuário funcionando sem reiniciar.
- Alt+F4 fecha só a janela ativa (comportamento do Openbox); não é usado para desligar.

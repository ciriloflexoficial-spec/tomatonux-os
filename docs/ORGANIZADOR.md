# Organizador da área de trabalho

Nome: **Organizador da área de trabalho** (não é um assistente de conversa, não é um modelo de IA e não tem chat).

Função: organizar a área de trabalho, otimizar o sistema e limpar caches, sempre com regras fixas e locais. Funciona com ou sem internet. Usa a rede apenas se uma função específica precisar, e nenhuma função da versão 0.1 precisa.

## Configurações

- **Organizador da área de trabalho**: ligado ou desligado (padrão: ligado).
- **Perguntar antes de organizar**: ligado ou desligado (só aparece se o organizador estiver ligado; padrão: ligado).
- **Limpeza agendada de cache**: desativada, 1 hora, 5 horas, 1 dia, 7 dias ou 30 dias (padrão: desativada).

## Ações da versão 0.1

| # | Ação | Reversível | Pergunta com "Perguntar antes" desligado |
|---|------|-----------|------------------------------------------|
| 1 | Organizar os ícones em uma grade fixa | Sim | Executa sozinho |
| 2 | Trocar o papel de parede pelo horário (dia/noite) | Sim | Executa sozinho |
| 3 | Remover da inicialização automática os programas pesados que não estão nos favoritos | Sim | Executa sozinho |
| 4 | Limpar miniaturas antigas (mais de 30 dias) | Não | Sempre pergunta |
| 5 | Limpeza agendada de cache de apps | Não | Executa no intervalo escolhido, se configurado |

Regra da ação 4 e 5: a limpeza de miniaturas sempre pergunta, mesmo com "Perguntar antes" desligado, porque apaga arquivos sem volta. A limpeza agendada roda sozinha só porque o usuário escolheu o intervalo nas configurações.

## Regras gerais

- Nada é executado sem resposta quando a pergunta está ativa. Se o usuário ignorar, nada muda e a pergunta pode voltar no próximo login.
- Cada ação gera uma linha de log, com o que mudou e quanto espaço foi liberado (nas ações de limpeza).
- Ações reversíveis guardam o estado anterior, para o botão "Desfazer" funcionar.
- Execução automática mostra uma notificação discreta no painel, com acesso ao log.
- A pergunta aparece no máximo uma vez por login.

## Limpeza de cache (ações 4 e 5)

- Apaga apenas pastas de cache do usuário (`~/.cache`) e miniaturas (`~/.cache/thumbnails`).
- Nunca toca em documentos, configurações (`~/.config`) ou dados de login de apps.
- Pula apps que estejam em execução naquele ciclo.
- Antes de implementar, listar quais apps guardam dados importantes dentro de cache, para excluir esses caminhos.

## Ordem de implementação

1. Medir na VM o uso de memória e CPU do organizador ligado e desligado, depois do login.
2. Implementar a chave de configuração e a pergunta (sem executar ações).
3. Implementar as ações 1, 2 e 3, com log e desfazer.
4. Implementar as ações 4 e 5, com a regra de confirmação.

## Fora da versão 0.1

- Chat ou qualquer interface de conversa.
- Modelos de linguagem ou aprendizado de máquina.
- Limpeza de dados de usuário, mesmo se o usuário pedir.
- Otimizações de kernel ou de serviços do sistema.

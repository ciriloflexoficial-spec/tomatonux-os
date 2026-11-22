
## Validação do Live Build

- Ambiente: contêiner debian:trixie no GitHub Actions (runner ubuntu-24.04)
- Live Build: versão do repositório Trixie
- Resultado: `lb config` executado sem erro para debian/trixie/amd64
- Estrutura gerada: auto/, config/, local/
- Pendente: construção da ISO (`lb build`)

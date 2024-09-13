# Infraestrutura

Este projeto consiste em um conjunto de utilitários em shell
script para facilitar o gerenciamento de uma infraestrutura
complexa em um ambiente de containers.

## Sumário

- [Conceito](#conceito)
- [Primeiros passos](#primeiros-passos)
- [Organização](#organização)
- [Utilização](#utilização)
- [TODO](#todo)

## Conceito

A ideia é que toda a infraestrutura seja construída em
containers, fazendo com que as aplicações fiquem isoladas o
máximo possível.

Com toda a camada de infraestrutura está abstraída nos
containers, torna-se trivial configurar um servidor novo e
restaurar todos os backups. Os scripts de backup são
otimizados para entregarem integridade, desempenho e baixo
custo de armazenamento.

## Primeiros passos

Escolha a distribuição de sua preferência (desde que tenha
suporte a Docker) e então clone o repositório para ter acesso
aos scripts:

```shell
git clone --depth=1 https://github.com/ulissesjdeo/infraestrutura.git
```

## Organização

Aqui está indicada a estrutura de arquivos do repositório bem como
as funções de cada script e os recursos de cada serviço.

`distros` (Contém as instruções recomendadas de pós-instalação
de algumas das distribuições mais populares)

- `alpine.sh`
- `debian.sh`

`scripts` (Contém utilitários gerais)

- `git.sh` (Configura o git do host)
- `usage.sh` (Verifica os uso de recursos)
- `vanish.sh` (Reset do ambiente Docker)

`services` (Contém os serviços e aplicações suportadas)

  - [PostgreSQL](https://github.com/postgres/postgres)
  - [Gitea](https://github.com/go-gitea/gitea)
  - [Portainer](https://github.com/portainer/portainer)
  - [Syncthing](https://github.com/syncthing/syncthing)
  - [Paper](https://github.com/PaperMC/Paper)


## Utilização

Suponhamos que você queira uma instância do Gitea, basta executar:

```shell
sh services/gitea/install.sh
```

O mesmo pode ser feito para os outros serviços, seguindo com o caso
de você já ter sua instância do Gitea operacional ou já tinha uma
instância com imagem compatível, para fazer o backup completo do Gitea
e o seu banco basta executar:

```shell
sh services/gitea/backup.sh
```

No momento, por padrão, os dados do servidor ficam em `/infra/` e o
backups ficam em `/BACKUP/`, então nosso último backup está em
`/BACKUP/gitea/`, caso queira restaurar os dados no mesmo servidor,
basta executar:

```shell
sh services/gitea/restore.sh /BACKUP/gitea/<ÚLTIMO_BACKUP>.zip
```

Caso você esteja configurando um servidor novo, primeiramente você deve
usar o script de instalação para ter a estrutura inicial para efetivamente
estar apto para restaurar o backup, então execute:

```shell
sh services/gitea/install.sh
sh services/gitea/restore.sh /BACKUP/gitea/<BACKUP_IMPORTADO>.zip
```

## TODO

Aqui estão os recursos a serem implementados:

Aqui estão listados os itens a serem implementados, e, principalmente, os scripts
que faltam para cada serviços em específico, os serviços que não estão listados
são considerados "feature-complete" e basta utilizá-los.

* `papermc` - Restore
* `portainer` - Backup / Restore
* `syncthing` - Restore
* `nginx` - Backup / Restore / Configuração

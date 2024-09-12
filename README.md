# Infraestrutura

O projeto consiste num conjunto de utilitários desenvolvidos em shell script para facilitar o gerenciamento de um infraestrutura complexa em um ambiente de containers, tornando trivial o seu gerenciamento

## Sumário

- [Conceito](#conceito)
- [Primeiros passos](#primeiros-passos)
- [Organização](#organização)
- [Utilização](#utilização)
- [TODO](#todo)

## Conceito

A ideia é montar uma infraestrutura inteiramente em docker
usufruindo de suas funcionalidades para que seus serviços estejam
isolados, rápidos, seguros e sempre atualizados. Um dos pontos
principais que o projeto dá atenção é a facilidade para fazer
backup e restaurá-los, os scripts de backup/restore são montados
partido do princípio que assim que você tiver seu backup salvo
em outra máquina, seu servidor irá pegar fogo e perder tudo que
há lá, mas com o conjunto de utilitários aqui presente, em
pouquíssimo tempo você irá conseguir criar um servidor novo
e restaurar todos os dados.

## Primeiros passos

Escolha o sistema operacional de sua preferência para criar
sua infraestrutura, se você estiver configurando um ambiente novo,
indica-se usar algumas das distribuições com suporte oficial,
elas podem ser encontradas no diretório `scripts`, cada arquivo
`.sh` indica as instruções de pós-instalação de cada sistema.

Após ter o ambiente com Docker e as dependências instaladas
e configuradas conforme o parágrafo anterior, faça sua cópia do
repositório com todos os scripts

```shell
git clone --depth=1 https://github.com/ulissesjdeo/infraestrutura.git
```

No tópico a seguir há a estrutura do projeto com a localização de
cada ferramenta e suas funcionalidades

## Organização

`distros` Contém as instruções de pós-instalação das distribuições
suportadas oficialmente

- `alpine.sh`
- `debian.sh`

`scripts` Contém utilitários gerais

- `git.sh` (configura o uso do git no sistema)
- `usage.sh` (verifica o uso de: CPU, RAM, disco...)
- `vanish.sh` (apaga todos os containers, volumes e imagens)

`services` Serviços disponíveis e os recursos prontos para cada um

- Bancos de dados
  - `postgres` (Instalação)


- Interfaces para bancos de dados
  - `cloudbeaver` (Instalação)


- Git
  - `gitea` (Instalação / Backup / Restore)
  - `gitlab` (Instalação)


- Gerenciamento do servidor
  - `portainer` (Instalação)


- Documentação
  - `wikijs` (Instalação)


- Utilitários
  - `stirlingpdf` (Instalação)


- Arquivos
  - `syncthing` (Instalação)


- Jogos
  - `forge` (Instalação)
  - `papermc` (Instalação)

## Utilização

Para fazer o seu primeiro deploy basta editar o arquivo `deploy.sh`
e remover os comentários das linhas dos serviços a serem utilizados.

Se você preferir, você pode também fazer o deploy manualmente, suponha
que você queira uma instância do Gitea, basta executar:

```shell
sh services/gitea/install.sh
```

O mesmo pode ser feito para os outros serviços, seguindo com o caso
de você já ter sua instância do Gitea operacional ou já tinha uma
instância com imagem compatível, para fazer o backup de todos os dados
do Gitea e o seu banco basta executar:

```shell
sh services/gitea/backup.sh
```

No momento, por padrão, os dados do servidor ficam em `/infra/` e o
backups ficam em `/BACKUP/`, então nosso último backup está em `/BACKUP/gitea/`,
caso queira restaurar os dados no mesmo servidor, basta executar:

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

Aqui estão listados os itens a serem implementados, e, principalmente, os scripts
que faltam para cada serviços em específico, os serviços que não estão listados
são considerados "feature-complete" e basta utilizá-los.

* `cloudbeaver` - Backup / Restore
* `forge` - Fazer funcionar / Backup / Restore
* `gitlab` - Backup / Restore
* `papermc` - Fazer funcionar / Backup / Restore
* `portainer` - Backup / Restore
* `syncthing` - Configuração
* `wikijs` - Backup / Restore

Serviços para serem implementados:

* `nginx` - Instalação / Backup / Restore / Configuração

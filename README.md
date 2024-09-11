# Infraestrutura

O projeto consiste num conjunto de utilitários desenvolvidos em shell script para facilitar o gerenciamento de um infraestrutura complexa em um ambiente de containers, tornando trivial o seu gerenciamento

## Sumário

- [Conceito](#conceito)
- [Primeiros passos](#primeiros-passos)
- [Organização](#organização)

## Conceito

A ideia é montar uma infraestrutura inteiramente em docker usufruindo de suas funcionalidades para que seus serviços estejam isolados, rápidos, seguros e sempre atualizados. Um dos pontos principais que o projeto dá atenção é a facilidade para fazer backup e restaurá-los, os scripts de backup/restore são montados partido do princípio que assim que você tiver seu backup salvo em outra máquina, seu servidor irá pegar fogo e perder tudo que há lá, mas com o conjunto de utilitários aqui presente, em pouquissímo tempo você irá conseguir criar um servidor novo e restaurar todos os dados.

## Primeiros passos

Escolha o sistema operacional de sua preferência para criar sua infraestrutura, se você estiver configurando um ambiente novo, indica-se usar algumas das distribuições com suporte oficial, elas podem ser encontradas no diretório `scripts`, cada arquivo `.sh` indica as instruções de pós-instalação de cada sistema.

Após ter o ambiente com Docker e as dependências instaladas e configuradas conforme o parágrafo anterior, faça sua cópia do repositório com todos os scripts

```
git clone --depth=1 https://github.com/ulissesjdeo/infraestrutura.git
```

No tópico a seguir há a estrutura do projeto com a localização de cada ferramenta e suas funcionalidades

## Organização

`distros` Contém as instruções de pós-instalação das distribuições suportadas oficialmente

- `alpine.sh`
- `debian.sh`
- `openwrt.sh`

`scripts` Contém utilitários gerais

- `git.sh` (configura o uso do git no sistema)
- `usage.sh` (verifica o uso de: CPU, RAM, disco...)
- `vanish.sh` (apaga todos os containers, volumes e imagens)

`services` Serviços disponíveis e os recursos prontos para cada um

- Bancos de dados
  - `mariadb` (Instalação)
  - `postgres` (Instalação)


- Interfaces para bancos de dados
  - `cloudbeaver` (Instalação)


- Git
  - `gitea` (Instalação / Backup / Restore)
  - `gitlab` (Instalação)
  - `gogs` (Instalação)


- Gerenciamento do servidor
  - `portainer` (Instalação)


- Documentação
  - `wikijs` (Instalação)


- Arquivos
  - `syncthing` (Instalação)


- Jogos
  - `forge` (Instalação)
  - `papermc` (Instalação)

## Utilização

Para fazer o seu primeiro deploy basta editar o arquivo `deploy.sh` e remover os comentários das linhas dos serviços a serem utilizados.

Se você preferir, você pode também fazer o deploy manualmente, suponha que você queira uma instância do Gitea, basta executar:

````
sh services/gitea/install.sh
````

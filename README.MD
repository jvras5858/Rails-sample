# RubyOnRails_sample

Uma API minimalista em Ruby on Rails para criação rápida de serviços REST, utilizando Docker para facilitar configuração, hospedagem e isolamento do ambiente de desenvolvimento.

## Índice

- [Sobre o Projeto](#sobre-o-projeto)
- [Tecnologias Utilizadas](#tecnologias-utilizadas)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Pré-requisitos](#pré-requisitos)
- [Montando o Ambiente](#montando-o-ambiente)
- [Como Utilizar](#como-utilizar)
  - [Iniciar o Servidor](#iniciar-o-servidor)
  - [Exemplo de Upload de Arquivo](#exemplo-de-upload-de-arquivo)
- [Endpoints Disponíveis](#endpoints-disponiveis)
- [Recursos Adicionais](#recursos-adicionais)

## Sobre o Projeto

Este repositório serve como base para APIs em Rails, integrando [Ruby on Rails](https://rubyonrails.org/) com SQLite e suporte ao Swagger para documentação interativa. O uso de Docker garante um ambiente de desenvolvimento consistente e fácil de replicar.

## Tecnologias Utilizadas

| Tecnologia                | Versão    |
|---------------------------|-----------|
| **Ruby on Rails**         | 7.x       |
| **Banco de Dados**        | SQLite    |
| **Documentação**          | Swagger   |
| **Ambiente**              | Docker Engine |

## Estrutura do Projeto

```txt
/
├─📁 .devcontainer          -> Configurações do Dev Container para VS Code
├─📁 app                    -> Código-fonte Rails
├─📁 config                 -> Configurações do Rails
├─📁 db                     -> Migrações e schema
├─📁 public                 -> Arquivos públicos (ex: robots.txt)
├─ README.md
└─ Dockerfile / docker-compose.yml
```

## Pré-requisitos

- [Docker Engine](https://docs.docker.com/engine/install/) instalado e configurado.
- [VS Code](https://code.visualstudio.com/) com a extensão **Remote Development** ([ms-vscode-remote.vscode-remote-extensionpack](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)).

## Montando o Ambiente

1. **Clone o repositório**:
   ```sh
   git clone <URL do repositório>
   ```
2. **Abra o diretório no VS Code**.
3. Execute **Dev Containers: Reopen in Container** na paleta de comandos (F1 ou Ctrl+Shift+P) para iniciar o ambiente isolado conforme definido em `.devcontainer/devcontainer.json`.

## Como Utilizar

### Iniciar o Servidor

Para iniciar o servidor Rails:
```sh
rails s
```
O servidor estará disponível em `http://localhost:3000`.

### Exemplo de Upload de Arquivo

Após instalar o Active Storage e executar as migrações:
```sh
rails active_storage:install --Já instalado e migrado...
rails db:migrate
```

Você pode realizar um upload de arquivo via API:
```sh
curl -X POST http://localhost:3000/api/posts \
  -F "post[title]=Hello" \
  -F "post[content]=World" \
  -F "file=@public/robots.txt"
```
> O arquivo `robots.txt` está disponível no template como exemplo.

## Endpoints Disponíveis

| Método  | Endpoint                 | Descrição                      |
|---------|--------------------------|--------------------------------|
| GET     | `/api/v1/posts`          | Lista todos os posts           |
| POST    | `/api/v1/posts`          | Cria um novo post (multipart para upload de arquivo) |
| GET     | `/api/v1/posts/:id`      | Exibe um post específico       |
| PATCH   | `/api/v1/posts/:id`      | Atualiza um post               |
| DELETE  | `/api/v1/posts/:id`      | Remove um post                 |

## Recursos Adicionais

- **Swagger**: Durante o desenvolvimento, acesse a documentação interativa da
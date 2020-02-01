
# Moodle Docker UemaNet/UEMA

Este repositório é um laboratório para auxiliar a disponibilização dos conteúdos do AVA do programa Ciência é 10 da CAPES.

## Procedimentos

### Criação da imagem docker

A definição da imagem docker está contida no arquivo **Dockerfile**, para criar uma nova imagem basta executar o seguinte comando:

```sh
$ docker build -t moodle:3.8 .
```

Para a criação desta imagem utilizamos as seguintes tecnologias:

- Ubuntu 19.10
- PHP 7.3
- Apache 2.4

### Inicialização dos containers

Para facilitar a inicialização dos containers nós utilizamos o docker composer, todas as configurações podem ser visualizadas e alteradas no arquivo **docker-compose.yml**.

Para facilitar ainda mais, foi criado um arquivo make com alguns comandos para instalação de uma instância do Moodle VAZIA, ou para efetuar a cópia do ambiente do Ciência é 10.

Para criar os containers referentes ao ambiente do Ciência é 10, execute os comandos a seguir em ordem:

```sh
$ make init
$ make copyfiles
$ make importdb
$ make upgrade
```

Pronto, você já pode acessar sua instância do ambiente do Ciência é 10! As credenciais de acesso são:

> URL: http://localhost:8080

> Usuário: **admin**

> Senha: **1234**

Para criar uma instância vazia do Moodle(testes e curiosidades, não tem relação com o programa Ciência é 10), execute o comando abaixo:

```sh
$ make cleaninstall
```

As credenciais de acesso são:

> URL > http://localhost:8080

> Usuário: **admin**

> Senha: **soMePass123**

Criado por: [Willian Mano](https://github.com/willianmano)

Agradecimentos:

[Felipe Pimenta](https://github.com/orgs/uemanet/people/fhpimenta)
# Crawling

## Instalação

Para que seja possível a execução do código, é necessário que esteja instalado o Elixir e o Erlang na máquina. No caso, a máquina usada, é um Debian/Ubuntu.

Se ainda não possui nenhum dos itens citados instalados, segue um pequeno tutorial de como instalar os recursos: https://bit.ly/34GbUVE

A versão em uso é a **Elixir 1.9.2** e **Erlang/OTP 22**

## Execução 

Uma vez que o Elixir e o Erlang estão instalados, basta fazer o download do arquivo e extrair em algum lugar de sua preferência.

Logo após, podemos abrir o terminal dentro da pasta Crawling

``` yourmachine:~/crawling$ ```

Agora, podemos baixar as dependências executando o comando: ```mix deps.get``` e em seguida o ```iex -S mix``` com isso, estaremos no ambiente de execução de código, necessitando apenas chamar nosso módulo e suas respectivas funções.

****Certifique que você está com o seguinte prompt no seu terminal***

```iex(1)>```

Assumindo que esteja assim, podemos descrever as funções que usaremos para retorno de nossas requisições, sendo elas:

**get_url()**, 
**get_assets_img()**, 
**get_assets_js()**, 
**get_assets_css()**

Todas as funções estão localizadas dentro do arquivo ***lib/crawling.ex***. Agora, iremos executar o seguinte trecho de código, que nos retornara todas as urls dentro do https://elixir-lang.org/ 

```iex(1)>Crawling.get_url```

Em seguida, podemos executar no mesmo padrão, para retorno dos assets da página, alterando somente o tipo (img, js, css).

```iex(1)>Crawling.get_assets_js```

Com isso, obtemos os resultados via terminal de cada informação descrita na página.

### Considerações

O teste foi bem bacana, tendo em vista que o código não está retornando conforme o que fora cobrado, por exemplo, os assets retornados, deveriam ser retornados para cada página linkada dentro elixir-lang.org. Isso não foi possível, pois depois de infindáveis tentativas, a complexidade do código aumentou e alguns bugs vinham acontecendo.

Pelo Elixir trabalhar com funções, a repetição das mesmas, não causam "tanto" problema performático. Isso poderia ser um problema, se eu estivesse usando uma outra linguagem Orientada a Objeto. Porém, ainda é necessário uma refatoração. Além do mais, o código dentro do **lib/crawling.ex** está comentando, citando algumas situações que eu estava tentando para melhor resolver os problemas do desafio, contudo, não foi possível. 

Agradeço a oportunidade e até breve.

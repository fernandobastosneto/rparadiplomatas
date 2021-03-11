install.packages("tidyverse")

# O básico do R ----

## O R como Calculadora ----

### Qual o resultado? (aperte ctrl + enter em cada linha)

4 + 21 * 3

4 + 3 / 10^3

pi - 3

## Criação de Variáveis ----

## (para criar variáveis, usamos o operador "<-" seguido
## do valor que desejamos inserir na variável)

a <- 5

### Após definir uma variável, e possível observá-la na
### aba "Environment" do RStudio.

a <- a * 5

a <- a + 10

a <- seq(a, 100, 5)

## Remoção de Objetos

### (o comando abaixo remove todos os objetos do
### ambiente)

rm(list = ls())

## Vetores ----

### (ao trabalhar com base de dados, em geral, os objetos
### do R são tratados como vetores. Por isso, compreender
### o funcionamento de vetores é fundamental.)
### Criamos vetores usando a função "c" (de concatenate)

numeros <- c(1, 4, 10, pi, 1/3)

texto <- c("a", "b", "Itamaraty", "SCAEC")

tudo_junto <- c(numeros, texto)

### Seleção de elementos de vetores pelo índice.

numeros[2]

numeros[4]

texto[3]

texto[c(1, 3)]

texto[5]

### Importante notar que, dentro de um vetor, quando agregamos
### números e textos, todos os elementos do vetor são transformados
### em *textos*.

## Funções ----

### (Como calcular a média de uma sequência de mil números?)

sequencia_mil_numeros <- 1:1000

mean(sequencia_mil_numeros)

median(sequencia_mil_numeros)

### O R vem com um conjunto de funções amplo de funções.
### Iremos observar com maior detalhe o funcionamento de funções posteriormente.

## Tipos de Dados ----

### Números
### (números podem ser "double" ou "integer")

integers <- 1:10
typeof(integers)

doubles <- c(1.3, 1.5, 1.0)
typeof(doubles)

### Texto
### (texto sempre são characters)

texto <- "Este é o curso r para diplomatas"
typeof(texto)

### Fatores
### (factors são um pouco mais abstratos, servem
### para ordenar categorias)

factor <- factor(c("Produtos Industrializados", "Produtos Básicos"))
typeof(factor)
class(factor)

### Valores Lógicos
### (um dos conceitos mais importantes para selecionarmos apenas
### objetos de nosso interesse dentro de um banco de dados.
### veremos esses operadores com mais detalhe ao longo do curso.)

verdade <- is.character(texto) == TRUE

mentira <- is.character(integers) == TRUE

verdade == verdade

verdade == mentira

numeros[numeros > 3]
numeros[numeros < 2]

### Valores especiais

not_available <- NA
null <- NULL
infinito <- Inf
nan <- NaN

## Dataframes ------

### (dataframes são coleções de vetores dispostos lado a lado.
### é o formato mais utilizado para análise e processamento de dados.
### outros formatos de dados serão observados ao longo do curso)

nomes <- c("Fernando", "José", "Maria", "Cláudia")
classe <- c("TS", "SS", "PS", "Conselheiro")
antiguidade <- c(3, 5, 9, 15)

diplomatas <- data.frame(nomes, classe, antiguidade)

nrow(diplomatas)
ncol(diplomatas)
head(diplomatas)
summary(diplomatas)

# Exercícios - Introdução ao R (retirados de Curso R: https://github.com/curso-r/202102-intro-programacao/blob/master/exercicios/1-introducao.R)

# objetos -----------------------------------------------------------------

# (a) Crie um vetor com o nome de tres frutas e guarde em um objeto chamado frutas.

# (b) Use a função length() para contar o tamanho do vetor. Certifique-se que retorna 3.

# (c) Use [] para retornar a primeira fruta do vetor.

# (d) Inspecione a saída de 'paste("eu gosto de", frutas)' e responda se o tamanho do vetor mudou.

# vetores e funcoes ---------------------------------------------------------

# 1. Analise as duas linhas de códigos abaixo:
c(1,2,3) - 1           # código 1
c(1,2,3) - c(1,1,1)    # código 2
# Os resultados são iguais? Por que?

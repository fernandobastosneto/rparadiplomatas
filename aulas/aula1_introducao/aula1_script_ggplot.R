# Gramática dos Gráficos ----- (script inspirado pelo material da Curso-R (https://github.com/curso-r/main-visualizacao))


library(tidyverse)
library(dados)
library(fmi)

paises_selecionados <- c("Brazil", "China, People's Republic of", "United States")

dados_fmi <- fmi %>% 
  mutate(ano = as.integer(ano)) %>% 
  filter(pais %in% paises_selecionados) %>% 
  mutate(pais = case_when(str_detect(pais, "China") ~ "China",
                                     TRUE ~ pais))
  
# Filosofia ---------------------------------------------------------------

# Um gráfico estatístico é uma representação visual dos dados 
# por meio de atributos estéticos (posição, cor, forma, 
# tamanho, ...) de formas geométricas (pontos, linhas,
# barras, ...). Leland Wilkinson, The Grammar of Graphics

# Layered grammar of graphics: cada elemento do 
# gráfico pode ser representado por uma camada e 
# um gráfico seria a sobreposição dessas camadas.
# Hadley Wickham, A layered grammar of graphics 

# Primeiro Gráfico ------

ggplot(data = dados_fmi) +
  geom_point(mapping = aes(x = ano, y = desemprego))

# Incluindo primeiras características estéticas

ggplot(data = dados_fmi) +
  geom_point(mapping = aes(x = ano, y = desemprego, color = pais))

# Exercício - Crie um gráfico que identifique, em pontos, a variação da inflação
## de Brasil, EUA e China.




# -----


# Além de "cores" é possível incluir característica estética "size"
# para indicar o tamanho de cada observação do gráfico.

ggplot(data = dados_fmi) +
  geom_point(mapping = aes(x = ano, y = desemprego, 
                           color = pais, size = inflacao))

# MUITA ATENÇÃO! se o argumento "color" for incluído fora da função "aes"
# o gráfico não funcionará.

ggplot(data = dados_fmi) +
  geom_point(mapping = aes(x = ano, y = desemprego), color = "vermelho")

# No entanto, se você colocar o nome da cor em inglês, o gráfico ficará todo da cor especificada.

ggplot(data = dados_fmi) +
  geom_point(mapping = aes(x = ano, y = desemprego), color = "red")

## Exercício - crie um gráfico de desemprego por ano, mas com uma variável à sua escolha
## no atributo "cor"

# Figuras Geométricas -----

## Gráficos de linha

ggplot(data = dados_fmi) +
  geom_line(mapping = aes(x = ano, y = desemprego, color = pais))

## Geom Smooth

ggplot(data = dados_fmi) +
  geom_line(mapping = aes(x = ano, y = desemprego, color = pais)) +
  geom_smooth(mapping = aes(x = ano, y = desemprego))

## Geom Area

ggplot(data = dados_fmi) +
  geom_area(mapping = aes(x = ano, y = desemprego, fill = pais))

## Geom Col

ggplot(data = dados_fmi) +
  geom_col(mapping = aes(x = ano, y = desemprego, fill = pais))

# Facets ------

ggplot(data = dados_fmi) +
  geom_line(mapping = aes(x = ano, y = desemprego)) +
  facet_wrap(~ pais)

ggplot(data = dados_fmi) +
  geom_line(mapping = aes(x = ano, y = desemprego)) +
  facet_wrap(~ pais, nrow = 3)

ggplot(data = dados_fmi) +
  geom_line(mapping = aes(x = ano, y = desemprego)) +
  facet_wrap(~ pais, scales = "free")

# Exercício - O que acontece quando se coloca no facet uma variável contínua? -----


# Ajuste de Posição ----

ggplot(data = dados_fmi) +
  geom_col(mapping = aes(x = ano, y = desemprego))

## Ajuste de posição - dodge, identity ou fill

ggplot(data = dados_fmi) +
  geom_col(mapping = aes(x = ano, y = desemprego, fill = pais),
           position = "identity", alpha = 0.7)

dados_fmi %>% 
  filter(ano > 2020) %>% 
  ggplot() +
  geom_col(mapping = aes(x = ano, y = desemprego, fill = pais),
           position = "dodge")

ggplot(data = dados_fmi) +
  geom_col(mapping = aes(x = ano, y = desemprego, fill = pais),
           position = "fill")

# Sistema de Coordenadas ----

ggplot(data = dados_fmi, mapping = aes(x = pais, y = desemprego)) +
  geom_boxplot()

ggplot(data = dados_fmi, mapping = aes(x = pais, y = desemprego)) +
  geom_boxplot() +
  coord_flip()

# Título, fontes e comentários

ggplot(data = dados_fmi) +
  geom_line(aes(ano, desemprego, color = pais)) +
  labs(title = "Desemprego, em %",
       subtitle = "A partir de 1980",
       caption = "Fonte: World Economic Outlook, FMI")

# Exercícios

# Crie um gráfico que compare, com facets, cores, 
# o crescimento do PIB dos três países.

ggplot(dados_fmi) +
  geom_line(aes(ano, gdpgrowth, color = pais)) +
  facet_wrap(~ pais)

# O que está errado no código abaixo?

ggplot(data = dados_fmi) + 
  geom_point(mapping = aes(x = ano, y = dividaliquida, color = "blue"))

# A partir do objeto "exportacoes", com informações sobre as exportações do Brasil
# no ano de 2020, construa gráfico de colunas cujo preenchimento das colunas represente
# os países para os quais o Brasil exportou cada produto.

paises_selecionados_br <- c("Argentina", "Estados Unidos", "China")
exportacoes <- readr::read_csv2("dados/exportacoes2020.csv") %>% 
  filter(no_pais %in% paises_selecionados_br)




############################################################################
########                    Lista 8 - Ex 3                          ########
############################################################################
library(wooldridge)
library(ivreg)

dados <- fertil2

## a)

modelo <- lm(children ~ educ + age + I(age^2), data=dados)
summary(modelo)

# Efeito estimado: para cada um ano de aumento na escolaridade, diminue
# em 0.09 o número de filhos. Se 100 mulheres completassem mais 1 ano, em
# média, diminuiria 9 filhos.

## b)
modelo <- lm(educ ~ frsthalf + age + I(age^2), data = dados)
summary(modelo)

# Fazendo a reg de "educ" em "frsthalf" vemos que essa variável é correlacionada
# com educ, e assumindo que é não correlacionada com os erros, se torna
# uma candidata a variável instrumental.

## c)
modelo_iv <- ivreg(children ~ educ + age + I(age^2) | frsthalf + age + I(age^2), data=dados)
summary(modelo_iv)

# Efeito: para cada ano de estudo, o número médio de filhos diminui 0.17.
# ou seja, a estimativa é de que o número de anos de educação tenha mais
# impacto no número de filhos.

## d)
modelo <- lm(children ~ educ + age + I(age^2) + electric + tv + bicycle,
             data=dados)
modelo_iv <- ivreg(children ~ educ + age + I(age^2) + electric + tv + bicycle | frsthalf + age + I(age^2) + electric + tv + bicycle,
                   data=dados)

summary(modelo)
summary(modelo_iv)

# O coeficiente de educ saiu de -0.076 sem a iv para -0.163 com a iv, aumentando
# o impacto que os anos de educação exercem na quantidade de filhos

# Alem disso, no primeiro caso "tv" possui um coeficiente negativo, indicando que
# para cada uma unidade de aumento em tv, há 0.25 unidades diminuídas em filhos,
# fixando as outras variáveis. Mas no segundo modelo, "tv" já não é mais 
# significativo.


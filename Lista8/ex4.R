############################################################################
########                    Lista 8 - Ex 4                          ########
############################################################################
library(wooldridge)
library(ivreg)

dados <- intdef
?intdef

## a)
modelo <- lm(i3 ~ inf, data = dados)
summary(modelo)

## b)
modelo_iv <- ivreg(i3 ~ inf | inf_1, data = dados)
summary(modelo_iv)

# No primeiro caso, o coeficiente de inf era de 0.64, mas ao utilizar a iv
# passou a ser de 0.9, tendo um efeito muito mais intenso doq o anterior.

## c)
modelo2 <- lm(ci3 ~ cinf, data=dados)
summary(modelo2)

# O coeficiente de cinf é menor do que os da primeira e segunda regressão.

## d)
summary(lm(cinf ~ inf_1, data = dados))
# considerando que inf_1 é exógena, podemos utilizá-la como iv para cinf
modelo3 <- ivreg(ci3 ~ cinf | inf_1, data=dados)
summary(modelo3)

# agora cinf não é mais significativo

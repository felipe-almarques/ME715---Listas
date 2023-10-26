################################################################################
############                    Exercício 2 - R                     ############
################################################################################

# Pacotes
library(wooldridge)

# Dados
dados <- hprice1

# Ajuste dos modelos
modelo1 <- lm(log(price) ~ lotsize + sqrft + bdrms, data=dados)
modelo2 <- lm(log(price) ~ log(lotsize) + log(sqrft) + bdrms, data=dados)

summary(modelo1)
summary(modelo2)

dados$yhat <- modelo2$fitted.values
modelo <- lm(log(price) ~ lotsize + sqrft + bdrms + yhat, data=dados)

summary(modelo)
# p-valor = 0.0215 => yhat é significativo a análise, portanto, modelo 1 está
# incorretamente especificado em função. Eu preferiria o modelo 2
# O resultado encontrado está de acordo com o do teste de Mizon e Richard.



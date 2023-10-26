install.packages("wooldridge")
install.packages("lmtest")

library(wooldridge)
library(lmtest)
data("")
data("ceosal1")

ceosal1$rosneg <- ifelse(ceosal1$ros < 0, 1, 0)
attach(ceosal1)

model <- lm(log(salary) ~ log(sales) + roe +
              rosneg, data=ceosal1)
summary(model)

resettest(model, power=2:3, type="fitted")
#p-value 0.26, Se esta bem especificado o modelo



modelo_quadrados <- lm(narr86 ~ pcnv +
                         I(pcnv^2)+ avgsen + tottime + ptime86 +
                         I(ptime86^2) + qemp86 + inc86 + 
                         I(inc86^2) + black + hispan, data = crime1)
round(summary(modelo_quadrados)$coefficients, 4)
modelo_reduced <- lm(narr86 ~ pcnv + avgsen + 
                       tottime + ptime86 + qemp86 + 
                       inc86 + black + hispan, data = crime1)
test <- anova(modelo_reduced, modelo_quadrados)
print(test)


modelo <- lm(price ~ lotsize + sqrft + bdrms, data = hprice1)
modelo_expandido <- lm(price ~ lotsize + sqrft + bdrms + I(fitted(modelo)^2) +I(fitted(modelo)^3), data = hprice1)
anova(modelo_expandido, modelo)$Pr[2]
summary(modelo)
modelo_quadrado <- lm(price ~ lotsize + sqrft + bdrms + I(lotsize^2) + I(sqrft^2), data = hprice1)
round(summary(modelo_quadrado)$coefficients, 4)

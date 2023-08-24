#4. Utilize o dataset HTV, estime o modelo de regresÃ£o
#educ = Î²0 + Î²1motheduc + Î²2fatheduc + Î²3abil + Î²4abil2 + u
#e interprete os resultados.

install.packages("wooldridge")
library(wooldridge)
data(htv)
view(htv)

modelo_htv <- lm(educ ~ motheduc + fatheduc + abil + I(abil^2), data = htv)
coef(modelo_htv)
anova(modelo_htv)
summary(modelo_htv)

## Para cada unidade de aumento em motheduc, educ aumenta em 0.19 unidades, 
# mantendo as demais variáveis constantes. A interpretação é similar para as outras.
# Já para abil, a fórmula de incremento é "educ = 0.40 + 0.10abil"

# 3. Seja o modelo de interesse: 
#   log(wage) = β0 + β1 educ + β2 exper + β3 tenure + β4married+ β5 south + β6urban + β7 black + β8abil + β9 educ ∗ abil + u.
# 
# Contudo, abil é não observada e precisamos utilizar alguma variável proxy. Utilize o dataset wage2 para ajustar o modelo.

#a. Use a variável QI como proxy para abil. Qual o retorno estimado para a educação nesse caso?

modeloQ3a <- lm(I(log(wage)) ~ educ + exper + tenure + married + south + urban + black + IQ + I(educ*IQ),wage2)
summary(modeloQ3a)
coef(modeloQ3a)[[2]]

# b. Use a variável KWW (conhecimento do mundo do trabalho) como proxy para abil. Qual o retorno estimado para a educação nesse caso?
modeloQ3b <- lm(I(log(wage)) ~ educ + exper + tenure + married + south + urban + black + KWW + I(educ*KWW),wage2)
summary(modeloQ3b)
coef(modeloQ3b)[[2]]


# c. Use QI e KWW juntas como proxy para abil. O que acontece com o retorno estimado para a educação?
modeloQ3c <- lm(I(log(wage)) ~ educ + exper + tenure + married + south + urban + black + KWW + IQ + I(educ*IQ) + I(educ*KWW),wage2)
summary(modeloQ3c)
coef(modeloQ3c)[[2]]


# d. Iq e KWW sao individualmente significativas? Elas sao conjuntamente
# significativas?
anova(modeloQ3a, modeloQ3c) # KWW é
anova(modeloQ3b, modeloQ3c) # IQ é
modeloQ3d <- lm(I(log(wage)) ~ educ + exper + tenure + married + south + urban + black, wage2)
anova(modeloQ3d, modeloQ3c)

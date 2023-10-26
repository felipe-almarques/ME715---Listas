using WooldridgeDatasets, DataFrames, Statistics, GLM

# Dados
wage2 = DataFrame(wooldridge("wage2"))

# a. Use a variável QI como proxy para abil
modeloQ3a = lm(@formula(log(wage) ~ educ + exper + tenure + married + south + urban + black + IQ + educ*IQ), wage2)
println("a. Retorno estimado para a educação (QI como proxy): ", coef(modeloQ3a)[2])

# b. Use a variável KWW como proxy para abil
modeloQ3b = lm(@formula(log(wage) ~ educ + exper + tenure + married + south + urban + black + KWW + educ*KWW), wage2)
println("b. Retorno estimado para a educação (KWW como proxy): ", coef(modeloQ3b)[2])

# c. Use QI e KWW juntas como proxy para abil
modeloQ3c = lm(@formula(log(wage) ~ educ + exper + tenure + married + south + urban + black + KWW + IQ + educ*IQ + educ*KWW), wage2)
println("c. Retorno estimado para a educação (QI e KWW juntos como proxy): ", coef(modeloQ3c)[2])

# d. Verifique a significância das variáveis IQ e KWW individualmente e conjuntamente
anovaD = anova(modeloQ3a, modeloQ3c)
println("d. Significância individual e conjunta de IQ e KWW (QI como proxy): ", anovaD)

anovaD = anova(modeloQ3b, modeloQ3c)
println("d. Significância individual e conjunta de IQ e KWW (KWW como proxy): ", anovaD)

modeloQ3d = lm(@formula(log(wage) ~ educ + exper + tenure + married + south + urban + black), wage2)
anovaD = anova(modeloQ3d, modeloQ3c)
println("d. Significância conjunta de IQ e KWW (modelo sem IQ e KWW): ", anovaD)

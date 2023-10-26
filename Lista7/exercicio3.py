import wooldridge
import statsmodels.formula.api as smf
import statsmodels.api as sm
import numpy as np
from scipy import stats
# 3. Seja o modelo de interesse: 
#   log(wage) = β0 + β1 educ + β2 exper + β3 tenure + β4married+ β5 south + β6urban + β7 black + β8abil + β9 educ ∗ abil + u.
# 
# Contudo, abil é não observada e precisamos utilizar alguma variável proxy. Utilize o dataset wage2 para ajustar o modelo.

#a. Use a variável QI como proxy para abil. Qual o retorno estimado para a educação nesse caso?

modeloQ3a = smf.ols(formula = 'np.log(wage) ~ educ + exper + tenure + married + south + urban + black + IQ + I(educ*IQ)', data = wage2).fit()
modeloQ3a.params
modeloQ3a.params[1]

# b. Use a variável KWW (conhecimento do mundo do trabalho) como proxy para abil. Qual o retorno estimado para a educação nesse caso?
modeloQ3b = smf.ols(formula = 'np.log(wage) ~ educ + exper + tenure + married + south + urban + black + KWW + I(educ*KWW)', data = wage2).fit()
modeloQ3b.params
modeloQ3b.params[1]


# c. Use QI e KWW juntas como proxy para abil. O que acontece com o retorno estimado para a educação?
modeloQ3c = smf.ols(formula = 'np.log(wage) ~ educ + exper + tenure + married + south + urban + black + KWW + IQ + I(educ*IQ) + I(educ*KWW)', data = wage2).fit()
modeloQ3c.params
modeloQ3c.params[1]


# d. Iq e KWW sao individuasmf.olsente significativas? Elas sao conjuntamente
# significativas?
sm.stats.anova_lm(modeloQ3a, modeloQ3c) # KWW é
sm.stats.anova_lm(modeloQ3b, modeloQ3c) # IQ é
modeloQ3d = smf.ols(formula = 'np.log(wage) ~ educ + exper + tenure + married + south + urban + black', data = wage2).fit()
sm.stats.anova_lm(modeloQ3d, modeloQ3c) # conjuntamente são

!pip install wooldridge
!pip install statsmodels.formula.api
import wooldridge as woo
import pandas as pd
import statsmodels.formula.api as smf

# Carregue o dataset HTV (certifique-se de ter o arquivo .csv no mesmo diretório ou forneça o caminho correto)
data = woo.dataWoo('htv')
# Crie a variável 'abil^2'
data['abil_squared'] = data['abil'] ** 2

# Especifique o modelo de regressão usando a fórmula
modelo = smf.ols(formula="educ ~ motheduc + fatheduc + abil + abil_squared", data=data).fit()

# Imprima os resultados
print(modelo.summary())

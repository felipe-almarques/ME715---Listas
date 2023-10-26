########################################################################################
######################            Exercício 2 - Python            ######################
########################################################################################

import wooldridge as wd
import statsmodels.formula.api as smf
from numpy import log

# Dados
dados = wd.dataWoo("hprice1")

# Ajuste dos modelos

reg1 = smf.ols(formula='log(price) ~ lotsize + sqrft + bdrms', data=dados)
reg2 = smf.ols(formula='log(price) ~ log(lotsize) + log(sqrft) + bdrms', data=dados)

modelo1 = reg1.fit()
modelo2 = reg2.fit()

# print(modelo1.summary())
# print(modelo2.summary())

dados['yhat'] = modelo2.fittedvalues

reg = smf.ols(formula='log(price) ~ lotsize + sqrft + bdrms + yhat', data=dados)
modelo = reg.fit()
print(modelo.summary())

# p-valor = 0.0215 => yhat é significativo a análise, portanto, modelo 1 está
# incorretamente especificado em função. Eu preferiria o modelo 2
# O resultado encontrado está de acordo com o do teste de Mizon e Richard.
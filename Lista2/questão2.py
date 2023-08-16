import wooldridge as wd
import pandas as pd
import statsmodels.formula.api as smf
import matplotlib.pyplot as plt

dados = wd.data("BWGHT")

#### a)
## Ajustando a regressão

reg = smf.ols(formula='bwght ~ cigs', data=dados)
resultado = reg.fit()
print(resultado.summary())

plt.scatter('cigs', 'bwght', data=dados)
plt.plot(dados['cigs'], resultado.fittedvalues, color='black', marker='', linestyle='-')
#plt.show()

beta = resultado.params

print(f'Para cigs = 20, bwght = {beta[0] + 20 * beta[1]}')

#######
# b)

'''
Não, pois as informações são foram obtidas de maneira observacional, e não experimental, dessa 
forma não é possível controlar as demais variáveis para que se mantenham cte, sem afetar qualquer
relação de causa e efeito. Portanto, não é possível tomar este tipo de conclusão.
'''

##### 
# c)
mag_cigs = (125 - beta[0])/beta[1]
print(f'Deveria ser de {mag_cigs}')

#####
# d)
prop = dados[dados['cigs'] == 0].shape[0] / dados.shape[0]
print(f'Proporção: {prop}')

max = dados['bwght'].max()
print(f'Peso máximo: {max}')

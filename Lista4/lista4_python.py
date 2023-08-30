import pandas as pd
import wooldridge as woo
from numpy import log 
from scipy.stats import t
import statsmodels.formula.api as smf

#### Questão 3 ####
dados = woo.dataWoo('rdchem')
modelo = smf.ols(formula='rdintens ~ log(sales) + profmarg', data=dados)
results = modelo.fit()
print(results.summary())

# a)
# Mantendo "profmarg" fixo, para cada uma unidade de aumento em sales, rdintes aumenta em 0,003%.

# b) 
tstat = 0.3213/0.216
pval = 1 - t.cdf(tstat, dados.shape[0])
print(f'P-valor = {pval.round(4)}, não rejeitamos H_0')

# c)
# 5% de lucro como porcentagem das vendas, não é economicamente grande

# d)
# profmarg tem um p-valor de 0.283, portanto não é estatisticamente significativo


#### Questão 4 ####
dados = woo.dataWoo('gpa1')
modelo = smf.ols(formula="colGPA ~ skipped + hsGPA + ACT",data=dados)
results = modelo.fit()
print(results.summary())

# a)
print(results.conf_int(0.05))
# CI[95%] = [0.226582, 0.597050]

# b)
tstats = (0.4118 - 0.4)/0.094
pval = 2 * t.cdf(-abs(tstats), dados.shape[0])
print(f'Hipótese nula: b1=0.4 vs b1 != 0.4\nP-valor = {pval}, não rejeitamos H0\n')

# c)
tstats = (0.4118 - 1)/0.094
pval = 2 * t.cdf(-abs(tstats), dados.shape[0])
print(f'Hipótese nula: b1=1 vs b1 != 1\nP-valor = {pval}, rejeitamos H0\n')

# d)
hipoteses = ['skipped=0', 'ACT=0']
ftest = results.f_test(hipoteses)
print(ftest)
# Rejeitamos H0

#### Questão 5 ####
dados = woo.dataWoo('wage2')
modelo = smf.ols(formula="log(wage) ~ educ + exper + tenure", data=dados)
results = modelo.fit()

# a)
hipoteses = ['educ=0', 'exper=0', 'tenure=0']
ftest = results.f_test(hipoteses)
print(ftest) # Rejeitamos H0

# b)
hipoteses = ['exper=tenure']
ftest = results.f_test(hipoteses)
print(ftest) # Não rejeitamos H0

# c)
hipoteses = ['educ=0', 'exper=0']
ftest = results.f_test(hipoteses)
print(ftest) # rejeitamos H0


#### Questão 6 ####
dados = woo.dataWoo('htv')
dados['abil_2'] = dados['abil']**2
modelo = smf.ols(formula="educ ~ motheduc + fatheduc + abil + abil_2",data=dados)
results = modelo.fit()
print(results.summary())

# a)
hipoteses = ['motheduc=fatheduc']
ftest = results.f_test(hipoteses)
print(ftest) # Não rejeitamos H0

# b)
# Queremos testar se b4 = 0 vs b4 != 0. Como o p-valor de abil_2 <0.001, rejeitamos H0.

# c)
hipoteses = ['motheduc=0','fatheduc=0']
ftest = results.f_test(hipoteses)
print(ftest) # Rejeitamos H0

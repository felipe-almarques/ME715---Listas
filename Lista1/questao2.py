import wooldridge as wd
import pandas as pd
from scipy.stats import ttest_ind
import matplotlib.pyplot as plt 

dados = pd.DataFrame(wd.data('econmath'))

eco_1 = dados[dados['econhs'] == 1]
eco_0 = dados[dados['econhs'] == 0]

print(ttest_ind(eco_1['score'], eco_0['score']))
# Não há diferença significativa

## Plotando boxplot
boxplot = dados.boxplot(by = 'econhs', column=['score'], grid = False)
plt.show()

'''
Os resultados encontrados não trazem necessariamente alguma coisa sobre o efeito causal porque, como visto pelo teste e reforçado pelos gráficos, a diferença nas médias das pessoas que cursaram e não cursaram economia no ensino médio é muito pequena e não significativa. Além disso, por se tratar de dados observacionais, não temos como controlar o efeito das variáveis fora do estudo, sendo difícil estabelecer relações de causalidade.
'''
############################################################################
# d)
'''
Se eu quiser obter uma boa estimativa causal do efeito de fazer um curso de economia no ensino médio utilizando a diferença de médias eu faria o seguinte experimento: no ensino médio, alocaria aleatoriamente pessoas que fariam curso de economia e outros alunos que não cursariam economia. Assim, após a finalização, acompanhariamos essas pessoas na graduação para obter uma nota média das pessoas ao final do curso. Ao alocar aleatoriamente pessoas para os dois tratamentos (fazer ou não curso de economia no médio), reduziríamos possíveis fatores de confundimento o que permitira estabelecer algum efeito causal no estudo. Vale ressaltar que o experimento citado não é ético.
'''


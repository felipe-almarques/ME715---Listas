############################################################################
########                    Lista 8 - Ex 1                          ########
############################################################################
#a) Por que a variável Notebook pode estar correlacionada com u?.
'''
Existem outras variaveis endogenas que nao sao consideradas no modelo e podem estar fortemente correlacionadas com
Notebook, Como:
- Ingresso Economico
- Motivaçao
- Como se usa o notebook
- 
- 
'''
#b) Explique por que Notebook possivelmente está relacionado à renda dos pais. Isso significa que a renda dos pais sería uma boa IV de Notebook? (justifique)

##### Alunos cujos pais tenham uma renda maior tendem a ter Notebook (pago por eles), o que explica essa possível correlação. Considerando vários estudos (https://www.estadao.com.br/educacao/cotistas-tem-nota-pior-que-os-outros-alunos-na-faculdade-pesquisas-mostram-que-nao-entenda-estudos/), não há diferença significativa entre os CRs finais devido à forma de ingresso na universidade. Como uma das principais covariáveis relacionadas à renda dos pais é a escolaridade, e não há de indícios de que ela afeta o CR, parece que a renda dos pais seja uma boa IV de notebook.

'''
Se esta fortemente correlacionada dado que a maior renda tem mais posibilidades de que a notebook seja pagada por eles
Mais possivelmente nao cumpra com o criterio de exogeneidade, porque pode ser relacionado com outras variaveis 
como melhor educaçao previa, melhor moradia, etc
'''

#c) Suponha que, quatro anos atrás, a universidade tenha concedido subsídios para a compra de notebooks a, aproximadamente, metade dos alunos novos e que os alunos que receberam esses subsidios tenham sido escolhidos aleatoriamente. Explique detalhadamente como você utilizaria essa informação para construir uma IV para Notebook.

''' Pode ser representada como uma variavel dummy. Ao ser aleatoria, cumpre com a exogeneidade e ao definir o mismo fato de ter o nao ter a notebook, esta fortemente correlacionada com aquila'''


############################################################################
########                    Lista 8 - Ex 2                          ########
############################################################################


# a. Defina dist como a distância da residência do aluno até a universidade. Você considera que dist e u são não correlacionados?
'''
A distância da residência do aluno até a universidade (dist) pode estar correlacionada com fatores não observáveis que afetam o desempenho acadêmico. Se não controlados, esses fatores podem introduzir viés na análise de regressão.

Possíveis correlações de dist incluem:
  
  Tempo de deslocamento, reduzindo horas disponíveis para estudo.
Conforto do ambiente doméstico, afetando a qualidade do estudo.
Nível socioeconômico, relacionado a recursos e apoio educacional.'''
#b. Supondo que u e dist sejam não correlacionados, que outra hipótese dist terá que satis-
#fazer para ser uma IV válida de atndrte?
'''A variavel dist deve ser correlacionada com atndrte'''

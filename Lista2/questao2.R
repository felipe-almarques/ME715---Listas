#4. O conjunto de dados BWGHT contêm informações de nascimentos nos 
#Estados Unidos. As duas variáveis de interesse são bwght (peso do
#recém-nascido em onças) e cigs (número médio de cigarros que a mãe 
#fumou por dia durante a gravidez). Regrida bwght sobre cigs e responda
#às seguintes perguntas:
install.packages("wooldridge")
library(wooldridge)
data(bwght)

dados_bwght = bwght %>% 
  select(bwght, cigs)

modelo = lm(dados_bwght$bwght ~ dados_bwght$cigs,data = dados_bwght)
#Yi = beta_0 + beta_1*Xi
#Y = 119.7719 - 0,5138*(beta_1)
#  a) Qual é o peso do nascimento previsto quando cigs = 0? E quando 
#cigs = 20?
Y = 119.7719 - 0.5138*(beta_1)
Quando cigs = 0 temos que o peso do nascimento previsto é 119.7719.
Y_20 <- 119.7719 - 0.5138*20
Y_20
7719 = 0.5138*(beta_1)
Quando cigs = 20 temos que o peso do nascimento previsto é 109.4959

#    b) O MRLS necessariamente captura uma relação causal entre o 
#peso do nascimento da criança e os hábitos de fumar da mãe?

#  c) Para prever um peso de nascimento de 125 onças, qual deveria
#ser a magnitude de cigs?

#Y = 119.7719 - 0.5138*(beta_1) ->
#125 = 119.7719 - 0.5138*(beta_1) ->
#125 - 119.7719 = 0.5138*(beta_1) ->
#5.2281 = - 0.5138*(beta_1) ->
#5.2281/-0.5138 = beta_1 ->
#beta_1 = - 10.17536
beta_01 <- (125-119.7719)/(-0.5138)
beta_01 #-10.17536

#Deveria ser -10.17536

#  d) Verifique qual a proporção de mulheres que não fumaram durante 
#a gravidez na amostra. Sua conclusão no item anterior muda?

mulheres_sem_fumar <- dados_bwght %>% 
  filter(cigs == 0) %>% 
  count()

prop_mulheres <- mulheres_sem_fumar/count(dados_bwght)
prop_mulheres #0.8472622
#proporção de mulheres que não fumaram durante a gravidez na 
#amostra é 0.8472622.

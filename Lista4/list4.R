#1. Suponha que ajustou um modelo de regressão e obteve β̂1 = 0.56 e um
#p-valor = 0.086 para testar H0∶ β1 = 0 vs. H1∶ β1 ≠ 0. Contudo, você está
#interessad@ em testar H0∶ β1 = 0 vs. H1∶ β1 > 0, qual seria o p-valor?
#rejeitaria H0 a um nível se significância de 5%?

0.086/2 #0.043
#Tenho que dividir por 2 porque é unilateral e não bilateral.

#2. Um erro comum em muito estudos aplicados é dizer que ”aceitamos” H0.
#Contudo,nós, estatísticos, preferimos dizer ”não rejeitamos” H0
#e não ”aceitamos” H0. Discuta o motivo.
Um teste de hipóteses reveladas é planejado para avaliar a evidência amostral em
relação a uma hipótese nula. Ele não fornece evidências diretas de que a hipótese
nula é verdadeira. Em vez disso, ele nos ajuda a avaliar se a evidência amostral 
é consistente com a hipótese nula ou se há evidência suficiente para rejeitá-la 
em favor de hipóteses alternativas (H1). Portanto, dizer que "não rejeitamos" é 
mais preciso, pois reflete que não encontramos evidências convincentes para
rejeitar a H0. 


#3. O dataset rdchem contém informação de 32 empresas da industria química. 
#Entre as informações coletadas, temos: rdintens (gastos com pesquisa e 
#desenvolvimento como uma porcentagem das vendas), sales (vendas mensuradas em 
#mlhões de dólares) e profmarg (lucros como uma porcentagem das vendas). Ajuste
#um modelo da forma rdintens = β0 + β1log(sales) + β2profmarg + u.
#Assumindo que as hipóteses do modelos linear clássico acontecem:

#a) Interprete o coeficiente de log(sales).
library(wooldridge)
data(rdchem)
View(rdchem)

modelo1 <- lm(rdintens ~ log(sales) + profmarg, data = rdchem)
summary(modelo1)
coefficients(modelo1)
coefficients(modelo1)[[2]]

paste("Com o aumento de 1% de vendas mensuradas em mlhões de dólares temos que a 
      variável resposta rdintens aumenta em:", coefficients(modelo1)[[2]])

#b) Teste a hipóteses de que a intensidade de P&D não varia com sales contra a 
#alternativa de que P&D aumenta com as vendas.

paste("Queremos testar que H0:B1=0 vs H1: B1 >0")

1 - pt(summary(modelo1)$coefficients[,3][[2]], modelo1$df.residual)

#c) Interprete o coeficiente de profmarg, ele é economicamente grande?
modelo1 <- lm(rdintens ~ log(sales) + profmarg, data = rdchem)
summary(modelo1)
coefficients(modelo1)
coefficients(modelo1)[[3]]

paste("Com o aumento de uma unidade da variável profmarg a variável resposta 
      rdintens aumenta em:", coefficients(modelo1)[[3]], ". Sendo que ele não é 
      economicamente grande  porque aumenta apenas 0.0500367 sendo muito pequeno
      o valor" )

#d) profmarg tem um efeito estatisticamente significativo sobre rdintens?
modelo1 <- lm(rdintens ~ log(sales) + profmarg, data = rdchem)
summary(modelo1)$coefficients
summary(modelo1)$coefficients[3,4] #Estou pegando a terceira linha e quarta coluna 
#dos coeficientes, em que na quarta coluna tem os p-valores enquanto na
#terceira linha tem as informações a respeito do beta2 ou seja da variável profmarg,
#então estaremos pegando o p-valor do profmarg.

paste("Assim, o p-valor que diz se profmarg tem um efeito estatisticamente 
      significativo sobre rdintens traz o seguinte valor:", 
      summary(modelo1)$coefficients[3,4], "em que 0.2833658 > 0,05 o que não 
      traz evidências estatisitcamente significativas de que o coeficiente seja 
      significativo, pois não temos evidências para rejeitar a hipótese nula")

#4. Utilizando o dataset gpa1, ajuste um modelo que explique a nota média em um 
#curso superior (colGPA) utilizando o número de faltas às aulas por semana 
#(skipped), horas de estudo semanais (hsGPA) e a nota do ACT (equivalente ao 
#vestitubular). Assumindo que as hipóteses do modelo linear clássico acontecem:

#a) Encontre um intervalo de confiança 95% para β*hsGPA.
#intervalo de confiança:
#(beta - t_student*Std. Error; beta + tvalue*Std. Error)
?qt
data(gpa1)
View(gpa1)

modelo2 <- lm(colGPA ~ skipped + hsGPA + ACT,data = gpa1)
summary(modelo2)

beta2 <- summary(modelo2)$coefficients[3,1] #beta2
std_b2 <- summary(modelo2)$coefficients[3,2] #Std. Error de beta2


c(beta2 + qt(.025, modelo2$df.residual)*std_b2, 
  beta2 + qt(.975, modelo2$df.residual)*std_b2)
#qt é a distribuição t-student, em que modelo2$df.residual é o graus de liberdade 
#dos residuos

#b) Teste H0∶ βhsGPA = 0.4 vs. H1∶ βhsGPA ≠ 0.4
#Teste de hipótese:
#(beta - 0,4)/Std. Error(beta)

beta2 <- summary(modelo2)$coefficients[3,1] #beta2
std_b2 <- summary(modelo2)$coefficients[3,2] #Std. Error de beta2

teste4_1 <- (beta2 - 0.4)/std_b2
teste4_1 #0.1261411

paste("Temos que o t value é de", teste4_1)

#c) Você pode rejeitar a hipóteses H0∶ βhsGPA = 1 contra a alternativa bilateral?
#Teste de hipótese:
#(beta - 1)/Std. Error(beta)

beta2 <- summary(modelo2)$coefficients[3,1] #beta2
std_b2 <- summary(modelo2)$coefficients[3,2] #Std. Error de beta2

teste4_2 <- (beta2 - 1)/std_b2
teste4_2 #0.1261411

paste("Temos que o t value é de", teste4_2)

#d) Teste a hipótese nula de que, uma vez tendo sido controlado as horas de estudo
#semanais, o efeito de skipped e ACT sobre colGPA são, conjuntamente, nulos.

#Fazer teste F
modeloi <- lm(colGPA ~ skipped + hsGPA + ACT, gpa1)
modelor <- lm(colGPA ~ hsGPA, data = gpa1)
anova(modelor, modeloi)
tesF <- anova(modelor, modeloi)[2,5] #Teste F

n = nrow(gpa1); k = 3; q = 2
tf <- qf(p = 0.95, df1 = q, df2 = n - k - 1) #3.062204

paste("Como", tesF, ">", tf, "então rejeitamos H0 com um nível de significância α=0.05.")

#5. Utilize o conjunto de dados wage2 e ajuste a regressão
#log(wage) = β0 + β1educ + β2exper + β3tenure + u,
#em que wage é o salario-hora em dolares, educ são os anos de educação formal, 
#exper são os anos de experiência no mercado de trabalho e tenure são os anos de
#permanencia no emprego atual.

#a) Teste a hipótese de significância geral do modelo.
data(wage2)
View(wage2)

modelo3 <- lm(log(wage) ~ educ + exper + tenure, data = wage2)
summary(modelo3)
#F-statistic: 56.97 on 3 and 931 DF,  p-value: < 2.2e-16
#Temos que o p-valor é de 2.2e-16, então temos evidências para rejeitar a 
#hipótese nula de que H0:B1= 0,B2=0,...,Bk=0 vs H1: H0 não é verdadeiro,
#ou seja, pelo menos um dos betas é diferente de zero.

#b) Teste a hipótese de que um ano a mais de experiência no mercado de trabalho 
#tem o mesmo efeito sobre log(wage) que mais um ano de permanencia no emprego atual.
library(car)
lht(modelo5, c("exper = tenure")) # não rejeita

#c) Teste a hipótese de que, controlado o número de anos de permanencia no emprego
#(tenure), educ e exper não tem efeito nenhum sobre log(wage).
modelo3 = lm(log(wage) ~ educ + exper + tenure, data = wage2)
modelo3_1 = lm(log(wage) ~ tenure, data = wage2)
an2 <- anova(modelo3_1, modelo3)[2,5] #66.43

n = nrow(wage2); k = 3; q = 2
qf2 <- qf(p = 0.95, df1 = q, df2 = n - k - 1) #3.005393

paste("Como", an2, ">", qf2, "então rejeitamos H0 com um nível de significância α=0.05.")

#6. Utilize o conjunto de dados htv e ajuste a regressão
#educ = β0 + β1motheduc + β2fatheduc + β3abil + β4abil2 + u.

modelo6 <- lm(educ~motheduc + fatheduc + abil + I(abil^2), htv)
# a) Teste a hipóteses de que a influencia que motheduc e fatheduc exercem sobre educ
# é a mesma.
lht(modelo6, c("motheduc = fatheduc")) # não rejeita

# b) Teste a hipótese de que educ está linearmente relacionado com abil contra a alter-
#   nativa que diz que a relação é quadrática.

summary(modelo6)$coefficients[5,4] # rejeita

# c) Um colega de trabalho diz que o modelo educ = β0+β1abil+β2abil2+u é suficiente,
# e que tanto motheduc e fatheduc não são importantes para o modelos. Faça um teste
# de hipóteses para rejeitar ou não rejeitar a hipótese do seu colega.

anova(lm(educ ~ abil + I(abil^2), htv), modelo6) # ele está errado
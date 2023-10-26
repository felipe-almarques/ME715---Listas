########################################################################################
######################            Exercício 2 - Júlia             ######################
########################################################################################

using WooldridgeDatasets, DataFrames, Statistics, GLM

# Dados
dados = DataFrame(wooldridge("hprice1"))

# Ajuste dos modelos

modelo1 = lm(@formula(log(price) ~ lotsize + sqrft + bdrms), dados)
modelo2 = lm(@formula(log(price) ~ log(lotsize) + log(sqrft) + bdrms), dados)

println(modelo1)
println(modelo2)

fitted_values = predict(modelo2)
dados.yhat = fitted_values

modelo = lm(@formula(log(price) ~ lotsize + sqrft + bdrms + yhat), dados)
println(modelo)

# p-valor = 0.0215 => yhat é significativo a análise, portanto, modelo 1 está
# incorretamente especificado em função. Eu preferiria o modelo 2
# O resultado encontrado está de acordo com o do teste de Mizon e Richard.
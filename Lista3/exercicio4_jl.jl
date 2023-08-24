using DataFrames, WooldridgeDatasets, GLM, Plots

dados = DataFrame(wooldridge("HTV"))
first(dados, 6)

dados[!, :abil_squared] = dados[!, :abil] .^ 2

modelo = lm(@formula(educ ~ motheduc + fatheduc + abil + abil_squared), dados);
println(modelo)

r_squared = r2(modelo)

println("R² do Modelo: ", r_squared)

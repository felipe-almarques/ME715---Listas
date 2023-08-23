using DataFrames, WooldridgeDatasets, GLM, Plots

data = DataFrame(wooldridge("HTV"))
first(dados, 6)

data[!, :abil_squared] = data[!, :abil] .^ 2

modelo = lm(@formula(educ ~ motheduc + fatheduc + abil + abil_squared), data);
modelo

r_squared = r²(modelo)

println("R² do Modelo: ", r_squared)

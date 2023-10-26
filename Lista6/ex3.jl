using Pkg
Pkg.add("GLM")
using GLM

# Suponha que você tenha seus dados
Y = [1, 2, 3, 4, 5]
X = [1, 2, 3, 4, 5]

# Crie um modelo MQGF
model = glm(Y ~ X, Normal(), identityLink())

# Ajuste o modelo
results = fit(model)

# Imprima os resultados
println(results)

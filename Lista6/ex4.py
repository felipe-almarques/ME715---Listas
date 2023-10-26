import numpy as np
import statsmodels.api as sm

# Suponha que você já tenha os dados de Y, X e ut
# Vamos criar arrays numpy fictícios como exemplo
np.random.seed(0)
n = 100
X = np.random.rand(n, 2)
X = sm.add_constant(X)  # Adicione uma constante à matriz de design X
beta = np.array([2.0, 3.0, 4.0])
u = np.zeros(n)
phi = 0.8
sigma = 1.0

for t in range(2, n):
    u[t] = phi * u[t - 1] + np.random.normal(0, sigma)

Y = X.dot(beta) + u

# Crie um modelo ARMA para ut
from statsmodels.tsa.arima.model import ARIMA
arma_order = (1, 0, 0)  # (p, d, q) order of the ARMA model
arma_model = ARIMA(u, order=arma_order)
arma_results = arma_model.fit()

# Estime os parâmetros do modelo Y = X*beta + u usando MQGF
model = sm.GLSAR(Y, X, rho=arma_results.arparams)
results = model.fit()

# Imprima os resultados
print(results.summary())

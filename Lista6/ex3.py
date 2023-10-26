pip install statsmodels
import numpy as np
import statsmodels.api as sm

# Suponha que você tenha seus dados
Y = np.array([1, 2, 3, 4, 5])
X = np.array([1, 2, 3, 4, 5])
X = sm.add_constant(X)  # Adicione uma constante à matriz de design X

# Crie um modelo GLSAR (MQGF)
model = sm.GLSAR(Y, X)

# Ajuste o modelo
results = model.fit()

# Imprima os resultados
print(results.summary())

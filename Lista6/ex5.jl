using LinearAlgebra
using Statistics

function hac_estimator(X, y, model, lag)
    # Ajusta o modelo de regressão
    fit_model = fit(model, X, y)

    # Obtém os resíduos do modelo
    residuals = y - predict(fit_model, X)

    n = length(residuals)
    k = size(X, 2)
    T = n - k

    # Calcula a matriz de design
    design_matrix = [ones(size(X, 1)) X]

    # Calcula a matriz de covariância dos resíduos
    cov_residuals = cov(residuals)

    # Calcula as autocorrelações dos resíduos até a ordem "lag"
    autocorrelations = autocor(residuals, 1:lag)

    # Calcula a matriz de pesos
    weights = zeros(T, T)
    for i in 1:T
        for j in 1:T
            if i != j
                weights[i, j] = min(i, j) / T
            end
        end
    end

    # Calcula a matriz de covariância HAC
    hac_cov = design_matrix' * (weights .* cov_residuals) * design_matrix

    return hac_cov
end

y <- matrix(c(4,7,3,9,19),ncol=1)
x <- matrix(c(1,1,1,1,1,2,3,1,5,9), ncol=2)

beta <- solve(t(x) %*% x) %*% t(x) %*% y

yhat <- x %*% beta
u <- y-yhat

s2 <- (t(u) %*% u) / 3

as.numeric(s2) * solve(t(x) %*% x)

## b)
D <- diag(c(.1,.05,.2,.3,.15))
as.numeric(s2) * solve(t(x) %*% x) %*% t(x) %*% D %*% x %*% solve(t(x) %*% x)


dK <- function(X, ...) {
  K1 <- Ksector(X, ..., begin = 135-15, end = 135+15, units="degrees")
  K2 <- Ksector(X, ..., begin = 45-15, end = 45+15, units="degrees")
  eval.fv(K1-K2)
}
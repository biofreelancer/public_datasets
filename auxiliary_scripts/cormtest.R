# Based on: http://www.sthda.com/english/wiki/visualize-correlation-matrix-using-correlogram#computing-the-p-value-of-correlations
# BioFreelancer 2021

# mat : is a matrix of data
# ... : further arguments to pass to the native R cor.test function
cor.mtest <- function( mat, ... ) {
  
  # Convierte a matriz el objeto pasado como "mat"
  mat <- as.matrix( mat )
  
  # calcula el numero de columnas en la matriz
  n <- ncol( mat )
  
  # prepara una patriz de n x n llena con NA's
  p.mat <- matrix( NA, n, n )
  
  # llena la diagonal de la matriz con valores 0
  diag( p.mat ) <- 0
  
  # Prepara un loop para calcular el p-value de cada par de variables
  for ( i in 1:( n - 1 ) ) {
    for ( j in ( i + 1 ):n ) {
      tmp <- cor.test( mat[ , i ], mat[ , j ], ... )   # prueba la correlacion de un par de variables
      p.mat[ i, j ] <- p.mat[ j, i ] <- tmp$p.value    # registra el p-value en las dos celdas que le corresponde
    }
  }
  
  # le pone nombre a filas y columnas
  colnames(p.mat) <- rownames(p.mat) <- colnames(mat)  
  
  # imprime la matriz de p-values
  p.mat
}

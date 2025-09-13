####
# Copia y pega este codigo para replicar el ejercicio de hoy

# instala pacman para trabajar mas facil
install.packages( "pacman" )

# cargar la data simulada
pacman::p_load( "vroom" )

delivery.df <- read.table( file = "https://data.biofreelancer.com/delivery",
                           header = TRUE, sep = "\t" )

# ver la estructura de la tabla
str( delivery.df ) 

### DE AQUI EN ADELANTE ES CHATGPT
# Cargar paquetes necesarios
pacman::p_load(dplyr)

# Convertir costo a numérico (reemplaza comas por puntos primero)
delivery.df <- delivery.df %>%
  mutate(costo = as.numeric(gsub(",", ".", costo)))

# Cargar librerías necesarias
pacman::p_load(ggplot2)

# Histograma de las distancias recorridas
ggplot( data = delivery.df,
        mapping = aes( x = distancia_recorrida ) ) +
  geom_histogram( bins = 30, fill = "tomato", color = "purple", alpha = 0.3 ) +
  labs(
    title = "Distribución de las distancias recorridas",
    x = "Distancia recorrida (km)",
    y = "Frecuencia"
  ) +
  theme_minimal( )

#####
# Cargar librerías necesarias
pacman::p_load(ggplot2)

# Boxplot de las distancias recorridas
ggplot( data = delivery.df,
        mapping = aes( y = distancia_recorrida ) ) +
  geom_boxplot( fill = "orange", color = "black", alpha = 0.7 ) +
  labs(
    title = "Boxplot de las distancias recorridas",
    y = "Distancia recorrida (km)"
  ) +
  theme_minimal( )

######
# Cargar librerías necesarias
pacman::p_load(ggplot2, patchwork)

# Función para graficar histograma + boxplot
plot_hist_box <- function( varname ) {
  
  # Histograma
  p1 <- ggplot( delivery.df, aes( x = .data[[ varname ]] ) ) +
    geom_histogram( bins = 30, fill = "steelblue", color = "white", alpha = 0.7 ) +
    labs(
      title = paste( "Histograma de", varname ),
      x = varname,
      y = "Frecuencia"
    ) +
    theme_minimal()
  
  # Boxplot
  p2 <- ggplot( delivery.df, aes( y = .data[[ varname ]] ) ) +
    geom_boxplot( fill = "orange", color = "black", alpha = 0.7 ) +
    labs(
      title = paste( "Boxplot de", varname ),
      y = varname
    ) +
    theme_minimal()
  
  # Combinar con patchwork (lado a lado)
  p1 + p2
  
}

# Ejemplo de uso:
plot_hist_box( varname = "distancia_recorrida" )

plot_hist_box( varname = "costo" )

plot_hist_box( varname = "propina" )

#####
# Cargar librerías necesarias
pacman::p_load(ggplot2, patchwork, dplyr)

# Función para graficar histograma + boxplot con promedio y mediana
plot_hist_box <- function( varname ) {
  
  # Calcular promedio y mediana
  stats <- delivery.df %>%
    summarise(
      mean_val = mean( .data[[ varname ]], na.rm = TRUE ),
      median_val = median( .data[[ varname ]], na.rm = TRUE )
    )
  
  # Histograma
  p1 <- ggplot( delivery.df, aes( x = .data[[ varname ]] ) ) +
    geom_histogram( bins = 30, fill = "steelblue", color = "white", alpha = 0.7 ) +
    geom_vline( aes( xintercept = stats$mean_val ), color = "black", linetype = "dashed" ) +
    geom_vline( aes( xintercept = stats$median_val ), color = "black", linetype = "dotted" ) +
    geom_point( aes( x = stats$mean_val, y = 0 ), shape = 16, size = 3, color = "black" ) +   # círculo (promedio)
    geom_point( aes( x = stats$median_val, y = 0 ), shape = 18, size = 3, color = "black" ) + # diamante (mediana)
    labs(
      title = paste( "Histograma de", varname ),
      x = varname,
      y = "Frecuencia"
    ) +
    theme_minimal()
  
  # Boxplot
  p2 <- ggplot( delivery.df, aes( y = .data[[ varname ]] ) ) +
    geom_boxplot( fill = "orange", color = "black", alpha = 0.7 ) +
    geom_point( aes( x = 1, y = stats$mean_val ), shape = 16, size = 3, color = "black" ) +   # círculo (promedio)
    geom_point( aes( x = 1, y = stats$median_val ), shape = 18, size = 3, color = "black" ) + # diamante (mediana)
    labs(
      title = paste( "Boxplot de", varname ),
      y = varname
    ) +
    theme_minimal()
  
  # Combinar con patchwork
  p1 + p2
}

# Ejemplo de uso
plot_hist_box( "distancia_recorrida" )

#####
# Cargar librerías necesarias
pacman::p_load(ggplot2, patchwork, dplyr)

# Función para graficar histograma + boxplot con promedio y mediana personalizados
plot_hist_box <- function( varname ) {
  
  # Calcular promedio y mediana
  stats <- delivery.df %>%
    summarise(
      mean_val   = mean( .data[[ varname ]], na.rm = TRUE ),
      median_val = median( .data[[ varname ]], na.rm = TRUE )
    )
  
  # Histograma
  p1 <- ggplot( delivery.df, aes( x = .data[[ varname ]] ) ) +
    geom_histogram( bins = 30, fill = "steelblue", color = "white", alpha = 0.7 ) +
    geom_point( aes( x = stats$mean_val, y = 0 ),
                shape = 21, size = 3, color = "red", fill = NA, stroke = 1.2 ) +  # círculo rojo sin relleno
    geom_point( aes( x = stats$median_val, y = 0 ),
                shape = 18, size = 2, color = "green" ) +  # diamante verde pequeño
    labs(
      title = paste( "Histograma de", varname ),
      x = varname,
      y = "Frecuencia"
    ) +
    theme_minimal()
  
  # Boxplot
  p2 <- ggplot( delivery.df, aes( y = .data[[ varname ]] ) ) +
    geom_boxplot( fill = "orange", color = "black", alpha = 0.7 ) +
    geom_point( aes( x = 1, y = stats$mean_val ),
                shape = 21, size = 3, color = "red", fill = NA, stroke = 1.2 ) +  # círculo rojo sin relleno
    geom_point( aes( x = 1, y = stats$median_val ),
                shape = 18, size = 2, color = "green" ) +  # diamante verde pequeño
    labs(
      title = paste( "Boxplot de", varname ),
      y = varname
    ) +
    theme_minimal()
  
  # Combinar con patchwork
  p1 + p2
}

# Ejemplo de uso
plot_hist_box( "distancia_recorrida" )

plot_hist_box( "propina" )

#####
# Cargar librerías necesarias
pacman::p_load(ggplot2, patchwork, dplyr)

# Función para graficar histograma + boxplot con promedio y mediana alineados
plot_hist_box <- function( varname ) {
  
  # Calcular promedio y mediana
  stats <- delivery.df %>%
    summarise(
      mean_val   = mean( .data[[ varname ]], na.rm = TRUE ),
      median_val = median( .data[[ varname ]], na.rm = TRUE )
    )
  
  # Histograma
  p1 <- ggplot( delivery.df, aes( x = .data[[ varname ]] ) ) +
    geom_histogram( bins = 30, fill = "steelblue", color = "white", alpha = 0.7 ) +
    geom_point( aes( x = stats$mean_val, y = 0 ),
                shape = 21, size = 3, color = "red", fill = NA, stroke = 1.2 ) +
    geom_point( aes( x = stats$median_val, y = 0 ),
                shape = 18, size = 2, color = "green" ) +
    labs(
      title = paste( "Histograma de", varname ),
      x = varname,
      y = "Frecuencia"
    ) +
    theme_minimal()
  
  # Boxplot (usar variable dummy como x para alinear los puntos)
  p2 <- ggplot( delivery.df, aes( x = varname, y = .data[[ varname ]] ) ) +
    geom_boxplot( fill = "orange", color = "black", alpha = 0.7 ) +
    geom_point( aes( x = varname, y = stats$mean_val ),
                shape = 21, size = 3, color = "red", fill = NA, stroke = 1.2 ) +
    geom_point( aes( x = varname, y = stats$median_val ),
                shape = 18, size = 2, color = "green" ) +
    labs(
      title = paste( "Boxplot de", varname ),
      x = "",
      y = varname
    ) +
    theme_minimal()
  
  # Combinar con patchwork
  p1 + p2
}

# Ejemplo de uso
plot_hist_box( "propina" )

#####
# Cargar librerías necesarias
pacman::p_load(dplyr)

# Crear tabla con promedio y mediana de variables seleccionadas
resumen_tabla <- delivery.df %>%
  summarise(
    promedio_distancia = mean( distancia_recorrida, na.rm = TRUE ),
    mediana_distancia  = median( distancia_recorrida, na.rm = TRUE ),
    promedio_costo     = mean( as.numeric(costo), na.rm = TRUE ),
    mediana_costo      = median( as.numeric(costo), na.rm = TRUE ),
    promedio_propina   = mean( propina, na.rm = TRUE ),
    mediana_propina    = median( propina, na.rm = TRUE )
  )

resumen_tabla

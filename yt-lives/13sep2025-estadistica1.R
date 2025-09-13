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


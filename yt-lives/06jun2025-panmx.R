####
# Copia y pega este codigo para replicar el ejercicio de hoy

# cargar paquetes
pacman::p_load( "vroom" )

pan_promedio.df <- vroom( file = "https://data.biofreelancer.com/panmx" )

head( pan_promedio.df )



#########

# El resto del script que generemos durante el video lo vamos a poner aquí abajo después de la clase

#
# Instala devtools si no lo tienes
install.packages("devtools")

# Luego instala rnaturalearthhires desde GitHub
devtools::install_github("ropensci/rnaturalearthhires")

# antes de chatgpt
pacman::p_load( "devtools" )

# Cargar paquetes necesarios
pacman::p_load(tidyverse, sf, rnaturalearth, rnaturalearthdata)

# Obtener el shapefile de los estados de México
mex_states <- ne_states(country = "Mexico", returnclass = "sf")

# Verifica que 'gn_a1_code' tenga formato como "MX.01", "MX.02", etc.
# names(mex_states)  # Puedes descomentar esto para explorar

# Asegúrate de que tu dataframe pan_promedio.df esté cargado
# Aquí suponemos que ya lo tienes como 'pan_promedio.df'

# Unir por entidad_mapa <-> gn_a1_code
mapa_pan <- mex_states %>%
  left_join(pan_promedio.df, by = c("gn_a1_code" = "entidad_mapa"))

# Graficar el mapa
ggplot(mapa_pan) +
  geom_sf(aes(fill = promedio_pan), color = "white") +
  scale_fill_viridis_c(option = "C",
                       direction = -1, name = "Promedio PAN") +
  labs(title = "Promedio de PAN por entidad federativa") +
  theme_minimal( )

#
ggplot(mapa_pan) +
  geom_sf(aes(fill = promedio_pan), color = "white", size = 0.2) +
  scale_fill_distiller(
    palette = "YlOrBr",    # Café con amarillo
    direction = 1,         # 1 = valores altos son más oscuros
    name = "Promedio de PAN"
  ) +
  labs(
    title = "Consumo promedio de PAN por entidad federativa",
    subtitle = "Datos por estado",
    caption = "Fuente: Elaboración propia"
  ) +
  theme_minimal() +
  theme(
    legend.position = "right",
    plot.title = element_text(size = 14, face = "bold"),
    plot.subtitle = element_text(size = 10)
  )


ggplot(mapa_pan) +
  geom_sf(aes(fill = promedio_pan), color = "black", size = 0.2) +  # contorno negro
  scale_fill_distiller(
    palette = "YlOrBr",
    direction = 1,
    name = "Promedio de PAN"
  ) +
  labs(
    title = "Consumo promedio de PAN por entidad federativa",
    subtitle = "Datos por estado",
    caption = "Fuente: Elaboración propia"
  ) +
  theme_minimal() +
  theme(
    legend.position = "right",
    plot.title = element_text(size = 14, face = "bold"),
    plot.subtitle = element_text(size = 10)
  )

ggplot(mapa_pan) +
  geom_sf(aes(fill = promedio_pan), color = "black", size = 0.2) +
  scale_fill_distiller(
    palette = "YlOrBr",
    direction = 1,
    name = "Promedio de PAN"
  ) +
  labs(
    title = "Consumo promedio de PAN por entidad federativa",
    subtitle = "Datos por estado",
    caption = "Fuente: Elaboración propia"
  ) +
  theme_minimal(base_family = "sans") +
  theme(
    panel.background = element_rect(fill = "#a0e6f5", color = NA),  # azul Cancún
    plot.background = element_rect(fill = "#a0e6f5", color = NA),
    legend.position = "right",
    plot.title = element_text(size = 14, face = "bold"),
    plot.subtitle = element_text(size = 10)
  )

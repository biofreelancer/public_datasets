# 1) Cargar (o instalar si falta) los paquetes necesarios
if ( !requireNamespace( "pacman", quietly = TRUE ) ) install.packages( "pacman" )

pacman::p_load( "vroom", "dplyr", "ggplot2" )

# leer data ----
insulina.df <- vroom( file = "https://raw.githubusercontent.com/biofreelancer/public_datasets/refs/heads/main/yt-lives/insulina_glucosa.csv" )

# Aqui empieza el ejercicio ----
str( insulina.df  )

library(ggplot2)

ggplot(insulina.df,
       aes(x = factor(dia),
           y = glucosa,
           color = tratamiento)) +
  geom_point(size = 3, alpha = 0.7) +
  theme_minimal(base_size = 14) +
  labs(
    x = "Día",
    y = "Glucosa (mg/dL)",
    color = "Tratamiento",
    title = "Glucosa por día según tratamiento"
  ) +
  scale_color_manual(values = c(
    "Inyectada" = "#E69F00",
    "Dispensador" = "#0072B2"
  ))

library(ggplot2)

ggplot(insulina.df,
       aes(x = factor(dia),
           y = glucosa,
           color = tratamiento)) +
  
  geom_point(position = position_dodge(width = 0.6),
             size = 3, alpha = 0.7) +
  
  theme_minimal(base_size = 16) +
  labs(
    x = "Día",
    y = "Glucosa (mg/dL)",
    color = "Tratamiento",
    title = "Glucosa por día separada por tratamiento"
  )

# Instalar si no lo tienes
install.packages("ggbeeswarm")

library(ggplot2)
library(ggbeeswarm)

ggplot(insulina.df,
       aes(x = factor(dia),
           y = glucosa,
           color = tratamiento)) +
  geom_beeswarm(cex = 2.5, alpha = 0.7) +
  theme_minimal(base_size = 16) +
  labs(
    x = "Día",
    y = "Glucosa (mg/dL)",
    color = "Tratamiento",
    title = "Glucosa por día (beeswarm) según tratamiento"
  )

#
ggplot(insulina.df,
       aes(x = factor(dia),
           y = glucosa,
           color = tratamiento)) +
  geom_quasirandom(
    groupOnX = TRUE,
    width = 0.2,       # <-- controla qué tan pegados están
    varwidth = FALSE,
    alpha = 0.7,
    size = 2.2
  ) +
  theme_minimal(base_size = 16) +
  labs(
    x = "Día",
    y = "Glucosa (mg/dL)",
    color = "Tratamiento",
    title = "Glucosa por día (beeswarm ajustado)"
  )

# 
ggplot(insulina.df,
       aes(x = factor(dia),
           y = glucosa,
           color = tratamiento)) +
  geom_quasirandom(
    dodge.width = 1,   # <-- controla separación entre tratamientos
    groupOnX = TRUE,
    width = 0.15,         # <-- controla qué tan pegados están a su día
    alpha = 0.7,
    size = 2.2
  ) +
  theme_minimal(base_size = 16) +
  labs(
    x = "Día",
    y = "Glucosa (mg/dL)",
    color = "Tratamiento"
  )

#
library(ggplot2)

ggplot(insulina.df,
       aes(x = factor(dia),
           y = glucosa,
           fill = tratamiento)) +
  geom_boxplot(alpha = 0.7, outlier.shape = NA) +
  theme_minimal(base_size = 16) +
  labs(
    x = "Día",
    y = "Glucosa (mg/dL)",
    fill = "Tratamiento",
    title = "Glucosa por día (caja y bigotes) según tratamiento"
  )

#
library(dplyr)
library(ggplot2)

# Calcular el promedio por día y tratamiento
promedios.df <- insulina.df %>%
  group_by( dia, tratamiento ) %>%
  summarise( media_glucosa = mean(glucosa), .groups = "drop")

# Graficar la línea de promedio
ggplot(promedios.df,
       aes(x = dia,
           y = media_glucosa,
           color = tratamiento,
           group = tratamiento)) +
  
  geom_line(size = 1.5) +
  geom_point(size = 4) +
  
  theme_minimal(base_size = 16) +
  labs(
    x = "Día",
    y = "Glucosa promedio (mg/dL)",
    color = "Tratamiento",
    title = "Promedio de glucosa por día según tratamiento"
  )


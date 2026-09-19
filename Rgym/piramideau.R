pacman::p_load( "vroom", "dplyr", "tidyr", "ggplot2" )

poblacion.df <- vroom( file = "https://raw.githubusercontent.com/biofreelancer/public_datasets/refs/heads/main/Rgym/EAU_population_data.tsv" ) %>% 
  as_tibble( )

str( poblacion.df )

# 1. Asegurar que 'Age' mantenga su orden secuencial y no se ordene alfabéticamente
poblacion.df$Age <- factor(poblacion.df$Age, levels = unique(poblacion.df$Age))

# 2. Transformar los datos y preparar los valores negativos para los hombres
datos_piramide <- poblacion.df %>%
  # Pasar de 3 columnas (Age, M, F) a 3 columnas (Age, Sex, Population)
  pivot_longer(cols = c(M, F), names_to = "Sex", values_to = "Population") %>%
  # Multiplicar los valores de los Hombres ('M') por -1 para dibujar el lado izquierdo
  mutate(Population_Plot = ifelse(Sex == "M", -Population, Population))

# 3. Crear el gráfico con ggplot
ggplot(datos_piramide, aes(x = Age, y = Population_Plot, fill = Sex)) +
  geom_col(width = 0.85, alpha = 0.9) +
  coord_flip() + # Voltear las coordenadas para la forma de pirámide
  
  # Usar la función abs() para que el eje X (que ahora es Y por coord_flip) no muestre números negativos
  scale_y_continuous(
    labels = function(x) format(abs(x), big.mark = ",", scientific = FALSE)
  ) +
  
  # Personalizar los colores y la leyenda
  scale_fill_manual(
    values = c("M" = "#2c3e50", "F" = "#e74c3c"),
    labels = c("M" = "Hombres", "F" = "Mujeres") # Cambiar etiquetas en la leyenda
  ) +
  
  # Mejorar la estética
  theme_minimal(base_size = 20) +
  theme(
    # legend.position = "top",
    legend.title = element_blank(),
    plot.title = element_text(face = "bold", size = 16),
    panel.grid.major.y = element_blank() # Quitar las líneas horizontales para mayor limpieza
  ) +
  labs(
    title = "Pirámide Poblacional",
    x = "Grupo de Edad",
    y = "Población"
  )

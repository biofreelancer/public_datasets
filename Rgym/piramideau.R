pacman::p_load( "vroom", "dplyr", "tidyr", "ggplot2" )

poblacion <- vroom( file = "https://data.biofreelancer.com/piramide2026" ) %>% 
  as_tibble( )

str( poblacion )

# Transformar los datos y preparar los valores negativos para los hombres
pob_long <- poblacion %>%
  pivot_longer( cols = c( hombres, mujeres ),
                names_to = "sexo",
                values_to = "cantidad" )

pob_long2 <- pob_long %>% 
  mutate( valores_pob = ifelse( test = sexo == "hombres",
                                yes = cantidad * -1,
                                no = cantidad ) )

# Graficamos con ggplot
piramide1 <- ggplot( pob_long2,
                     mapping = aes( x = edad,
                                    y = valores_pob,
                                    fill = sexo ) ) +
  geom_col(  ) 

# Visualizamos
piramide1

# arreglamos los ejes
orden_x <- poblacion$edad

minimo_y <- -1300000
maximo_y <- 600000

marcas_y <- seq( from = minimo_y,
                 to = maximo_y,
                 by = 100e3 ) 

etiquetas_y <- format( abs( marcas_y / 1e6 ),
                       big.mark = "," )

# aplicamos las correcciones de ejes
piramide2 <- piramide1 +
  scale_x_discrete( limits = orden_x ) +
  scale_y_continuous( breaks = marcas_y,
                      labels = etiquetas_y )

# vis
piramide2

# cambiamos colores, y ponemos titulos
miscolores <- c( hombres = "skyblue", mujeres = "skyblue4" )

piramide3 <- piramide2 +
  scale_fill_manual( values = miscolores ) +
  labs( x = "Rango de edad",
        y = "Millones de habitantes",
        title = "Desequilibrio poblacional en Emiratos Arabes Unidos",
        caption = "con datos de: populationpyramid.net" ) 

# Vis
piramide3

# Mejoramos los acabados, flipamos la piramide
piramide4 <- piramide3 +
  coord_flip( ) +
  theme_classic( base_size = 20 ) +
  theme( legend.position = "top" )

# Vis
piramide4

# FIN, no dejes de practicar

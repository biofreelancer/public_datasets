# cargar paquetes
pacman::p_load( "vroom", "ggplot2", "tidyr",
                "dplyr", "ggsci" )

# cargar data
minerales.df <- vroom( file = "https://data.biofreelancer.com/mineral" )  

# graficar cambio en toneladas
linea1.p <- ggplot( data = minerales.df,
                    mapping = aes( x = anio,
                                   y =  toneladas ,
                                   group = mineral,
                                   color = mineral,
                                   label = toneladas ) ) +
  geom_line( )

# ver la version fea
linea1.p

# mejoramos un poco
linea2.p <- linea1.p +
  geom_point( size = 5 ) +
  geom_text( ) +
  scale_color_aaas( ) +
  theme_classic( )

# Vis
linea2.p

# clean for sourcing
rm( linea1.p ) 

# guardar en svg
#ggsave( plot = linea2.p,
#        file = "minerales.pdf",
#        width = 10,
#        height = 7 )

# cargar paquetes
pacman::p_load( "vroom", "ggplot2", "tidyr",
                "dplyr", "ggsci" )

# cargar data
minerales.df <- vroom( file = "https://data.biofreelancer.com/mineral" )  %>% 
  filter( mineral %in% c( 
    # "Bauxite",
    # "Aluminium",
    "Copper",
    "Zinc",
    "Lead",
    "Lithium",
    "Antimony" ) )

vroom_write( x = minerales.df, file = "minerales.tsv2" )

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

linea2.p

# guardar en svg
ggsave( plot = linea2.p,
        file = "minerales.pdf",
        width = 10,
        height = 7 )

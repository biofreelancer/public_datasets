# Vamos a ejecutar un script de internet
# porque esta clase no es de hacer los graficos
# Es de aprender a editarlos en pos-produccion

# ejecutamos el script desde internet
source( "https://raw.githubusercontent.com/biofreelancer/public_datasets/refs/heads/main/cursos_especiales/edicion_graficos_cientificos/ejercicio_1/mineral.R" )

# veamos el plot
# linea.p

# lo guardamos en PDF, para que sea un formato de vectores
# manejable por canva
ggsave( plot = linea.p,
        file = "minerales.pdf",
        width = 10,
        height = 7 )

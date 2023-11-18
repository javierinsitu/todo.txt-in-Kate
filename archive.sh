#!/bin/bash

# Definir la ubicación del archivo de origen
origen="/media/datos/javier/Nextcloud/Notes/todo.txt"

# Definir la ubicación del archivo destino
destino="/media/datos/javier/Nextcloud/Notes/journaling/done.txt"

# Obtener el número de línea como argumento del script
linea=$(($1 + 1))

# Leer la línea del archivo origen
texto=$(sed -n "${linea}p" $origen)

# Comprobar si el archivo destino está vacío
if test ! -s $destino; then
  # Escribir la primera línea con el texto done.txt
  echo "done.txt" > $destino
fi

# Comprobar si la línea existe
if [[ -n $texto ]]; then
  # Obtener la fecha y hora actual en formato yyyy-MM-dd hh:mm
  fecha_hora=$(date "+%Y-%m-%d %H:%M")
  # Concatenar el texto "Archivado el " y la fecha y hora actual al final de la línea con una tabulación
  texto="$texto\tArchivado el $fecha_hora"
  # Escribir la línea al principio del archivo destino
  sed -i "1i$texto" $destino
  # Borrar la línea del archivo origen
  sed -i "${linea}d" $origen
  # Mostrar un mensaje de éxito
  echo "La línea $linea fue copiada al archivo destino con la fecha y hora actual y borrada del archivo origen"
else
  # Mostrar un mensaje de error
  echo "La línea $linea no existe en el archivo origen"
fi




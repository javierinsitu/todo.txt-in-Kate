#!/bin/bash

# Definir la ubicación del archivo de texto específico
archivo="/media/datos/javier/Nextcloud/Notes/todo.txt"

# Crear el archivo si no existe
touch $archivo

# Obtener la fecha actual en formato yyyy-mm-dd
fecha=$(date +%Y-%m-%d)

# Comprobar si el archivo está vacío
if test ! -s $archivo; then
  # Escribir la primera línea con el texto y la fecha
  echo "(B) $fecha " > $archivo
else
  # Insertar una línea con el texto y la fecha al principio del archivo
  sed -i "1i(B) $fecha " $archivo
fi

# Abrir el archivo con kate
kate $archivo

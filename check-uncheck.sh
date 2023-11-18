#!/bin/bash

# Definir la ubicación del archivo de texto específico
archivo="/media/datos/javier/Nextcloud/Notes/todo.txt"

# Obtener el número de línea como argumento del script
linea=$(($1 + 1))

# Leer la línea del archivo
texto=$(sed -n "${linea}p" $archivo)

# Comprobar si la línea comienza con una "x "
if [[ $texto == x\ * ]]; then
  # Eliminar la "x " del principio de la línea
  sed -i "${linea}s/^x //" $archivo
else
  # Agregar una "x " al principio de la línea
  sed -i "${linea}s/^/x /" $archivo
fi

# Abrir el archivo con kate
kate $archivo

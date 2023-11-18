#!/bin/bash

# Definir la ubicación del archivo de texto específico
archivo="/media/datos/javier/Nextcloud/Notes/todo.txt"

# Obtener el número de línea como argumento del script
linea=$(($1 + 1))

# Leer la línea del archivo
texto=$(sed -n "${linea}p" $archivo)

# Comprobar si la línea tiene al menos tres caracteres
if [[ ${#texto} -ge 3 ]]; then
  # Obtener los tres primeros caracteres de la línea
  primeros_tres=${texto:0:3}
  # Cambiar los tres primeros caracteres según el caso
  case $primeros_tres in
    "(A)") nuevos_tres="(B)" ;;
    "(B)") nuevos_tres="(C)" ;;
    "(C)") nuevos_tres="(A)" ;;
    *) nuevos_tres=$primeros_tres ;;
  esac
  # Reemplazar los tres primeros caracteres de la línea en el archivo
  sed -i "${linea}s/$primeros_tres/$nuevos_tres/" $archivo
fi

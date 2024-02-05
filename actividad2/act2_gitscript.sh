#!/bin/bash

# a) Leer la variable GITHUB_USER
read -p "Ingrese el nombre de usuario de GitHub: " GITHUB_USER

# b) Consultar la URL de GitHub API
URL_API="https://api.github.com/users/${GITHUB_USER}"
JSON_DATA=$(curl -s "$URL_API")

# Obtener los valores del archivo JSON
ID_USER=$(echo "$JSON_DATA" | jq -r '.id')
DATE=$(echo "$JSON_DATA" | jq -r '.created_at')

# c) Imprimir el mensaje
echo "Hola ${GITHUB_USER}. User ID: ${ID_USER}. Cuenta fue creada el: ${DATE}."

# d) Crear un log file en /tmp/<fecha>/saludos.log
LOG_DIR="/tmp/$(date +'%Y%m%d')"
LOG_FILE="${LOG_DIR}/saludos.log"

# Crear el directorio si no existe
mkdir -p "$LOG_DIR"

# Escribir el mensaje en el log file
echo "$(date +'%Y-%m-%d %H:%M:%S') - Hola ${GITHUB_USER}. User ID: ${USER_ID}. Cuenta fue creada el: ${DATE}." >> "$LOG_FILE"

echo "El mensaje fue registrado en el Log File: $LOG_FILE"

# e) Crear un cronjob para que el script se ejecute cada 5 minutos
CRON_CMD="*/5 * * * * $(pwd)/nombre_del_script.sh"
(crontab -l ; echo "$CRON_CMD") | crontab -

echo "Fue creado el Cronjob para ejecutar el script cada 5 minutos."

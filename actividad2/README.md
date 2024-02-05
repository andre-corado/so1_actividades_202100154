# Actividad 2 - Scripting

## Instrucciones: 🧑‍🏫
~~~
Crear un script en BASH que permita consultar los datos de un usuario de GITHUB. Los datos del usuario seran descargado de un webservice. Luego este debera de escribir un log con algunos de los datos del usario.

Tareas a realizar por el script:

Lea la variable GITHUB_USER
Consulte la URL https://api.github.com/users/ concatenando el valor de la variable GITHUB_USER al final
Imprimir el mensaje: “Hola <github_user>. User ID: <id>. Cuenta fue creada el: <created_at>.” Los valores entre los signos <> deben de ser tomados del JSON colsutado previamente.
Crear un log file en /tmp/<fecha>/saludos.log con la salida del mensaje anterior. Donde <fecha> corresponde a la fecha del día de ejecución del script
Crear un cronjob para que el script se ejecute cada 5 minutos
~~~
---


### Script ⌨️💾

~~~
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

~~~

---

## Prerequisitos 🪧

Contar instalado el comando jq para poder procesar el JSON, sino se puede instalar con el comando:

``` sudo apt-get install jq```

También se puede agregar el siguiente segmento al bash, si se desea evitar la parte anterior, para que lo haga automáticamente, como actividad extra para esta actividad:

~~~
# Verificar si jq está instalado
if ! command -v jq &> /dev/null; then
    echo "jq no está instalado. Instalando jq..."
    # Puedes ajustar el comando de instalación según tu sistema operativo
    # Aquí se utiliza el comando apt-get para sistemas basados en Debian/Ubuntu
    sudo apt-get update
    sudo apt-get install -y jq
fi
~~~
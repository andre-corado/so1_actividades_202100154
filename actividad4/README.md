# Actividad 4 - Chat con Named Pipes

# Crear named pipes

Dentro de una terminal se crean dos named pipes, se ingresó lo siguiente:

```bash
mkfifo pipe1
mkfifo pipe2
```

# Ejecutar clientes

Dentro de una terminal se ejecuta lo siguiente:
** considerar que se debe ejecutar el cliente en dos terminales diferentes y cambiar el número de los pipes en el código del cliente **

```bash
while true; do
  echo "Su mensaje: "
  read message
  echo "$message" > pipe1
  read response < pipe2
  echo "Respuesta: $response"
done
```


# Funcionamiento

Al ejecutar el código bash del pipe1 se observará el chat de la siguiente manera:

```bash
Su mensaje:
Hola (cliente 1)
Respuesta: Hola (cliente 2)
``` 

Al ejecutar el código bash del pipe2 se observará el chat de la siguiente manera:

```bash
Respuesta:
Hola (cliente 1)
Su mensaje:
Hola (cliente 2)
```
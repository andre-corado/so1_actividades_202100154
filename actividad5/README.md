# Actividad No.5

# Código

~~~ C
#include <unistd.h>
#include <pthread.h>

void *funcion_hilo(void *arg) {
  // ... código que se ejecutará en el hilo
  return NULL;
}

int main() {
  pid_t pid;
  pid = fork();

  if (pid == 0) { // proceso hijo
    fork();
    pthread_t hilo;
    pthread_create(&hilo, NULL, funcion_hilo, NULL);
    pthread_join(hilo, NULL);
  }

  return 0;
}
~~~


# Preguntas

## a)¿Cuántos procesos únicos son creados?

En el código proporcionado, se crean 3 procesos únicos:

Proceso padre: El proceso original que ejecuta el código.
Proceso hijo 1: Creado por la primera llamada a fork() en el proceso padre.
Proceso hijo 2: Creado por la segunda llamada a fork() en el proceso hijo 1 (opcional).

## b)¿Cuántos hilos únicos son creados?

Se crea un único hilo en el proceso hijo 1. La función pthread_create() solo se llama una vez en el código.
UNIVERSIDAD DE SAN CARLOS DE GUATEMALA
FACULTAD DE INGENIERÍA
ESCUELA DE CIENCIAS Y SISTEMAS
ACTIVIDAD NO. 1
Investigación conceptos de SO
Sergio André Lima Corado
202100154
27/01/2024

# Tipos de Kernels:
## Kernel Monolítico:
Definición: Todas las funciones del sistema operativo se ejecutan en el espacio del kernel.
Es un único bloque de código que maneja todas las operaciones del sistema.
Ejemplos: Linux, Unix.
## Kernel Microkernel:
Definición: Solo las funciones esenciales se ejecutan en el espacio del kernel, mientras que
funciones no esenciales y controladores se ejecutan en el espacio de usuario.
Ejemplos: QNX, L4.
## Kernel Híbrido:
Definición: Combina características de los kernels monolíticos y microkernels. Algunas
funciones se ejecutan en el espacio del kernel, y otras en el espacio de usuario.
Ejemplos: Windows NT, macOS.
## Kernel Exokernel:
Definición: Delega la mayoría de las decisiones de gestión de recursos a las aplicaciones,
proporcionando un conjunto mínimo de servicios. Permite un mayor control a nivel de
aplicación.
Ejemplos: XOK, ExOS.
## Kernel Nanokernel:
Definición: Un tipo especializado de microkernel extremadamente pequeño que se enfoca
en proporcionar solo las funciones más esenciales para el manejo de hardware y
comunicación entre componentes.
Ejemplos: EKA2 (en algunos aspectos).
## Kernel RTOS (Real-Time Operating System):
Definición: Diseñado para sistemas en tiempo real, garantiza que las operaciones se
realicen dentro de límites de tiempo predefinidos.
Ejemplos: FreeRTOS, VxWorks.

| Característica         | Kernel Monolítico         | Kernel Microkernel       | Kernel Híbrido            | Kernel Exokernel           | Kernel Nanokernel          | Kernel RTOS                  |
|------------------------|---------------------------|--------------------------|---------------------------|-----------------------------|-----------------------------|------------------------------|
| Rendimiento            | Bueno                      | Puede ser inferior       | Bueno a moderado           | Depende de la aplicación   | Bueno                       | Excelente para tiempo real  |
| Seguridad             | Menos seguro               | Más seguro               | Equilibrio entre seguridad y eficiencia | Depende de la implementación | Más seguro                | Enfoque en determinismo y seguridad |
| Modularidad           | Menos modular             | Altamente modular        | Moderadamente modular      | No se enfoca en la modularidad | Moderadamente modular      | Dependiendo de la implementación |
| Mantenimiento         | Puede ser más complicado  | Más fácil de mantener    | Moderadamente manejable    | Depende de la implementación | Más fácil de mantener      | Requiere cuidado para cambios en tiempo real |
| Ejemplos Prácticos    | Linux, Unix               | QNX, L4                  | Windows NT, macOS          | XOK, ExOS                   | EKA2 (en algunos aspectos)  | FreeRTOS, VxWorks            |


# USER VS KERNEL MODE

| Característica                  | Modo Usuario                   | Modo Kernel                  |
|----------------------------------|---------------------------------|------------------------------|
| Ubicación de Ejecución            | Espacio de Usuario              | Espacio del Kernel           |
| Acceso a Recursos del Sistema     | Restringido                    | Acceso Ilimitado             |
| Acceso a Instrucciones Privilegiadas | Limitado                    | Acceso Completo              |
| Protección contra Errores de Usuario | Sí                          | No                           |
| Operaciones de Bajo Nivel         | Restringido                    | Permitido                   |
| Cambio de Contexto                | Puede realizar cambios de contexto, pero con restricciones. | Puede realizar cambios de contexto libremente. |
| Ejecución de Instrucciones Específicas | Limitado                 | Permitido                   |
| Interfaz con el Hardware          | A través de llamadas al sistema | Acceso directo al hardware   |
| Ejemplos Prácticos               | Aplicaciones de usuario, procesos de usuario | Manejo del núcleo del sistema, controladores de dispositivo |

# INTERRUPTIONS VS TRAPS

| Característica                   | Interrupciones                           | Trampas (Traps)                        |
|-----------------------------------|------------------------------------------|----------------------------------------|
| **Origen**                        | Proviene de fuentes externas, como hardware o dispositivos. | Generadas por el propio programa o proceso en ejecución. |
| **Evento Asíncrono**              | Asíncronas, pueden ocurrir en cualquier momento y no son predecibles. | Sincrónicas, son causadas por una instrucción específica y son predecibles. |
| **Manejo**                        | Atendidas por rutinas de manejo de interrupciones. | Atendidas por rutinas de manejo de trampas o excepciones. |
| **Prioridad**                     | Pueden tener niveles de prioridad para determinar qué interrupción se maneja primero. | No se priorizan, ya que son causadas por instrucciones específicas. |
| **Contexto de Ejecución**         | Pueden cambiar el contexto de ejecución del kernel al espacio del usuario. | Tienden a permanecer en el mismo contexto de ejecución. |
| **Reinicio Automático**           | Algunas interrupciones pueden reiniciar automáticamente la ejecución después de ser manejadas. | Generalmente, no reinician automáticamente la ejecución después de ser manejadas. |
| **Ejemplos**                      | Interrupciones de hardware (por ejemplo, temporizadores, teclado), interrupciones de software. | Excepciones aritméticas, violaciones de acceso a memoria, divisiones por cero. |


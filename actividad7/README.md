# Actividad 7 

## Completely Fair Scheduler (CFS) de Linux

El Completely Fair Scheduler (CFS) es el planificador de procesos predeterminado en el kernel de Linux desde la versión 2.6.23. Su objetivo principal es garantizar una distribución justa y equitativa de la CPU entre los procesos en ejecución en el sistema. A continuación, se describen algunas de sus características principales y su funcionamiento:

1. **Planificación Justa:** El CFS implementa una estrategia de planificación justa, lo que significa que busca distribuir el tiempo de CPU de manera equitativa entre todos los procesos que compiten por los recursos de la CPU. No prioriza ningún proceso en particular, sino que trata a todos los procesos de manera igualitaria.

2. **Prioridad Dinámica:** En lugar de asignar prioridades estáticas a los procesos, el CFS utiliza un sistema de prioridad dinámica basado en el concepto de "partes justas" del tiempo de CPU. Cada proceso recibe una parte justa de la CPU durante un intervalo de tiempo determinado.

3. **Tiempo de Ejecución Virtual:** El CFS mantiene un seguimiento del tiempo de ejecución virtual de cada proceso, que representa la cantidad de tiempo de CPU que se le ha asignado. Esto permite al CFS calcular la proporción de tiempo de CPU que cada proceso debe recibir en función de su prioridad y el tiempo de ejecución virtual acumulado.

4. **Árbol Rojo-Negro de Procesos:** Internamente, el CFS organiza los procesos en un árbol rojo-negro para facilitar la búsqueda y la selección del siguiente proceso a ejecutar. Este árbol se reequilibra dinámicamente para mantener un rendimiento óptimo del planificador.

5. **Planificación en Tiempo Real:** Aunque el CFS está diseñado principalmente para la planificación de procesos interactivos y de lotes, también puede manejar procesos en tiempo real mediante el uso de características como grupos de control de recursos (cgroups) y conjuntos de afinidad de CPU.

___
___

En otras palabras, sus características principales son: 

- **Equidad**: CFS se asegura de que cada proceso reciba una porción justa del tiempo de CPU, evitando que un solo proceso acapare el recurso.
- **Priorización**: CFS permite asignar prioridades a los procesos, lo que le da a algunos procesos mayor acceso a la CPU que a otros.
- **Jerarquía**: CFS organiza los procesos en una jerarquía de grupos y cgroups (control de grupos), permitiendo una distribución más granular del tiempo de CPU.
- **Adaptabilidad**: CFS se adapta dinámicamente a los cambios en la carga del sistema y a las necesidades de los procesos.
- **Eficiencia**: CFS es un algoritmo relativamente simple y eficiente, lo que lo hace adecuado para su uso en sistemas operativos de alto rendimiento.

Por supuesto que presenta algunas limitaciones como pueden ser:
- **Complejidad**: CFS es un algoritmo relativamente complejo, lo que puede dificultar su comprensión y implementación.
- **Overhead**: CFS puede introducir un pequeño overhead de rendimiento, especialmente en sistemas con muchos procesos.

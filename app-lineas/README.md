# App Líneas - Sistema de Consultas del Metro de Lima

**Kevin Quispe Ccolque**

Aplicación de consola en Swift que permite consultar estaciones, ver las estaciones de una línea, y buscar rutas entre dos puntos del Metro de Lima (incluyendo transbordos entre líneas y búsqueda por lugares cercanos, no solo por nombre exacto de estación).

## Contexto

Este proyecto lo hice como práctica extra fuera de los labs semanales, para reforzar el uso de `struct`, diccionarios y arrays en Swift. Usé como referencia el mapa real de las líneas del Metro de Lima (Línea 1, Línea 2, Línea 4 y el Metropolitano) para armar una base de datos con estaciones, avenidas cercanas y puntos de interés.

## Requerimientos funcionales

| # | Requerimiento | Descripción |
|---|---|---|
| RF01 | Registrar estaciones | El sistema debe almacenar cada estación con su nombre, línea, avenidas cercanas, puntos de interés y conexiones a otras líneas. |
| RF02 | Registrar líneas | El sistema debe almacenar cada línea con su nombre, color, y el orden correcto de sus estaciones. |
| RF03 | Consultar estación por nombre | El usuario debe poder ingresar el nombre de una estación (sin importar mayúsculas/minúsculas) y ver toda su información. |
| RF04 | Consultar estaciones por línea | El usuario debe poder ingresar el código de una línea y ver todas sus estaciones en el orden real de recorrido. |
| RF05 | Buscar ruta directa | Si el origen y destino están en la misma línea, el sistema debe indicar que se puede llegar sin transbordo. |
| RF06 | Buscar ruta con transbordo | Si el origen y destino están en líneas distintas, el sistema debe encontrar la estación de transbordo y mostrar el recorrido en pasos. |
| RF07 | Buscar por punto de interés | El usuario debe poder ingresar un lugar conocido (ej: "Jockey Plaza", "Aeropuerto Jorge Chávez") en vez del nombre exacto de la estación, y el sistema debe reconocer la estación más cercana asociada a ese lugar. |
| RF08 | Manejo de errores | Si una estación, línea o lugar no existe en la base de datos, el sistema debe informar al usuario en vez de fallar. |
| RF09 | Menú interactivo | El sistema debe mostrar un menú en bucle con las opciones disponibles hasta que el usuario elija salir. |

## Funcionalidades

1. **Consultar estación** — buscas una estación por nombre y te muestra su línea, avenidas cercanas, puntos de interés cercanos y si tiene transbordo a otra línea.
2. **Consultar línea** — ingresas el código de una línea (L1, L2, L4, MET) y te lista todas sus estaciones en orden.
3. **Buscar ruta** — ingresas un origen y un destino (puede ser el nombre de una estación o un lugar cercano como "Jockey Plaza") y el programa te dice si puedes ir directo o en qué estación debes hacer transbordo.

## Cómo ejecutarlo

```bash
swiftc main.swift -o app-lineas.exe
.\app-lineas.exe
```

En Mac / Xcode Playground, simplemente se pega el código dentro de un Playground nuevo y se ejecuta con el botón de Run.

## Limitación conocida

La búsqueda de rutas detecta solo **un transbordo** entre dos líneas. Si el origen y destino requieren pasar por más de una línea intermedia (ej: L1 → L2 → Metropolitano), el programa no encuentra la ruta completa. Esto se podría resolver más adelante con un algoritmo de búsqueda de caminos (como BFS), pero para el nivel actual del curso se mantuvo la lógica simple con comparación directa de conexiones.

## Prompts usados (con IA)

### Prompt 1 — Diseño de la estructura de datos

**Contexto:** Necesitaba modelar estaciones del Metro de Lima con toda su información (línea, avenidas cercanas, puntos de interés, conexiones) usando algo más ordenado que variables sueltas.

**Prompt:** "Ayúdame a diseñar una estructura de datos en Swift para modelar estaciones de metro, usando struct, que incluya nombre, línea, avenidas cercanas, puntos de interés y conexiones con otras líneas. Que sea simple, sin funciones avanzadas, para un estudiante que recién está aprendiendo colecciones."

**Resultado:** Se definieron dos `struct` (`Estacion` y `Linea`) y dos diccionarios (`mapaEstaciones` y `mapaLineas`) para tener toda la data organizada y accesible por ID.

### Prompt 2 — Lógica de búsqueda de ruta con transbordo

**Contexto:** Ya tenía la base de datos armada, pero no sabía cómo detectar automáticamente si dos estaciones necesitaban un transbordo entre líneas distintas.

**Prompt:** "Con esta base de datos de estaciones y líneas, ayúdame a crear una función que reciba una estación de origen y una de destino, y me diga si puedo ir directo (misma línea) o en qué estación debo hacer transbordo si están en líneas diferentes. Que sea básico, sin usar algoritmos complejos de rutas."

**Resultado:** Se creó la función `buscarRuta()`, que compara la línea del origen y destino, y si son distintas, recorre el diccionario buscando una estación que pertenezca a la línea de origen y tenga una conexión hacia la línea de destino.

### Prompt 3 — Búsqueda por puntos de interés

**Contexto:** Quería que el usuario pudiera buscar rutas usando lugares conocidos (como "Jockey Plaza" o "Centro de Lima") y no solo el nombre exacto de una estación, para que la app sea más realista y fácil de usar.

**Prompt:** "Ayúdame a agregar una función que busque una estación a partir de un punto de interés cercano, y que la búsqueda de rutas primero intente encontrar por nombre de estación y, si no encuentra, busque por punto de interés."

**Resultado:** Se crearon las funciones `buscarEstacionPorPuntoDeInteres()` y `buscarEstacionGeneral()`, que combinan ambas búsquedas para que el usuario pueda escribir tanto el nombre de una estación como el de un lugar conocido.
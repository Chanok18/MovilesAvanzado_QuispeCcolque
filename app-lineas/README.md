# App Líneas - Sistema de Consultas del Metro de Lima
KEVIN QUISPE CCOLQUE
Aplicación de consola en Swift que permite consultar estaciones, ver las estaciones de una línea, y buscar rutas entre dos puntos del Metro de Lima (incluyendo transbordos entre líneas).


## Funcionalidades

1. **Consultar estación** — buscas una estación por nombre y te muestra su línea, avenidas cercanas, puntos de interés cercanos y si tiene transbordo a otra línea.
2. **Consultar línea** — ingresas el código de una línea (L1, L2, L4, MET) y te lista todas sus estaciones en orden.
3. **Buscar ruta** — ingresas una estación de origen y una de destino, y el programa te dice si puedes ir directo (misma línea) o en qué estación debes hacer transbordo si están en líneas distintas.

## Cómo ejecutarlo

```bash
swiftc main.swift -o app-lineas.exe
.\app-lineas.exe
```


## Prompts usados (con IA)

### Prompt 1 — Diseño de la estructura de datos

**Contexto:** Necesitaba modelar estaciones del Metro de Lima con toda su información (línea, avenidas cercanas, puntos de interés, conexiones) usando algo más ordenado que variables sueltas.

**Prompt:** "Ayúdame a diseñar una estructura de datos en Swift para modelar estaciones de metro, usando struct, que incluya nombre, línea, avenidas cercanas, puntos de interés y conexiones con otras líneas. Que sea simple, sin funciones avanzadas, para un estudiante que recién está aprendiendo colecciones."

**Resultado:** Se definieron dos `struct` (`Estacion` y `Linea`) y dos diccionarios (`mapaEstaciones` y `mapaLineas`) para tener toda la data organizada y accesible por ID.

### Prompt 2 — Lógica de búsqueda de ruta con transbordo

**Contexto:** Ya tenía la base de datos armada, pero no sabía cómo detectar automáticamente si dos estaciones necesitaban un transbordo entre líneas distintas.

**Prompt:** "Con esta base de datos de estaciones y líneas, ayúdame a crear una función que reciba una estación de origen y una de destino, y me diga si puedo ir directo (misma línea) o en qué estación debo hacer transbordo si están en líneas diferentes. Que sea básico, sin usar algoritmos complejos de rutas."

**Resultado:** Se creó la función `buscarRuta()`, que compara la línea del origen y destino, y si son distintas, recorre el diccionario buscando una estación que pertenezca a la línea de origen y tenga una conexión hacia la línea de destino.
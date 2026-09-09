# App Líneas - Sistema de Consultas del Metro de Lima

**Kevin Quispe Ccolque**

Aplicación de consola en Swift que permite consultar estaciones, ver las estaciones de una línea, y buscar rutas entre dos puntos del Metro de Lima (incluyendo transbordos entre líneas y búsqueda por lugares cercanos, no solo por nombre exacto de estación).

## Requerimientos funcionales

| # | Requerimiento | Descripción |
|---|---|---|
| RF01 | Registrar estaciones | El sistema debe almacenar cada estación con su nombre, línea, avenidas cercanas, puntos de interés y conexiones a otras líneas. |
| RF02 | Registrar líneas | El sistema debe almacenar cada línea con su nombre, color, y el orden correcto de sus estaciones. |
| RF03 | Consultar estación por nombre | El usuario debe poder ingresar el nombre de una estación (sin importar mayúsculas/minúsculas) y ver toda su información. |
| RF04 | Consultar estaciones por línea | El usuario debe poder ingresar el código de una línea y ver todas sus estaciones en el orden real de recorrido. |
| RF05 | Buscar ruta directa | Si el origen y destino están en la misma línea, el sistema debe indicar que se puede llegar sin transbordo. |
| RF06 | Buscar ruta con transbordo | Si el origen y destino están en líneas distintas, el sistema debe encontrar la estación de transbordo y mostrar el recorrido en pasos. |
| RF07 | Buscar por punto de interés | El usuario debe poder ingresar un lugar conocido (ej: "Jockey Plaza", "Aeropuerto") en vez del nombre exacto de la estación, y el sistema debe reconocer la estación más cercana asociada a ese lugar. |
| RF08 | Manejo de errores | Si una estación, línea o lugar no existe en la base de datos, el sistema debe informar al usuario en vez de fallar. |
| RF09 | Menú interactivo | El sistema debe mostrar un menú en bucle con las opciones disponibles hasta que el usuario elija salir. |

## Funcionalidades

1. **Consultar estación** — buscas una estación por nombre y te muestra su línea, avenidas cercanas, puntos de interés cercanos y si tiene transbordo a otra línea.
2. **Consultar línea** — ingresas el código de una línea (L1, L2, L4, MET) y te lista todas sus estaciones en orden.
3. **Buscar ruta** — ingresas un origen y un destino (puede ser el nombre de una estación o un lugar cercano como "Jockey Plaza") y el programa te dice si puedes ir directo o en qué estación debes hacer transbordo.

## Cómo ejecutarlo

```bash
swiftc main.swift -o app-lineas1.exe
.\app-lineas1.exe
```

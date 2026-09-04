# Prompts — Lab 03
## Docente: Juan Leon — Tecsup

## Ejercicio 6 — Gestión de notas

### Prompt (CTRFE):
**CONTEXTO:** Estudiante de iOS en semana 3, aprendiendo colecciones (Array, Dictionary, Set) en Swift dentro de un Playground.

**TAREA:** Crear un sistema que pida N alumnos con nombre y 3 notas cada uno, guarde todo en un diccionario `[String: [Double]]`, calcule el promedio de cada alumno, lo clasifique con un `switch` (Excelente/Bueno/Aprobado/Desaprobado), muestre estadísticas generales (promedio general, nota más alta/baja, % de aprobados) y finalmente ordene a los alumnos por promedio.

**RESTRICCIONES:** Solo usar conocimientos de las semanas 1 a 3 (sin struct, class ni funciones complejas). Comentar cada línea del código.

**FORMATO:** Código Swift con un comentario específico al costado de cada línea.

**EJEMPLO:** Un diccionario `notasAlumnos["Ana"] = [15.0, 18.0, 12.0]` calcula su promedio y lo clasifica automáticamente.

## Ejercicio 7 — Inventario con menú

### Prompt (CTRFE):
**CONTEXTO:** Mismo curso, aplicando diccionarios junto con un menú interactivo controlado por un bucle `while`.

**TAREA:** Registrar N productos (nombre, precio, stock) y mostrar un menú con 5 opciones: ver inventario, buscar producto, ver stock bajo, ver valor total y salir. El menú se repite hasta que el usuario elija salir.

**RESTRICCIONES:** Sin struct, class ni funciones complejas. Comentar cada línea.

**FORMATO:** Código Swift comentado línea por línea, con un `while` controlando el menú.

**EJEMPLO:** Elegir la opción "3" debe mostrar solo los productos con stock menor a 5 unidades.
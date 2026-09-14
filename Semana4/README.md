# Prompts utilizados — Laboratorio 04
**Kevin Quispe Ccolque**

## Requerimientos del Caso 2 — Biblioteca

| # | Requerimiento | Descripción |
|---|---|---|
| RF01 | Estado del libro | Un enum `EstadoLibro` con los casos `disponible` y `prestado`. |
| RF02 | Modelo del libro | Un struct `Libro` con título, autor y estado (empieza en `.disponible`). |
| RF03 | Registro de libros | La clase `Biblioteca` debe guardar un array de libros, vacío al inicio. |
| RF04 | Préstamo | El método `prestar(titulo:)` busca el libro por índice, lo marca como prestado si está disponible, y devuelve `true` o `false` según corresponda. |
| RF05 | Devolución | El método `devolver(titulo:)` hace la lógica inversa al préstamo. |
| RF06 | Inventario | El método `inventario()` imprime cada libro con su autor y estado, usando `switch`. |
| RF07 | Simulación | Se prueban los 3 libros, un préstamo repetido, una devolución y un libro inexistente, comparando la salida con la esperada. |

## Caso 2B — Biblioteca

### Prompt 1:
"Soy estudiante de Swift en la cuarta semana del curso, trabajando en un Playground de Xcode. Necesito armar una biblioteca con un enum `EstadoLibro` (disponible/prestado), un struct `Libro` (título, autor, estado) y una clase `Biblioteca` con los métodos `agregar`, `prestar` y `devolver` (que devuelven `Bool`), más un método `inventario` que imprima todo usando `switch`. Solo puedo usar lo visto en clase hasta ahora: struct, class, enums, arrays, bucles y funciones — nada de optionals, guard let, firstIndex(where:), closures ni propiedades calculadas. El préstamo y la devolución deben recorrer el array por índice con `for i in 0..<libros.count`. Te dejo la salida esperada para que la sigas exacto."

### Respuesta de la IA:
Generó el enum, el struct y la clase completa cumpliendo con lo pedido, usando el bucle por índice tal como indiqué, y agregó comentarios explicando cada línea del código.

### Prompt 2:
"La salida que me diste ya coincide con la esperada, pero necesito que agregues un comentario específico en cada línea explicando qué hace exactamente esa línea, no un comentario general por bloque. Por ejemplo, en vez de poner 'cambia el estado', que diga por qué se modifica directamente `libros[i].estado` y no una copia sacada del array."

### Resultado final:
Con ese segundo prompt, la IA reescribió el código agregando el comentario detallado en cada línea, lo cual ayuda a entender mejor por qué se usa `struct` para `Libro` (se copia por valor) y `class` para `Biblioteca` (se comparte por referencia).

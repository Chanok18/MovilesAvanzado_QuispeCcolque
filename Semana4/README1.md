# Actividades Propuestas - Lab 04 POO en Swift

**Kevin Quispe Ccolque**
## Contexto

Estas son las 2 actividades propuestas del Lab 04, hechas después de terminar el Caso 2 (Biblioteca). La primera es sobre condicionales aplicados a una factura con descuentos, y la segunda es sobre herencia y polimorfismo con clases.

## Actividad 01: Factura de cursos

Calcula el total a pagar de un alumno que se inscribe en varios cursos de Tecsup, aplicando IGV y dos descuentos condicionales.

| # | Requerimiento |
|---|---|
| RF01 | Registrar los cursos del alumno con nombre, precio unitario y cantidad. |
| RF02 | Calcular el subtotal sumando el precio de todos los cursos. |
| RF03 | Calcular el IGV (18%) sobre el subtotal. |
| RF04 | Si el alumno lleva 3 o más cursos, aplicar 10% de descuento sobre el total con IGV. |
| RF05 | Si es alumno de Tecsup y lleva 3 o más cursos, aplicar S/ 400 de descuento adicional. |
| RF06 | Mostrar una factura final con subtotal, IGV, descuentos aplicados y el total a pagar. |

## Actividad 02: Clientes bancarios (herencia)

Modela clientes de un banco usando una clase base y dos subclases que heredan sus datos.

| # | Requerimiento |
|---|---|
| RF01 | Clase base `Cliente` con código, dirección, fecha de registro, número de cuenta y monto mínimo de apertura. |
| RF02 | Subclase `ClienteNatural` que agrega nombre completo y DNI. |
| RF03 | Subclase `ClienteJuridico` que agrega razón social, RUC y representante legal. |
| RF04 | Ambas subclases deben sobreescribir `mostrarDatos()` para mostrar sus datos propios más los heredados. |
| RF05 | Probar ambas clases en un mismo array de tipo `Cliente`, recorriéndolo con un solo `for` (polimorfismo). |

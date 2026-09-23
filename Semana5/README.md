# Lab 05 - Interfaces con UIKit

**Kevin Quispe Ccolque**

## Contexto
Estas son las 2 actividades del Lab 05, hechas en Xcode usando Storyboard y UIKit para conectar la interfaz visual con el código mediante Outlets y Actions. Ambas piden leer datos del usuario desde TextFields, hacer un cálculo, y mostrar el resultado en un Label al presionar un botón.

## Actividad 1: Calculadora de IMC

Calcula el Índice de Masa Corporal de una persona a partir de su peso y altura, y muestra si está en un rango saludable.

| # | Requerimiento |
|---|---|
| RF01 | Recibir el peso (kg) y la altura (m) ingresados por el usuario en dos TextFields. |
| RF02 | Validar que ambos campos tengan un valor numérico distinto de cero antes de calcular. |
| RF03 | Calcular el IMC con la fórmula: peso / (altura × altura). |
| RF04 | Clasificar el resultado en Bajo peso, Peso normal, Sobrepeso u Obesidad según el rango. |
| RF05 | Mostrar el IMC calculado junto con su clasificación en un Label, al presionar el botón "Calcular". |

## Actividad 2: Calculadora de Préstamos
Calcula la cuota mensual y el monto total a pagar de un préstamo, usando la fórmula de amortización.

| # | Requerimiento |
|---|---|
| RF01 | Recibir el capital inicial, la tasa de interés anual y el plazo en años, ingresados por el usuario. |
| RF02 | Validar que los 3 campos tengan valores numéricos distintos de cero antes de calcular. |
| RF03 | Convertir la tasa anual a tasa mensual y el plazo en años a número total de cuotas (meses). |
| RF04 | Calcular la cuota mensual aplicando la fórmula de amortización: M = P × (r(1+r)ⁿ) / ((1+r)ⁿ − 1). |
| RF05 | Calcular el monto total a pagar multiplicando la cuota mensual por el número total de cuotas. |
| RF06 | Mostrar la cuota mensual y el total a pagar en un Label, al presionar el botón "Calcular". |

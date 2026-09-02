# Sistema de Pagos - Parte 2 (Mejoras)
# Kevin Quispe Ccolque


proceso de mejora del sistema de pagos en cuotas (Contexto, Tarea, Rol, Formato, Ejemplo) para cada prompt utilizado.

---

## Prompt 1: Validación del plan de pago

**Contexto:** Tenía un sistema de pagos en Swift que pedía al usuario elegir un plan de cuotas (6, 12 o 24 meses)

**Tarea:** Agregar una validación que obligue al usuario a ingresar solamente 6, 12 o 24

**Rol:** Actuar como un tutor de programación en Swift que explica el código con comentarios simples, sin usar funciones avanzadas.

**Formato:** Código Swift comentado, manteniendo el mismo estilo del programa original 

**Ejemplo/Ejecución:**
```swift
var planCuotas = 0

while planCuotas != 6 && planCuotas != 12 && planCuotas != 24 {
    print("Elige el plan de pago (6, 12, 24):")
    planCuotas = Int(readLine() ?? "0") ?? 0
    if planCuotas != 6 && planCuotas != 12 && planCuotas != 24 {
        print("Plan invalido, solo se acepta 6, 12 o 24.\n")
    }
}
```

**Corrección aplicada:** Se usó un bucle `while` que se repite hasta que el valor ingresado sea válido, evitando que el programa continúe con un plan incorrecto.

---

## Prompt 2: Pago adelantado

**Contexto:** El sistema ya calculaba las cuotas fijas mensuales, pero no contemplaba la opción de que el usuario quisiera adelantar un pago extra

**Tarea:** Permitir que el usuario indique en qué mes hará un pago adelantado (0 = ninguno) y cuánto monto adicional pagará ese mes, sumándolo solo a la cuota de ese mes.

**Rol:** Tutor de programación explicando paso a paso, usando estructuras básicas (`if`, variables) sin funciones complejas.

**Formato:** Código Swift comentado, integrado al flujo existente del programa.

**Ejemplo/Ejecución:**
```swift
print("¿En que mes hara un pago adelantado? (0 = ninguno):")
let mesAdelanto = Int(readLine() ?? "0") ?? 0

var montoAdicional: Double = 0.0
if mesAdelanto != 0 {
    print("Monto adicional a pagar ese mes (S/):")
    montoAdicional = Double(readLine() ?? "0") ?? 0.0
}

// dentro del bucle de la tabla:
if mes == mesAdelanto { pagoDelMes += montoAdicional }
```

**Corrección aplicada:** Se agregó también un `break` dentro del bucle para cortar la tabla apenas el saldo llegue a cero, ya que con el pago adelantado el usuario puede terminar de pagar antes de lo previsto.

---

## Prompt 3: Tabla de cronograma alineada

**Contexto:** La tabla de pagos usaba tabulaciones (`\t`) para separar las columnas, pero al tener números de distinto tamaño (ej: `100.00` vs `3208.33`), las columnas se desalineaban visualmente.

**Tarea:** Mejorar la tabla para que todas las columnas (Mes, Fecha, Monto inicial, Pago, Resta x pagar) queden alineadas correctamente sin importar el tamaño de los números.

**Rol:** Tutor de programación en Swift, priorizando una solución simple y explicable, sin usar librerías externas de formato de tablas.

**Formato:** Función auxiliar corta en Swift, con comentarios explicando su lógica.

**Ejemplo/Ejecución:**
```swift
func rellenar(_ texto: String, _ ancho: Int) -> String {
    if texto.count >= ancho { return texto + " " }
    return texto + String(repeating: " ", count: ancho - texto.count)
}
```

**Corrección aplicada:** Se creó la función `rellenar`, que completa cada texto con espacios en blanco hasta un ancho fijo de columna, logrando que la tabla se vea alineada como una tabla real.

---

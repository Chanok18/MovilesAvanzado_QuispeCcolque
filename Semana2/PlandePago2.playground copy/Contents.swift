import Foundation

// funcion para alinear columnas rellenando con espacios
func rellenar(_ texto: String, _ ancho: Int) -> String {
    if texto.count >= ancho { return texto + " " }
    return texto + String(repeating: " ", count: ancho - texto.count)
}

// --- PASO 1: DATOS DEL PRODUCTO ---
print("Nombre del producto:")
let producto = readLine() ?? ""
print("Precio unitario:")
let precioUnit = Double(readLine() ?? "0") ?? 0.0
print("Cantidad:")
let cantidad = Int(readLine() ?? "0") ?? 0

let montoTotalCompra = precioUnit * Double(cantidad) // precio x cantidad
print("\nMONTO TOTAL: S/ \(montoTotalCompra)")

// --- PASO 2: PLAN DE PAGO (con validacion) ---
var planCuotas = 0

// se repite hasta que el usuario ponga un plan valido
while planCuotas != 6 && planCuotas != 12 && planCuotas != 24 {
    print("Elige el plan de pago (6, 12, 24):")
    planCuotas = Int(readLine() ?? "0") ?? 0
    if planCuotas != 6 && planCuotas != 12 && planCuotas != 24 {
        print("Plan invalido, solo se acepta 6, 12 o 24.\n")
    }
}
var porcentajeInteres: Double = 0.0

// interes segun el plan elegido
switch planCuotas {
case 6: porcentajeInteres = 0.20
case 12: porcentajeInteres = 0.40
case 24: porcentajeInteres = 0.60
default: porcentajeInteres = 0.0
}
let interesMonto = montoTotalCompra * porcentajeInteres
let montoFinal = montoTotalCompra + interesMonto
let montoCuota = montoFinal / Double(planCuotas)

// --- PASO 3: PAGO ADELANTADO ---
print("¿En que mes hara un pago adelantado? (0 = ninguno):")
let mesAdelanto = Int(readLine() ?? "0") ?? 0

var montoAdicional: Double = 0.0
if mesAdelanto != 0 {
    print("Monto adicional a pagar ese mes (S/):")
    montoAdicional = Double(readLine() ?? "0") ?? 0.0
}

// --- PASO 4: FECHA DE INICIO ---
print("Dia de pago (ej: 20):")
let diaPago = Int(readLine() ?? "1") ?? 1
print("Mes de inicio (1-12):")
var mesActual = Int(readLine() ?? "1") ?? 1
print("Año de inicio:")
var anioActual = Int(readLine() ?? "2026") ?? 2026


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

let montoTotalCompra = precioUnit * Double(cantidad)
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

// --- PASO 5: RESUMEN ---
print("\nPLAN DE PAGO")
print("Producto: \(producto)    Interes: S/ \(String(format: "%.2f", interesMonto))    Cuotas: \(planCuotas) meses")
print("Monto cuota: S/ \(String(format: "%.2f", montoCuota))    Monto final: S/ \(String(format: "%.2f", montoFinal))\n")

// --- PASO 6: TABLA DE CRONOGRAMA (alineada con rellenar) ---
print(rellenar("Mes", 5) + rellenar("Fecha", 14) + rellenar("Monto inicial", 16) + rellenar("Pago", 12) + rellenar("Resta x pagar", 14))

var saldoPendiente = montoFinal
var mesesPagados = 0

for mes in 1...planCuotas {
    if saldoPendiente <= 0 { break } // se corta si ya se pago todo antes de tiempo
    let montoInicialMes = saldoPendiente
    var pagoDelMes = montoCuota

    if mes == mesAdelanto { pagoDelMes += montoAdicional }
    saldoPendiente -= pagoDelMes
    if saldoPendiente < 0 { saldoPendiente = 0.0 } // evita saldo negativo por redondeo

    let fecha = "\(diaPago)/\(String(format: "%02d", mesActual))/\(anioActual)"
    print(rellenar("\(mes)", 5) + rellenar(fecha, 14) + rellenar(String(format: "%.2f", montoInicialMes), 16) + rellenar(String(format: "%.2f", pagoDelMes), 12) + rellenar(String(format: "%.2f", saldoPendiente), 14))
    mesesPagados += 1
    mesActual += 1
    if mesActual > 12 { mesActual = 1; anioActual += 1 } // pasa al siguiente año si se pasa de diciembre
}
print("\nMeses pagados \(mesesPagados) de \(planCuotas)")

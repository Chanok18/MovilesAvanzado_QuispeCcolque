import Foundation

//paso1
print("nombre del producto:")
let producto = readLine() ?? ""
print("precio unitario:")
let precioUnit = Double(readLine() ?? "0") ?? 0.0
print("cantidad:")
let cantidad = Int(readLine() ?? "0") ?? 0

// calculo total
let montoTotalCompra = precioUnit * Double(cantidad)
print("\nMONTO TOTAL: S/ \(montoTotalCompra)")

//pagoo
print("Elige el plan de pago (6, 12, 24):")
let planCuotas = Int(readLine() ?? "0") ?? 6
var porcentajeInteres: Double = 0.0

switch planCuotas {
case 6:
    porcentajeInteres = 0.20
case 12:
    porcentajeInteres = 0.40
case 24:
    porcentajeInteres = 0.60
default:
    porcentajeInteres = 0.0
}
let interesMonto = montoTotalCompra * porcentajeInteres
let montoFinal = montoTotalCompra + interesMonto
let montoCuota = montoFinal / Double(planCuotas)

//resumen de pagos
print("\nPLAN DE PAGO")
print("Producto: \(producto)    Interes: S/ \(interesMonto)    Cotas: \(planCuotas) mesees")
print("Monto cuota: S/ \(montoCuota)    Monto final: S/ \(montoFinal)\n")

// tablita de programacion de cuotas
print("Mes\tMonto inicial\tCuota mensual\tResta x pagar")

var saldoPendiente = montoFinal

for mes in 1...planCuotas {
    let montoInicialMes = saldoPendiente
    saldoPendiente -= montoCuota

    if saldoPendiente < 0 { saldoPendiente = 0.0 }

    print("\(mes)\t\(String(format: "%.2f", montoInicialMes))\t\t\(String(format: "%.2f", montoCuota))\t\t\(String(format: "%.2f", saldoPendiente))")
}


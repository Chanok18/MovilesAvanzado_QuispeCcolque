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


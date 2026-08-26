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

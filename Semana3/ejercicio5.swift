import Foundation
// ===== CARRITO DE COMPRAS 2.0 =====
var nombresProd: [String] = []
var preciosProd: [Double] = []
var cantidades: [Int] = []

// Pedir productos
print("¿Cuantos productos va a comprar?")
let totalProductos = Int(readLine() ?? "") ?? 0

for i in 1...totalProductos {
    print("\nProducto \(i) - Nombre:")
    nombresProd.append(readLine() ?? "")
    print("Precio unitario:")
    preciosProd.append(Double(readLine() ?? "") ?? 0)
    print("Cantidad:")
    cantidades.append(Int(readLine() ?? "") ?? 0)
}

// Calcular subtotales
var subtotales: [Double] = []
for i in 0..<nombresProd.count {
    let sub = preciosProd[i] * Double(cantidades[i])
    subtotales.append(sub)
}
// Total del carrito
var totalCarrito = 0.0
for sub in subtotales {
    totalCarrito += sub
}
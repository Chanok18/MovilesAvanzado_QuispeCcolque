import Foundation 

var preciosInv: [String: Double] = [:]
var stocksInv: [String: Int] = [:]

print("¿Cuantos productos?") 
let n = Int(readLine() ?? "") ?? 0 
for i in 1...n {
    print("\nProducto \(i) - Nombre:") 
    let nombre = readLine() ?? "" 
    print("Precio:") // pide el precio
    let precio = Double(readLine() ?? "") ?? 0
    print("Stock:") // pide el stock
    let stock = Int(readLine() ?? "") ?? 0 

    preciosInv[nombre] = precio 
    stocksInv[nombre] = stock
}
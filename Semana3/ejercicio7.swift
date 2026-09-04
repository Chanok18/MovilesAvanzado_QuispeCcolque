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
var opcion = 0 // guarda la opcion elegida en el menu

while opcion != 5 { 
    print("\n===== MENU INVENTARIO =====")
    print("1) Ver inventario") 
    print("2) Buscar producto")
    print("3) Stock bajo") 
    print("4) Valor total")
    print("5) Salir")
    print("Elige una opcion:") 
    opcion = Int(readLine() ?? "") ?? 0 // lee y convierte la opcion elegida

    if opcion == 1 { // opcion 1: ver todo el inventario
        print("\n===== INVENTARIO =====") 
        for (nombre, precio) in preciosInv { // recorre cada producto
            let stock = stocksInv[nombre] ?? 0 // obtiene su stock (0 si no existe)
            print("\(nombre): S/. \(precio) - Stock: \(stock)") // muestra el producto completo
        }
    } else if opcion == 5 { 
        print("Saliendo del sistema...") 
    }
}
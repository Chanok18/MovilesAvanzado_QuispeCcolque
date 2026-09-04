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
var opcion = 0 //guarda la opcion elegida en el menu

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
        for (nombre, precio) in preciosInv { 
            let stock = stocksInv[nombre] ?? 0 // obtiene su stock
            print("\(nombre): S/. \(precio) - Stock: \(stock)") // muestra el producto
        }

    } else if opcion == 2 { // opcion 2: buscar un producto especifico
        print("Nombre del producto a buscar:") 
        let buscado = readLine() ?? "" // guarda el nombre ingresado
        if let precio = preciosInv[buscado] { // busca el precio, si existe entra aqui
            let stock = stocksInv[buscado] ?? 0 // obtiene su stock
            print("\(buscado): S/. \(precio) - Stock: \(stock)")
        } else {
            print("Producto no encontrado")
        }

    } else if opcion == 3 { // opcion 3: productos con poco stock
        print("\n===== STOCK BAJO (< 5) =====")
        for (nombre, stock) in stocksInv { 
            if stock < 5 { // filtra solo los que tienen menos de 5 unidades
                print("\(nombre): \(stock) unidades") 
            }
        }

    } else if opcion == 4 { // opcion 4: valor total del inventario
        var total = 0.0 
        for (nombre, precio) in preciosInv { // recorre cada producto
            let stock = stocksInv[nombre] ?? 0 // obtiene su stock
            total += precio * Double(stock) // suma precio x stock al total
        }
        print("Valor total del inventario: S/. \(total)")

    } else if opcion == 5 { 
        print("Saliendo del sistema...")
    }
}


// --- Ejemplo resuelto: Directorio de contactos ---
var contactos: [String: String] = [:]

for i in 1...3 {
    print("\nContacto \(i) - Nombre:")
    let nombre = readLine() ?? ""
    print("Telefono:")
    let telefono = readLine() ?? ""
    contactos[nombre] = telefono
}

print("\n===== DIRECTORIO =====")
for (nombre, telefono) in contactos {
    print("\(nombre): \(telefono)")
}
print("\nBuscar contacto:")
let buscarContacto = readLine() ?? ""
if let tel = contactos[buscarContacto] {
    print("Telefono de \(buscarContacto): \(tel)")
} else {
    print("\(buscarContacto) no encontrado")
}
// --- TODO 4: Catalogo de productos ---
var productos: [String: Double] = [:]
for i in 1...4 {
    print("Producto \(i) - Nombre:")
    let nombre = readLine() ?? ""
    print("Precio:")
    let precio = Double(readLine() ?? "") ?? 0
    productos[nombre] = precio
}

// --- TODO 5: Mostrar catalogo ---
print("===== CATALOGO =====")
for (nombre, precio) in productos {
    print("\(nombre): S/. \(precio)")
}

// --- TODO 6: Valor total ---
var valorTotal = 0.0
for (_, precio) in productos {
    valorTotal += precio
}
print("Valor total: S/. \(valorTotal)")

// --- TODO 7: Buscar producto ---
print("Buscar producto:")
let buscarProd = readLine() ?? ""
if let precioEncontrado = productos[buscarProd] {
    print("\(buscarProd) cuesta S/. \(precioEncontrado)")
} else {
    print("Producto no encontrado")
}
var edades: [String: Int] = ["Ana": 20, "Luis": 22, "Maria": 19]
var mayores: [String] = []
for (nombre, edad) in edades {
    if edad >= 21 {
        mayores.append(nombre)
    }
}
print("Mayores de 21: \(mayores)")
// ANALYZE 1: Recorre el diccionario de edades y guarda en 'mayores' solo los nombres
// de las personas con 21 años o mas
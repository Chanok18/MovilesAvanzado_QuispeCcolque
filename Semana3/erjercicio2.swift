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
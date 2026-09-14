import Foundation

struct Curso {
    let nombre: String
    let precioUnitario: Double
    let cantidad: Int
}
let nombreEstudiante = "Juan Leon"
let dni = "78965412"
let esAlumnoTecsup = true
let cursos: [Curso] = [
    Curso(nombre: "Swift Avanzado", precioUnitario: 450.00, cantidad: 1),
    Curso(nombre: "IA con Python", precioUnitario: 550.00, cantidad: 2),
    Curso(nombre: "Diseño UI", precioUnitario: 500.00, cantidad: 1)
]
var subtotal = 0.0
for curso in cursos {
    subtotal += curso.precioUnitario * Double(curso.cantidad)
}
let igv = subtotal * 0.18
let totalConIGV = subtotal + igv
let cumpleTresCursos = cursos.count >= 3 // regla: 3 o mas cursos distintos

var descuentoCantidad = 0.0
if cumpleTresCursos {
    descuentoCantidad = totalConIGV * 0.10 // 10% del total con IGV
}
var descuentoTecsup = 0.0
if esAlumnoTecsup && cumpleTresCursos {
    descuentoTecsup = 400.00 // descuento fijo solo si es alumno Tecsup y compra 3+ cursos
}
let totalFinal = totalConIGV - descuentoCantidad - descuentoTecsup
let sep = String(repeating: "-", count: 40)

print("🎓 FACTURA DE CURSOS")
print("Estudiante: \(nombreEstudiante)")
print("DNI: \(dni)")
print("Alumno de Tecsup: \(esAlumnoTecsup ? "Si" : "No")")
print(sep)

for curso in cursos {
    print("\(curso.nombre) x\(curso.cantidad) - S/ \(String(format: "%.2f", curso.precioUnitario * Double(curso.cantidad)))")
}
print(sep)
print("Subtotal: S/ \(String(format: "%.2f", subtotal))")
print("IGV (18%): S/ \(String(format: "%.2f", igv))")
print("Total con IGV: S/ \(String(format: "%.2f", totalConIGV))")

if descuentoCantidad > 0 {
    print("Descuento 10% por cantidad: -S/ \(String(format: "%.2f", descuentoCantidad)) ")
}
if descuentoTecsup > 0 {
    print("Descuento especial Tecsup: -S/ \(String(format: "%.2f", descuentoTecsup)) ")
}
print(sep)
print("TOTAL FINAL A PAGAR: S/ \(String(format: "%.2f", totalFinal))")
let sep = String(repeating: "-", count: 40)

print("FACTURA DE CURSOS")
print("Estudiante: \(nombreEstudiante)")
print("DNI: \(dni)")
print("Alumno de Tecsup: \(esAlumnoTecsup ? "Si ✅" : "No")")
print(sep)
for curso in cursos {
    print("\(curso.nombre) x\(curso.cantidad) - S/ \(String(format: "%.2f", curso.precioUnitario * Double(curso.cantidad)))")
}

print(sep)
print("Subtotal: S/ \(String(format: "%.2f", subtotal))")
print("IGV (18%): S/ \(String(format: "%.2f", igv))")
print("Total con IGV: S/ \(String(format: "%.2f", totalConIGV))")
if descuentoCantidad > 0 {
    print("Descuento 10% por cantidad: -S/ \(String(format: "%.2f", descuentoCantidad))")
}
if descuentoTecsup > 0 {
    print("Descuento especial Tecsup: -S/ \(String(format: "%.2f", descuentoTecsup))")
}
print(sep)
print("TOTAL FINAL A PAGAR: S/ \(String(format: "%.2f", totalFinal))")
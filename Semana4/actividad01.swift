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
    Curso(nombre: "Diseño UI", precioUnitario: 400.00, cantidad: 1)
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
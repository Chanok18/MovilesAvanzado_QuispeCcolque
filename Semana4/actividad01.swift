import Foundation
struct Curso {
    let nombre: String
    let precio: Double
    let cantidad: Int
}

let nombre = "Kevin Quispe Ccolque"
let dni = "60778942"
let esAlumnoTecsup = true
let cursos: [Curso] = [
    Curso(nombre: "Swift Avanzado", precio: 450.00, cantidad: 1),
    Curso(nombre: "IA con Python", precio: 650.00, cantidad: 2),
    Curso(nombre: "Diseño UX/UI", precio: 500.00, cantidad: 1)
]

//Funciones de calculo
func calcularSubtotal() -> Double {
    var subtotal = 0.0

    for curso in cursos {
        subtotal += curso.precio * Double(curso.cantidad)
    }

    return subtotal
}
func calcularIGV() -> Double {
    let subtotal = calcularSubtotal()
    return subtotal * 0.18
}
func calcularTotalConIGV() -> Double {
    let subtotal = calcularSubtotal()
    let igv = calcularIGV()

    return subtotal + igv
}

func calcularDescuento10() -> Double {
    let cumpleTresCursos = cursos.count >= 3

    if cumpleTresCursos {
        return calcularTotalConIGV() * 0.10
    }

    return 0.0
}
func calcularDescuentoTecsup() -> Double {
    let cumpleTresCursos = cursos.count >= 3

    if esAlumnoTecsup && cumpleTresCursos {
        return 400.00
    }

    return 0.0
}
func calcularTotalFinal() -> Double {
    let totalConIGV = calcularTotalConIGV()
    let desc10 = calcularDescuento10()
    let descTecsup = calcularDescuentoTecsup()

    return totalConIGV - desc10 - descTecsup
}

//Mostrar factura
func mostrarFactura() {
    // Se calcula una sola vez y se reutiliza
    let subtotal = calcularSubtotal()
    let igv = calcularIGV()
    let totalConIGV = calcularTotalConIGV()
    let desc10 = calcularDescuento10()
    let descTecsup = calcularDescuentoTecsup()
    let totalFinal = calcularTotalFinal()

    print("🎓 FACTURA DE CURSOS")
    print("Estudiante: \(nombre)")
    print("DNI: \(dni)")

    if esAlumnoTecsup {
        print("Alumno de Tecsup: Sí ")
    } else {
        print("Alumno de Tecsup: No")
    }

    print("----------------------------")

    for curso in cursos {
        let totalCurso = curso.precio * Double(curso.cantidad)

        print("\(curso.nombre) x\(curso.cantidad) - S/ \(String(format: "%.2f", totalCurso))")
    }

    print("----------------------------")
    print("Subtotal: S/ \(String(format: "%.2f", subtotal))")
    print("IGV (18%): S/ \(String(format: "%.2f", igv))")
    print("Total con IGV: S/ \(String(format: "%.2f", totalConIGV))")

    if desc10 > 0 {
        print("Descuento 10% por cantidad: -S/ \(String(format: "%.2f", desc10)) ")
    }
    if descTecsup > 0 {
        print("Descuento especial Tecsup: -S/ \(String(format: "%.2f", descTecsup)) ")
    }
    print("----------------------------")
    print("TOTAL FINAL A PAGAR: S/ \(String(format: "%.2f", totalFinal))")
}
mostrarFactura()
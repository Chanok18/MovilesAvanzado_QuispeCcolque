import Foundation
enum EstadoLibro {
    case disponible
    case prestado
}

struct Libro {
    let titulo: String
    let autor: String
    var estado: EstadoLibro = .disponible
}
class Biblioteca {
    var libros: [Libro] = []

    func agregar(libro: Libro) {
        libros.append(libro)
    }
    func prestar(titulo: String) -> Bool {
        for i in 0..<libros.count {
            if libros[i].titulo == titulo {
                if libros[i].estado == .disponible {
                    libros[i].estado = .prestado
                    print("Prestamo aprobado: \(titulo)")
                    return true
                } else {
                    print("Error: \(titulo) ya esta prestado")
                    return false
                }
            }
        }
        print("Error: no existe \(titulo)")
        return false
    }

    func devolver(titulo: String) -> Bool {
        for i in 0..<libros.count {
            if libros[i].titulo == titulo {
                if libros[i].estado == .prestado {
                    libros[i].estado = .disponible
                    print("Devolucion registrada: \(titulo)")
                    return true
                } else {
                    print("Error: \(titulo) no estaba prestado")
                    return false
                }
            }
        }
        print("Error: no existe \(titulo)")
        return false
    }
    func inventario() {
        print("===== INVENTARIO =====")
        for libro in libros {
            switch libro.estado {
            case .disponible:
                print("\(libro.titulo) (\(libro.autor)) - disponible")
            case .prestado:
                print("\(libro.titulo) (\(libro.autor)) - prestado")
            }
        }
    }
}
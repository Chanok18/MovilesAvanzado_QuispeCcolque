import Foundation 

// ===== CASO 2 - PARTE B: BIBLIOTECA (CON IA) =====
enum EstadoLibro { 
    case disponible // el libro puede prestarse
    case prestado   // el libro ya esta prestado a alguien
}

struct Libro { // struct porque cada libro es un dato independiente que se copia sin problema
    let titulo: String 
    let autor: String  
    var estado: EstadoLibro = .disponible // empieza disponible por defecto, si cambia (var)
}
class Biblioteca { // class porque debe ser UNA sola instancia compartida (referencia)
    var libros: [Libro] = [] // array que guarda todos los libros, empieza vacio

    func agregar(libro: Libro) { // agrega un libro nuevo al array
        libros.append(libro) // append inserta el libro al final del array
    }

    func prestar(titulo: String) -> Bool { // intenta prestar un libro por su titulo
        for i in 0..<libros.count { // recorre el array por indice, no por valor
            if libros[i].titulo == titulo { // compara el titulo de la posicion actual
                if libros[i].estado == .disponible { // revisa si esta disponible
                    libros[i].estado = .prestado 
                    print("Prestamo aprobado: \(titulo)") 
                    return true // indica que el prestamo se realizo
                } else {
                    print("Error: \(titulo) ya esta prestado")
                    return false // indica que no se pudo prestar
                }
            }
        }
        print("Error: no existe \(titulo)") // si termina el for sin encontrar el libro
        return false // indica que no existe
    }

    func devolver(titulo: String) -> Bool { // logica inversa de prestar
        for i in 0..<libros.count { // recorre el array por indice
            if libros[i].titulo == titulo { // busca el titulo exacto
                if libros[i].estado == .prestado { // solo se puede devolver si estaba prestado
                    libros[i].estado = .disponible // lo marca disponible de nuevo
                    print("Devolucion registrada: \(titulo)") // mensaje de exito
                    return true // devolucion exitosa
                } else {
                    print("Error: \(titulo) no estaba prestado") // no se puede devolver algo no prestado
                    return false // fallo la devolucion
                }
            }
        }
        print("Error: no existe \(titulo)") // el libro no existe en el array
        return false // fallo porque no existe
    }

    func inventario() { // imprime el estado de todos los libros
        print("===== INVENTARIO =====") // encabezado del reporte
        for libro in libros { // recorre cada libro del array
            switch libro.estado {
            case .disponible: // caso disponible
                print("\(libro.titulo) (\(libro.autor)) - disponible") 
            case .prestado: // caso prestado
                print("\(libro.titulo) (\(libro.autor)) - prestado") 
            }
        }
    }
}
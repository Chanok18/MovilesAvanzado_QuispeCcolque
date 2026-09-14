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
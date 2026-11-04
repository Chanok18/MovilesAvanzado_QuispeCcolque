import Foundation
import SwiftData

@Model
class Curso {
    var nombre: String
    // Al borrar un curso, sus alumnos permanecen sin curso.
    @Relationship(deleteRule: .nullify, inverse: \Alumno.curso)
    var alumnos: [Alumno] = []

    init(nombre: String) { self.nombre = nombre }
}

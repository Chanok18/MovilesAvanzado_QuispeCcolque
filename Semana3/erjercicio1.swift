import Foundation
// --- Ejemplo resuelto: Registro de notas interactivo ---
//array
var notas: [Double] = []

for i in 1...3 {
    print("Ingrese la nota \(i):")
    let entrada = readLine() ?? ""
    let nota = Double(entrada) ?? 0
    notas.append(nota)
}

print("\nNotas ingresadas: \(notas)")
print("Total de notas: \(notas.count)")
var suma = 0.0
for nota in notas {
    suma += nota
}
let promedio = suma / Double(notas.count)

print("Suma: \(suma)")
print("Promedio: \(promedio)")
print("Nota mas alta: \(notas.max()!)")
print("Nota mas baja: \(notas.min()!)")
print("Notas ordenadas: \(notas.sorted())")

// --- TODO 1: Registro de 5 alumnos ---
var alumnos: [String] = []
for i in 1...5 {
    print("Nombre del alumno \(i):")
    let nombre = readLine() ?? ""
    alumnos.append(nombre)
}
print("Alumnos: \(alumnos)")
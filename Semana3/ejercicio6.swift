import Foundation // importa funciones base de Swift

var notasAlumnos: [String: [Double]] = [:] 

print("¿Cuantos alumnos?") 
let cantidad = Int(readLine() ?? "") ?? 0 // lee y convierte a entero, si falla usa 0
for i in 1...cantidad { // repite una vez por cada alumno
    print("\nAlumno \(i) - Nombre:") 
    let nombre = readLine() ?? "" // guarda el nombre ingresado

    var notas: [Double] = [] // array vacio para las 3 notas de este alumno
    for j in 1...3 { 
        print("Nota \(j):") // pide la nota numero j
        let nota = Double(readLine() ?? "") ?? 0 // convierte a decimal, si falla usa 0
        notas.append(nota) // agrega la nota al array
    }
    notasAlumnos[nombre] = notas // guarda el array de notas bajo el nombre del alumno
}
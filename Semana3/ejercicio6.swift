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
    notasAlumnos[nombre] = notas 
}
print("\n===== RESULTADOS POR ALUMNO =====") 

for (nombre, notas) in notasAlumnos { // recorre cada alumno del diccionario
    var suma = 0.0 // acumulador para sumar las notas
    for nota in notas { // recorre las 3 notas del alumno actual
        suma += nota // suma cada nota al acumulador
    }
    let promedio = suma / Double(notas.count) // calcula el promedio

    var clasificacion = "" 
    switch promedio { 
    case 17...20:
        clasificacion = "Excelente" 
    case 14..<17:
        clasificacion = "Bueno" 
    case 13..<14:
        clasificacion = "Aprobado" 
    default:
        clasificacion = "Desaprobado"
    }

    print("\(nombre): Promedio \(promedio) -> \(clasificacion)")
}
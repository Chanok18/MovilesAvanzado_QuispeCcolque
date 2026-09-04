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
print("\n===== ESTADISTICAS GENERALES =====") // encabezado de estadisticas
var promediosPorAlumno: [String: Double] = [:] 
var sumaGeneral = 0.0 
var aprobadosCount = 0 

for (nombre, notas) in notasAlumnos { 
    var suma = 0.0 
    for nota in notas { suma += nota } 
    let promedio = suma / Double(notas.count) 
    promediosPorAlumno[nombre] = promedio 
    sumaGeneral += promedio 
    if promedio >= 13 { aprobadosCount += 1 } 
}
let promedioGeneral = sumaGeneral / Double(promediosPorAlumno.count) // promedio de todos los alumnos
let notaMasAlta = promediosPorAlumno.values.max() ?? 0 
let notaMasBaja = promediosPorAlumno.values.min() ?? 0 
let porcentajeAprobados = Double(aprobadosCount) / Double(promediosPorAlumno.count) * 100 // % de aprobados

print("Promedio general: \(promedioGeneral)") 
print("Nota mas alta: \(notaMasAlta)") 
print("Nota mas baja: \(notaMasBaja)") 
print("Porcentaje aprobados: \(porcentajeAprobados)%") 

// ordenar alumnos por promedio de mayor a menor
let ordenados = promediosPorAlumno.sorted { $0.value > $1.value } // ordena el diccionario convertido en lista de pares

print("\n===== RANKING POR PROMEDIO =====") 
for (nombre, promedio) in ordenados { // recorre la lista ya ordenada
    print("\(nombre): \(promedio)") 
}
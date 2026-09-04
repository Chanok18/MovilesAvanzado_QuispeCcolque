var alumnosIOS: Set<String> = []
print("===== ALUMNOS iOS =====")
for i in 1...3 {
    print("Alumno \(i):")
    let nombre = readLine() ?? ""
    alumnosIOS.insert(nombre)
}

var alumnosAndroid: Set<String> = []
print("\n===== ALUMNOS ANDROID =====")
for i in 1...3 {
    print("Alumno \(i):")
    let nombre = readLine() ?? ""
    alumnosAndroid.insert(nombre)
}

let enAmbos = alumnosIOS.intersection(alumnosAndroid)
let todos = alumnosIOS.union(alumnosAndroid)
let soloIOS = alumnosIOS.subtracting(alumnosAndroid)
let soloAndroid = alumnosAndroid.subtracting(alumnosIOS)
print("\n===== RESULTADOS =====")
print("En ambos: \(enAmbos)")
print("Solo iOS: \(soloIOS)")
print("Solo Android: \(soloAndroid)")
print("Total unicos: \(todos.count)")

// --- TODO 8: Eliminar duplicados ---
var numerosInput: [Int] = []
for i in 1...8 {
    print("Numero \(i):")
    let n = Int(readLine() ?? "") ?? 0
    numerosInput.append(n)
}
print("Con duplicados: \(numerosInput)")
let sinDuplicados = Array(Set(numerosInput)).sorted()
print("Sin duplicados: \(sinDuplicados)")

// --- TODO 9: Comparar asistencia ---
var lunes: Set<String> = []
print("===== ASISTENCIA LUNES =====")
for i in 1...4 {
    print("Alumno \(i):")
    lunes.insert(readLine() ?? "")
}

var martes: Set<String> = []
print("\n===== ASISTENCIA MARTES =====")
for i in 1...4 {
    print("Alumno \(i):")
    martes.insert(readLine() ?? "")
}
print("\nAmbos dias: \(lunes.intersection(martes))")
print("Solo lunes: \(lunes.subtracting(martes))")
print("Solo martes: \(martes.subtracting(lunes))")
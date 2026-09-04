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
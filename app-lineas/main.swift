import Foundation

struct Estacion {
    let id: String
    let nombre: String
    let lineaId: String
    let avenidasCercanas: [String]
    let puntosDeInteres: [String]
    let conexiones: [String] // lineas con las que hace transbordo
}
struct Linea {
    let id: String
    let nombre: String 
    let color: String
    let estaciones: [String] // ids en orden
}
let mapaLineas: [String: Linea] = [
    "L1": Linea(id: "L1", nombre: "Linea 1", color: "Verde",
        estaciones: ["BAY", "SRO", "SMA", "EAN", "GRA", "28J", "LCU", "SBS", "ANG", "VES"]),
    "L2": Linea(id: "L2", nombre: "Linea 2", color: "Morado",
        estaciones: ["PDC", "OSC", "LAJ", "GAM", "28J", "SJDM", "ATE"]),
    "L4": Linea(id: "L4", nombre: "Linea 4 (Ramal)", color: "Amarillo",
        estaciones: ["GAM2", "AER", "CLE", "SANANI"]),
    "MET": Linea(id: "MET", nombre: "Metropolitano", color: "Rojo",
        estaciones: ["GAB", "ECE2", "STA", "MAT"])
]

let mapaEstaciones: [String: Estacion] = [
    "BAY": Estacion(id: "BAY", nombre: "Bayovar", lineaId: "L1", avenidasCercanas: ["Av. Proceres"], puntosDeInteres: ["Terminal Bayovar"], conexiones: []),
    "SRO": Estacion(id: "SRO", nombre: "Santa Rosa", lineaId: "L1", avenidasCercanas: ["Av. Santa Rosa"], puntosDeInteres: [], conexiones: []),
    "SMA": Estacion(id: "SMA", nombre: "San Martin", lineaId: "L1", avenidasCercanas: ["Av. San Martin"], puntosDeInteres: [], conexiones: []),
    "EAN": Estacion(id: "EAN", nombre: "El Angel", lineaId: "L1", avenidasCercanas: ["Av. El Angel"], puntosDeInteres: ["Hospital Almenara"], conexiones: []),
    "GRA": Estacion(id: "GRA", nombre: "Grau", lineaId: "L1", avenidasCercanas: ["Av. Miguel Grau", "Av. Aviacion"], puntosDeInteres: ["Polvos Azules"], conexiones: []),
    "28J": Estacion(id: "28J", nombre: "28 de Julio", lineaId: "L1", avenidasCercanas: ["Av. 28 de Julio", "Av. Aviacion"], puntosDeInteres: ["Gamarra"], conexiones: ["L2"]),
    "LCU": Estacion(id: "LCU", nombre: "La Cultura", lineaId: "L1", avenidasCercanas: ["Av. Javier Prado", "Av. De la Cultura"], puntosDeInteres: ["Museo de la Nacion"], conexiones: []),
    "SBS": Estacion(id: "SBS", nombre: "San Borja Sur", lineaId: "L1", avenidasCercanas: ["Av. San Borja Sur"], puntosDeInteres: [], conexiones: []),
    "ANG": Estacion(id: "ANG", nombre: "Angamos", lineaId: "L1", avenidasCercanas: ["Av. Angamos"], puntosDeInteres: [], conexiones: []),
    "VES": Estacion(id: "VES", nombre: "San Juan de Miraflores", lineaId: "L1", avenidasCercanas: ["Av. Los Heroes"], puntosDeInteres: [], conexiones: []),

    "PDC": Estacion(id: "PDC", nombre: "Puerto del Callao", lineaId: "L2", avenidasCercanas: ["Av. Nestor Gambetta"], puntosDeInteres: ["Puerto del Callao"], conexiones: []),
    "OSC": Estacion(id: "OSC", nombre: "Oscar R. Benavides", lineaId: "L2", avenidasCercanas: ["Av. Oscar R. Benavides"], puntosDeInteres: [], conexiones: []),
    "LAJ": Estacion(id: "LAJ", nombre: "La Marina", lineaId: "L2", avenidasCercanas: ["Av. La Marina"], puntosDeInteres: [], conexiones: []),
    "GAM": Estacion(id: "GAM", nombre: "Nicolas Aylion", lineaId: "L2", avenidasCercanas: ["Av. Nicolas Aylion"], puntosDeInteres: [], conexiones: []),
    "SJDM": Estacion(id: "SJDM", nombre: "San Juan de Dios", lineaId: "L2", avenidasCercanas: ["Av. Circunvalacion"], puntosDeInteres: [], conexiones: []),
    "ATE": Estacion(id: "ATE", nombre: "Mercado Santa Anita", lineaId: "L2", avenidasCercanas: ["Av. Los Postes"], puntosDeInteres: ["Mercado Santa Anita"], conexiones: ["L4"]),

    "GAM2": Estacion(id: "GAM2", nombre: "Gambeta", lineaId: "L4", avenidasCercanas: ["Av. Gambeta"], puntosDeInteres: [], conexiones: []),
    "AER": Estacion(id: "AER", nombre: "Aeropuerto", lineaId: "L4", avenidasCercanas: ["Av. Faucett"], puntosDeInteres: ["Aeropuerto Jorge Chavez"], conexiones: []),
    "CLE": Estacion(id: "CLE", nombre: "Carmen de la Legua", lineaId: "L4", avenidasCercanas: ["Av. Faucett", "Av. Oscar R. Benavides"], puntosDeInteres: ["Mallplaza Bellavista"], conexiones: []),
    "SANANI": Estacion(id: "SANANI", nombre: "Santa Anita", lineaId: "L4", avenidasCercanas: ["Av. Los Postes"], puntosDeInteres: [], conexiones: ["L2"]),

    "GAB": Estacion(id: "GAB", nombre: "Gambeta (Metropolitano)", lineaId: "MET", avenidasCercanas: ["Av. Gambeta"], puntosDeInteres: [], conexiones: []),
    "ECE2": Estacion(id: "ECE2", nombre: "Estacion Central", lineaId: "MET", avenidasCercanas: ["Av. Garcilaso de la Vega", "Av. Paseo de la Republica"], puntosDeInteres: ["Real Plaza Centro Civico"], conexiones: ["L2"]),
    "STA": Estacion(id: "STA", nombre: "Estadio Nacional", lineaId: "MET", avenidasCercanas: ["Av. Petit Thouars", "Av. Paseo de la Republica"], puntosDeInteres: ["Estadio Nacional del Peru"], conexiones: []),
    "MAT": Estacion(id: "MAT", nombre: "Matellini", lineaId: "MET", avenidasCercanas: ["Av. Huaylas"], puntosDeInteres: [], conexiones: [])
]

// funcion para buscar una estacion por nombre (sin importar mayusculas/minusculas)
func buscarEstacionPorNombre(_ nombre: String) -> Estacion? {
    for (_, estacion) in mapaEstaciones {
        if estacion.nombre.lowercased() == nombre.lowercased() {
            return estacion
        }
    }
    return nil
}

// 1: Consultar estacion
func consultarEstacion() {
    print("Ingresa el nombre de la estacion:")
    let nombreBuscado = readLine() ?? ""

    if let estacion = buscarEstacionPorNombre(nombreBuscado) {
        let linea = mapaLineas[estacion.lineaId]
        print("\n===== \(estacion.nombre) =====")
        print("Linea: \(linea?.nombre ?? "") (\(linea?.color ?? ""))")
        print("Avenidas cercanas: \(estacion.avenidasCercanas.joined(separator: ", "))")
        print("Puntos de interes: \(estacion.puntosDeInteres.joined(separator: ", "))")
        if estacion.conexiones.isEmpty {
            print("No tiene transbordo a otras lineas")
        } else {
            print("Conecta con: \(estacion.conexiones.joined(separator: ", "))")
        }
    } else {
        print("Estacion no encontrada")
    }
}
// 2: Consultar linea
func consultarLinea() {
    print("Ingresa el codigo de linea (L1, L2, L4, MET):")
    let codigo = (readLine() ?? "").uppercased()
    if let linea = mapaLineas[codigo] {
        print("\n===== \(linea.nombre) (\(linea.color)) =====")
        for idEstacion in linea.estaciones {
            if let estacion = mapaEstaciones[idEstacion] {
                print("- \(estacion.nombre)")
            }
        }
    } else {
        print("Linea no encontrada")
    }
}
// 3: Buscar ruta
func buscarRuta() {
    print("Estacion de origen:")
    let origenNombre = readLine() ?? ""
    print("Estacion de destino:")
    let destinoNombre = readLine() ?? ""

    guard let origen = buscarEstacionPorNombre(origenNombre) else {
        print("Estacion de origen no encontrada")
        return
    }
    guard let destino = buscarEstacionPorNombre(destinoNombre) else {
        print("Estacion de destino no encontrada")
        return
    }

    if origen.lineaId == destino.lineaId {
        let linea = mapaLineas[origen.lineaId]
        print("\nPuedes ir directo por la \(linea?.nombre ?? "")")
        print("Ruta: \(origen.nombre) -> \(destino.nombre)")
    } else {
        var estacionTransbordo: Estacion? = nil

        for (_, estacion) in mapaEstaciones {
            if estacion.lineaId == origen.lineaId && estacion.conexiones.contains(destino.lineaId) {
                estacionTransbordo = estacion
            }
        }

        if let transbordo = estacionTransbordo {
            let lineaOrigen = mapaLineas[origen.lineaId]
            let lineaDestino = mapaLineas[destino.lineaId]
            print("\nRuta con transbordo:")
            print("1. Toma la \(lineaOrigen?.nombre ?? "") desde \(origen.nombre) hasta \(transbordo.nombre)")
            print("2. Haz transbordo a la \(lineaDestino?.nombre ?? "")")
            print("3. Continua hasta \(destino.nombre)")
        } else {
            print("No se encontro una ruta directa entre estas estaciones")
        }
    }
}
// MENU PRINCIPAL
var opcion = 0
while opcion != 4 {
    print("\n===== METRO DE LIMA =====")
    print("1) Consultar estacion")
    print("2) Consultar linea")
    print("3) Buscar ruta")
    print("4) Salir")
    print("Elige una opcion:")
    opcion = Int(readLine() ?? "") ?? 0

    if opcion == 1 {
        consultarEstacion()
    } else if opcion == 2 {
        consultarLinea()
    } else if opcion == 3 {
        buscarRuta()
    } else if opcion == 4 {
        print("Saliendo del sistema...")
    }
}
import Foundation
import SwiftData

@MainActor
class ModelContainerProvider {
    static let shared = ModelContainerProvider()
    let container: ModelContainer

    private init() {
        let schema = Schema([Alumno.self, Curso.self])
        do {
            // Crea la carpeta de soporte y utiliza un archivo SQLite persistente.
            let carpeta = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!
            try FileManager.default.createDirectory(at: carpeta, withIntermediateDirectories: true)
            let config = ModelConfiguration("AlumnosData", schema: schema,
                url: carpeta.appendingPathComponent("AlumnosData.sqlite"))
            container = try ModelContainer(for: schema, configurations: [config])
            print("Base de datos SQLite en: \(config.url.path)")
        } catch {
            fatalError("Error al inicializar ModelContainer: \(error)")
        }
    }
}

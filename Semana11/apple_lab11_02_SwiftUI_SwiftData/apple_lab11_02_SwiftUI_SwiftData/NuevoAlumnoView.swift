import SwiftUI
import SwiftData

struct NuevoAlumnoView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var apellido = ""
    @State private var nombre = ""
    @State private var dni = ""
    @State private var errorMensaje: String?

    private var camposVacios: Bool {
        [apellido, nombre, dni].contains { $0.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Datos del Alumno") {
                    TextField("Apellido", text: $apellido)
                    TextField("Nombre", text: $nombre)
                    TextField("DNI", text: $dni).keyboardType(.numberPad)
                }
                Button("Guardar Alumno", action: guardarAlumno).disabled(camposVacios)
                if let errorMensaje { Text(errorMensaje).foregroundStyle(.red) }
            }
            .navigationTitle("Nuevo Alumno")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) { Button("Cancelar") { dismiss() } }
            }
        }
    }

    // Inserta y guarda antes de cerrar el formulario.
    private func guardarAlumno() {
        let alumno = Alumno(apellido: apellido.trimmingCharacters(in: .whitespacesAndNewlines),
                            nombre: nombre.trimmingCharacters(in: .whitespacesAndNewlines),
                            dni: dni.trimmingCharacters(in: .whitespacesAndNewlines))
        modelContext.insert(alumno)
        do { try modelContext.save(); dismiss() }
        catch { modelContext.rollback(); errorMensaje = error.localizedDescription }
    }
}

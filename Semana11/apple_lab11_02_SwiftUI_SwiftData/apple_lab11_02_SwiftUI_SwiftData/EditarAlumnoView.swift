import SwiftUI
import SwiftData

struct EditarAlumnoView: View {
    @Bindable var alumno: Alumno
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var errorMensaje: String?

    var body: some View {
        NavigationStack {
            Form {
                Section("Datos del Alumno") {
                    TextField("Apellido", text: $alumno.apellido)
                    TextField("Nombre", text: $alumno.nombre)
                    TextField("DNI", text: $alumno.dni).keyboardType(.numberPad)
                }
                if let errorMensaje { Text(errorMensaje).foregroundStyle(.red) }
            }
            .navigationTitle("Editar Alumno")
            .interactiveDismissDisabled()
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Listo") {
                        // @Bindable modifica el modelo; save confirma los cambios.
                        do { try modelContext.save(); dismiss() }
                        catch { errorMensaje = error.localizedDescription }
                    }
                    .disabled([alumno.apellido, alumno.nombre, alumno.dni].contains {
                        $0.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
                    })
                }
            }
        }
    }
}

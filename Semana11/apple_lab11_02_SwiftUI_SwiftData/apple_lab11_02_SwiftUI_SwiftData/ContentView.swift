import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Alumno.apellido) private var alumnos: [Alumno]
    @State private var alumnoSeleccionado: Alumno?
    @State private var mostrarFormulario = false
    @State private var alumnoAEditar: Alumno?
    @State private var busqueda = ""
    @State private var errorMensaje: String?

    private var alumnosFiltrados: [Alumno] {
        if busqueda.isEmpty { return alumnos }
        return alumnos.filter { $0.apellido.localizedCaseInsensitiveContains(busqueda) }
    }

    var body: some View {
        NavigationSplitView {
            List(selection: $alumnoSeleccionado) {
                ForEach(alumnosFiltrados) { alumno in
                    NavigationLink(value: alumno) {
                        VStack(alignment: .leading) {
                            Text("\(alumno.apellido), \(alumno.nombre)").font(.headline)
                            Text("DNI: \(alumno.dni)").font(.subheadline)
                        }
                    }
                }
                .onDelete(perform: deleteAlumnos)
            }
            .searchable(text: $busqueda, prompt: "Buscar por apellido")
            .navigationTitle("Alumnos")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) { EditButton() }
                ToolbarItem {
                    Button { mostrarFormulario = true } label: {
                        Label("Nuevo Alumno", systemImage: "plus")
                    }
                }
                ToolbarItem {
                    Button(action: asignarCursoDemo) { Label("Curso demo", systemImage: "book") }
                }
            }
        } detail: {
            if let alumno = alumnoSeleccionado {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Detalles del Alumno").font(.title2)
                    Text("Nombre: \(alumno.nombre)")
                    Text("Apellido: \(alumno.apellido)")
                    Text("DNI: \(alumno.dni)")
                    Text("Curso: \(alumno.curso?.nombre ?? "Sin curso")")
                    Button("Editar") { alumnoAEditar = alumno }
                }.padding()
            } else { Text("Selecciona un alumno") }
        }
        .sheet(isPresented: $mostrarFormulario) { NuevoAlumnoView() }
        .sheet(item: $alumnoAEditar) { EditarAlumnoView(alumno: $0) }
        .alert("Error al guardar", isPresented: Binding(
            get: { errorMensaje != nil }, set: { if !$0 { errorMensaje = nil } }
        )) { Button("Aceptar") { errorMensaje = nil } }
        message: { Text(errorMensaje ?? "") }
    }

    // Los índices pertenecen a la lista filtrada que ve el usuario.
    private func deleteAlumnos(offsets: IndexSet) {
        let eliminar = offsets.map { alumnosFiltrados[$0] }
        for alumno in eliminar {
            if alumnoSeleccionado == alumno { alumnoSeleccionado = nil }
            modelContext.delete(alumno)
        }
        do { try modelContext.save() }
        catch { modelContext.rollback(); errorMensaje = error.localizedDescription }
    }

    // Reutiliza el curso demo y guarda ambos lados de la relación.
    private func asignarCursoDemo() {
        let nombreCurso = "Programación en Móviles"
        let request = FetchDescriptor<Curso>(predicate: #Predicate { $0.nombre == nombreCurso })
        do {
            let curso = try modelContext.fetch(request).first ?? Curso(nombre: nombreCurso)
            if curso.modelContext == nil { modelContext.insert(curso) }
            for alumno in alumnos { alumno.curso = curso }
            try modelContext.save()
        } catch { modelContext.rollback(); errorMensaje = error.localizedDescription }
    }
}

#Preview {
    ContentView().modelContainer(for: [Alumno.self, Curso.self], inMemory: true)
}

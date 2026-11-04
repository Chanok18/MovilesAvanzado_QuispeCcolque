import UIKit
import CoreData

extension ViewController {
    // Filtra sin distinguir mayúsculas ni tildes.
    func buscarContactos(texto: String) -> [Contacto] {
        let request: NSFetchRequest<Contacto> = Contacto.fetchRequest()
        request.predicate = NSPredicate(format: "nombre CONTAINS[cd] %@", texto)
        request.sortDescriptors = [NSSortDescriptor(key: "nombre", ascending: true)]
        do { return try conexion().fetch(request) }
        catch { mostrarError(error); return [] }
    }

    func updateSearchResults(for searchController: UISearchController) { cargarInfoCoreData() }

    // Reutiliza Amigos y asigna el primer contacto visible, solo al pulsar el botón.
    func probarRelacion() {
        guard let primero = contactos.first else {
            mostrarMensaje("Registra un contacto primero.")
            return
        }
        let contexto = conexion()
        let request: NSFetchRequest<Grupo> = Grupo.fetchRequest()
        request.predicate = NSPredicate(format: "nombre == %@", "Amigos")
        request.fetchLimit = 1
        do {
            let grupo = try contexto.fetch(request).first ?? Grupo(context: contexto)
            grupo.nombre = "Amigos"
            primero.grupo = grupo
            try contexto.save()
            cargarInfoCoreData()
            let mensaje = "El grupo Amigos tiene \(grupo.contactos?.count ?? 0) contacto(s)"
            print(mensaje)
            mostrarMensaje(mensaje)
        } catch { contexto.rollback(); mostrarError(error) }
    }

    func contactosDelGrupo(_ nombreGrupo: String) -> [Contacto] {
        let request: NSFetchRequest<Contacto> = Contacto.fetchRequest()
        request.predicate = NSPredicate(format: "grupo.nombre == %@", nombreGrupo)
        request.sortDescriptors = [NSSortDescriptor(key: "nombre", ascending: true)]
        do { return try conexion().fetch(request) }
        catch { mostrarError(error); return [] }
    }

    @objc func opcionesGrupo() {
        let alerta = UIAlertController(title: "Grupo Amigos", message: "La demo asigna el primer contacto visible.", preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "Asignar primero a Amigos", style: .default) { _ in self.probarRelacion() })
        alerta.addAction(UIAlertAction(title: "Consultar Amigos", style: .default) { _ in
            let nombres = self.contactosDelGrupo("Amigos").map { $0.nombre ?? "" }
            self.mostrarMensaje(nombres.isEmpty ? "Amigos no tiene contactos." : nombres.joined(separator: "\n"))
        })
        alerta.addAction(UIAlertAction(title: "Cancelar", style: .cancel))
        present(alerta, animated: true)
    }
}

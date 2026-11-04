import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    let buscador = UISearchController(searchResultsController: nil)
    @IBOutlet weak var TablaContacto: UITableView!
    var contactos = [Contacto]()

    override func viewDidLoad() {
        super.viewDidLoad()
        TablaContacto.delegate = self
        TablaContacto.dataSource = self
        buscador.searchResultsUpdater = self
        buscador.obscuresBackgroundDuringPresentation = false
        buscador.searchBar.placeholder = "Buscar por nombre"
        navigationItem.searchController = buscador
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Grupo", style: .plain, target: self, action: #selector(opcionesGrupo))
        definesPresentationContext = true
        mostrarRutaBaseDeDatos()
        cargarInfoCoreData()
    }

    // Reutiliza el contenedor creado por Xcode.
    func conexion() -> NSManagedObjectContext {
        (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }

    func mostrarRutaBaseDeDatos() {
        let ruta = conexion().persistentStoreCoordinator?.persistentStores.first?.url?.path ?? "sin ruta"
        print("Base de datos SQLite en: \(ruta)")
    }

    func cargarInfoCoreData() {
        let request: NSFetchRequest<Contacto> = Contacto.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "nombre", ascending: true)]
        do {
            contactos = buscador.searchBar.text?.isEmpty == false ? buscarContactos(texto: buscador.searchBar.text ?? "") : try conexion().fetch(request)
            TablaContacto.reloadData()
        } catch { mostrarError(error) }
    }

    @IBAction func agregarContacto(_ sender: UIBarButtonItem) {
        formulario(contacto: nil)
    }

    // Una alerta permite registrar o editar los tres campos.
    func formulario(contacto: Contacto?) {
        let alerta = UIAlertController(title: contacto == nil ? "Agregar Contacto" : "Editar Contacto", message: "Nombre, teléfono y dirección", preferredStyle: .alert)
        alerta.addTextField { $0.placeholder = "Nombre"; $0.text = contacto?.nombre }
        alerta.addTextField { $0.placeholder = "Telefono"; $0.text = contacto?.telefono; $0.keyboardType = .phonePad }
        alerta.addTextField { $0.placeholder = "Direccion"; $0.text = contacto?.direccion }
        alerta.addAction(UIAlertAction(title: "Cancelar", style: .cancel))
        alerta.addAction(UIAlertAction(title: "Guardar", style: .default) { [weak self] _ in
            guard let self else { return }
            let nombre = alerta.textFields?[0].text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
            guard !nombre.isEmpty else {
                self.mostrarMensaje("Escribe el nombre del contacto.")
                return
            }
            let contexto = self.conexion()
            let entidad = contacto ?? Contacto(context: contexto)
            entidad.nombre = nombre
            entidad.telefono = alerta.textFields?[1].text ?? ""
            entidad.direccion = alerta.textFields?[2].text ?? ""
            do {
                try contexto.save()
                self.cargarInfoCoreData()
            } catch {
                contexto.rollback()
                self.mostrarError(error)
            }
        })
        // También permite eliminar sin hacer el gesto de deslizar.
        if let contacto {
            alerta.addAction(UIAlertAction(title: "Eliminar contacto", style: .destructive) { [weak self] _ in
                guard let self, let fila = self.contactos.firstIndex(of: contacto) else { return }
                self.eliminarContacto(at: IndexPath(row: fila, section: 0))
            })
        }
        present(alerta, animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { contactos.count }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let contacto = contactos[indexPath.row]
        celda.textLabel?.text = contacto.nombre
        celda.detailTextLabel?.text = "\(contacto.telefono ?? "") | \(contacto.direccion ?? "")"
        if let grupo = contacto.grupo?.nombre {
            celda.detailTextLabel?.text?.append(" | Grupo: \(grupo)")
        }
        celda.detailTextLabel?.numberOfLines = 2
        return celda
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        formulario(contacto: contactos[indexPath.row])
    }

    // Guarda el borrado antes de actualizar la tabla.
    @discardableResult
    func eliminarContacto(at indexPath: IndexPath) -> Bool {
        guard contactos.indices.contains(indexPath.row) else { return false }
        let contexto = conexion()
        contexto.delete(contactos[indexPath.row])
        do {
            try contexto.save()
            contactos.remove(at: indexPath.row)
            TablaContacto.deleteRows(at: [indexPath], with: .automatic)
            return true
        } catch {
            contexto.rollback()
            mostrarError(error)
            return false
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete { eliminarContacto(at: indexPath) }
    }
    // Muestra la acción de borrado al deslizar de derecha a izquierda.
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let eliminar = UIContextualAction(style: .destructive, title: "Eliminar") { [weak self] _, _, completar in
            guard let self, self.contactos.indices.contains(indexPath.row) else {
                completar(false)
                return
            }
            completar(self.eliminarContacto(at: indexPath))
        }
        let acciones = UISwipeActionsConfiguration(actions: [eliminar])
        acciones.performsFirstActionWithFullSwipe = false
        return acciones
    }

    func mostrarError(_ error: Error) {
        print("Error Core Data: \(error)")
        mostrarMensaje(error.localizedDescription)
    }
    func mostrarMensaje(_ mensaje: String) {
        let alerta = UIAlertController(title: "Contactos", message: mensaje, preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "Aceptar", style: .default))
        present(alerta, animated: true)
    }
}

import UIKit

class DetalleCulturaViewController: UIViewController {
    var cultura: Cultura?

    @IBOutlet private weak var fotoCultura: UIImageView!
    @IBOutlet private weak var nombreCultura: UILabel!
    @IBOutlet private weak var regionCultura: UILabel!
    @IBOutlet private weak var descripcionCultura: UILabel!
    @IBOutlet private weak var creditoImagen: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let cultura = cultura else { return }

        title = cultura.nombre
        nombreCultura.text = cultura.nombre
        regionCultura.text = "Región: \(cultura.region)"
        descripcionCultura.text = cultura.descripcion
        fotoCultura.image = cultura.imagen
        fotoCultura.accessibilityLabel = "Imagen representativa de la cultura \(cultura.nombre)"
        fotoCultura.isAccessibilityElement = true
        nombreCultura.accessibilityTraits = .header

    }
}

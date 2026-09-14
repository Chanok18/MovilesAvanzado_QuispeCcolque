import Foundation
//ACTIVIDAD2:HERENCIA-CLIENTES BANCARIOS

class Cliente {
    let codigo: String
    let direccion: String
    let fechaDeRegistro: String
    let numeroCuenta: String
    let montoMinimoApertura: Double
    init(codigo: String, direccion: String, fechaDeRegistro: String, numeroCuenta: String, montoMinimoApertura: Double) {
        self.codigo = codigo
        self.direccion = direccion
        self.fechaDeRegistro = fechaDeRegistro
        self.numeroCuenta = numeroCuenta
        self.montoMinimoApertura = montoMinimoApertura
    }

    // metodo base, las subclases lo sobreescriben para agregar sus propios datos
    func mostrarDatos() {
        print("Código: \(codigo)")
        print("Dirección: \(direccion)")
        print("Fecha de registro: \(fechaDeRegistro)")
        print("N° Cuenta: \(numeroCuenta)")
        print("Monto mínimo de apertura: S/ \(String(format: "%.2f", montoMinimoApertura))")
    }
}
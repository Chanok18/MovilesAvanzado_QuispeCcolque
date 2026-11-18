//
//  Producto.swift
//  Compras
//

import Foundation
import SwiftData

@Model
final class Producto {
    var nombre: String
    var categoria: String
    var stock: Int
    var costoPromedio: Double

    // Un producto aparece en muchas compras. .deny: no se borra si tiene compras.
    @Relationship(deleteRule: .deny, inverse: \Compra.producto)
    var compras: [Compra] = []

    init(nombre: String, categoria: String, stock: Int, costoPromedio: Double) {
        self.nombre = nombre
        self.categoria = categoria
        self.stock = stock
        self.costoPromedio = costoPromedio
    }

    /// Valor del inventario = stock x costo promedio (calculado, no se guarda)
    var valorInventario: Double { Double(stock) * costoPromedio }

    /// Stock bajo (5 o menos): se avisa en el Resumen del supervisor
    var tieneStockBajo: Bool { ReglasCompra.esStockBajo(stock) }
}

// MARK: - Categorias

extension Producto {
    /// Categorias predefinidas para elegir al crear o editar un producto
    static let categorias = ["Cómputo", "Accesorios", "Electrónica", "Oficina",
                             "Limpieza", "Abarrotes", "Bebidas", "Ferretería", "Otros"]

    /// Icono para cada categoria (los chips del filtro y el formulario)
    static func icono(categoria: String) -> String {
        switch categoria {
        case "Cómputo": return "desktopcomputer"
        case "Accesorios": return "computermouse"
        case "Electrónica": return "bolt"
        case "Oficina": return "paperclip"
        case "Limpieza": return "sparkles"
        case "Abarrotes": return "basket"
        case "Bebidas": return "cup.and.saucer"
        case "Ferretería": return "wrench.and.screwdriver"
        default: return "tag"
        }
    }
}

//
//  Estilo.swift
//  Compras
//
//  Estilo premium: fondo plateado y degradado dorado.
//

import SwiftUI
import UIKit

extension Color {
    /// Crea un color que cambia entre modo claro y oscuro
    static func dinamico(claro: UIColor, oscuro: UIColor) -> Color {
        Color(uiColor: UIColor { $0.userInterfaceStyle == .dark ? oscuro : claro })
    }

    static let plataClaro = dinamico(claro: UIColor(red: 0.965, green: 0.968, blue: 0.975, alpha: 1),
                                     oscuro: UIColor(red: 0.16, green: 0.165, blue: 0.18, alpha: 1))
    static let plataMedio = dinamico(claro: UIColor(red: 0.875, green: 0.885, blue: 0.905, alpha: 1),
                                     oscuro: UIColor(red: 0.09, green: 0.095, blue: 0.105, alpha: 1))
    static let oroOscuro = Color(red: 0.62, green: 0.44, blue: 0.10)
}

extension ShapeStyle where Self == LinearGradient {
    /// Degradado plateado para el fondo de las pantallas
    static var plateado: LinearGradient {
        LinearGradient(colors: [.plataClaro, .plataMedio], startPoint: .top, endPoint: .bottom)
    }

    /// Degradado dorado para logos, banners y botones
    static var dorado: LinearGradient {
        LinearGradient(colors: [Color.accentColor, .oroOscuro],
                       startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

extension View {
    /// Fondo plateado para listas, formularios y scrolls
    func fondoPlateado() -> some View {
        self
            .scrollContentBackground(.hidden)
            .background(LinearGradient.plateado.ignoresSafeArea())
    }
}

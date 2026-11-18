//
//  LoginView.swift
//  Compras
//
//  B1 · Inicio de sesion
//

import SwiftUI
import SwiftData

struct LoginView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(Sesion.self) private var sesion

    @State private var usuario = ""
    @State private var clave = ""
    @State private var mensajeError: String?
    @State private var mostrarRegistro = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    // ① Logo y nombre
                    VStack(spacing: 10) {
                        Image(systemName: "shippingbox.and.arrow.backward.fill")
                            .font(.system(size: 52, weight: .semibold))
                            .foregroundStyle(.white)
                            .frame(width: 110, height: 110)
                            .background(
                                LinearGradient.dorado,
                                in: RoundedRectangle(cornerRadius: 30, style: .continuous)
                            )
                            .shadow(color: Color.accentColor.opacity(0.45), radius: 18, y: 10)
                        Text("Compras")
                            .font(.system(size: 38, weight: .heavy, design: .rounded))
                        Text("Distribuidora · Proveedores y costos")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.top, 48)

                    VStack(spacing: 14) {
                        // ② Usuario
                        TextField("Usuario", text: $usuario)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
                            .textContentType(.username)
                            .campoLogin(icono: "person")

                        // ③ Clave oculta
                        // Empieza oculta; el ojo la muestra (CampoClave)
                        CampoClave(titulo: "Clave", texto: $clave)
                            .textContentType(.password)
                            .campoLogin(icono: "lock")

                        // ④ Mensaje de error generico
                        if let mensajeError {
                            Label(mensajeError, systemImage: "exclamationmark.triangle.fill")
                                .font(.footnote)
                                .foregroundStyle(.red)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .padding(18)
                    .background(Color(.systemBackground), in: RoundedRectangle(cornerRadius: 22, style: .continuous))
                    .shadow(color: .black.opacity(0.08), radius: 16, y: 6)

                    // ⑤ Ingresar
                    Button {
                        ingresar()
                    } label: {
                        Label("Ingresar", systemImage: "arrow.right.circle.fill")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                    }
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .shadow(color: Color.accentColor.opacity(0.35), radius: 10, y: 5)
                    .disabled(usuario.isEmpty || clave.isEmpty)

                    // ⑥ Ir a Crear cuenta
                    Button("¿No tienes cuenta? Crear cuenta") {
                        mostrarRegistro = true
                    }
                    .font(.callout)
                }
                .padding(24)
            }
            .background(
                LinearGradient.plateado
                    .ignoresSafeArea()
            )
            .navigationDestination(isPresented: $mostrarRegistro) {
                RegistroView()
            }
        }
    }

    private func ingresar() {
        do {
            let encontrado = try ServicioAuth.login(usuario: usuario, clave: clave, en: modelContext)
            mensajeError = nil
            clave = ""
            sesion.iniciar(encontrado)
        } catch {
            // Siempre el mismo mensaje: no se dice si fallo el usuario o la clave
            mensajeError = ErrorAuth.credencialesIncorrectas.errorDescription
        }
    }
}

/// Estilo comun para los campos del login y registro
struct CampoLogin: ViewModifier {
    let icono: String

    func body(content: Content) -> some View {
        HStack(spacing: 10) {
            Image(systemName: icono)
                .foregroundStyle(Color.accentColor)
                .frame(width: 22)
            content
        }
        .padding(14)
        .background(Color(.secondarySystemBackground), in: RoundedRectangle(cornerRadius: 14, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .stroke(Color.accentColor.opacity(0.15), lineWidth: 1)
        )
    }
}

extension View {
    func campoLogin(icono: String) -> some View {
        modifier(CampoLogin(icono: icono))
    }
}

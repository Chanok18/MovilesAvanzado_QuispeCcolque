//
//  ProveedorFormView.swift
//  Compras
//
//  Crear o editar un proveedor (solo supervisor).
//

import SwiftUI
import SwiftData

struct ProveedorFormView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    let proveedor: Proveedor?

    @State private var nombre: String
    @State private var ruc: String

    init(proveedor: Proveedor?) {
        self.proveedor = proveedor
        _nombre = State(initialValue: proveedor?.nombre ?? "")
        _ruc = State(initialValue: proveedor?.ruc ?? "")
    }

    /// RUC peruano: 11 digitos y empieza con 10 o 20 (regla en ReglasCompra)
    private var rucValido: Bool { ReglasCompra.rucValido(ruc) }

    /// RUC repetido: otro proveedor ya lo tiene (#Predicate, sin contar al que se edita)
    private var rucRepetido: Bool {
        let buscado = ruc
        let descriptor = FetchDescriptor<Proveedor>(predicate: #Predicate { $0.ruc == buscado })
        let encontrados = (try? modelContext.fetch(descriptor)) ?? []
        return encontrados.contains { $0.persistentModelID != proveedor?.persistentModelID }
    }

    private var esValido: Bool {
        !nombre.trimmingCharacters(in: .whitespaces).isEmpty && rucValido && !rucRepetido
    }

    // MARK: - Solo para el diseno (no cambian la logica)

    private var esRucOk: Bool { rucValido && !rucRepetido }

    private var tipoContribuyente: String {
        ruc.hasPrefix("20") ? "Empresa" : "Persona natural"
    }

    /// Iniciales de la razon social para la vista previa
    private var inicialesProveedor: String {
        let palabras = nombre.split(separator: " ").prefix(2)
        let iniciales = palabras.compactMap(\.first).map { String($0).uppercased() }.joined()
        return iniciales.isEmpty ? "?" : iniciales
    }

    var body: some View {
        NavigationStack {
            Form {
                // Cabecera con vista previa del proveedor
                Section {
                    VStack(spacing: 10) {
                        Text(inicialesProveedor)
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .foregroundStyle(.white)
                            .frame(width: 76, height: 76)
                            .background(LinearGradient.dorado, in: RoundedRectangle(cornerRadius: 22, style: .continuous))
                            .shadow(color: Color.accentColor.opacity(0.4), radius: 12, y: 6)
                        Text(nombre.trimmingCharacters(in: .whitespaces).isEmpty ? "Nuevo proveedor" : nombre)
                            .font(.system(.title3, design: .rounded).weight(.bold))
                            .lineLimit(1)
                        if rucValido {
                            Label(tipoContribuyente, systemImage: ruc.hasPrefix("20") ? "building.2.fill" : "person.fill")
                                .font(.caption.weight(.semibold))
                                .foregroundStyle(Color.accentColor)
                        } else {
                            Text("Completa los datos del proveedor")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                    .animation(.snappy, value: rucValido)
                }
                .listRowBackground(Color.clear)

                Section {
                    HStack(spacing: 12) {
                        IconoCampo(nombre: "building.2")
                        TextField("Razón social", text: $nombre)
                            .textInputAutocapitalization(.words)
                    }
                    HStack(spacing: 12) {
                        IconoCampo(nombre: "number")
                        TextField("RUC (11 dígitos)", text: $ruc)
                            .keyboardType(.numberPad)
                            .monospacedDigit()
                        Text("\(ruc.count)/11")
                            .font(.caption.monospacedDigit())
                            .foregroundStyle(.secondary)
                        if !ruc.isEmpty {
                            Image(systemName: esRucOk ? "checkmark.circle.fill" : "xmark.circle.fill")
                                .foregroundStyle(esRucOk ? .green : .red)
                                .transition(.scale.combined(with: .opacity))
                        }
                    }
                    .animation(.snappy, value: esRucOk)
                } header: {
                    Text("Datos del proveedor")
                } footer: {
                    if !ruc.isEmpty && !rucValido {
                        Label("El RUC debe tener 11 dígitos y empezar con 10 o 20", systemImage: "exclamationmark.triangle.fill")
                            .foregroundStyle(.red)
                    } else if rucRepetido {
                        Label("Ese RUC ya está registrado", systemImage: "exclamationmark.triangle.fill")
                            .foregroundStyle(.red)
                    } else {
                        Text("10 = persona natural · 20 = empresa")
                    }
                }

                // Boton grande para guardar
                Section {
                    Button {
                        guardar()
                    } label: {
                        Label(proveedor == nil ? "Registrar proveedor" : "Guardar cambios",
                              systemImage: "checkmark.circle.fill")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 6)
                    }
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .disabled(!esValido)
                }
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle(proveedor == nil ? "Nuevo proveedor" : "Editar proveedor")
            .fondoPlateado()
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Guardar") { guardar() }
                        .disabled(!esValido)
                }
            }
        }
    }

    private func guardar() {
        let nombreLimpio = nombre.trimmingCharacters(in: .whitespaces)
        if let proveedor {
            proveedor.nombre = nombreLimpio
            proveedor.ruc = ruc
        } else {
            modelContext.insert(Proveedor(nombre: nombreLimpio, ruc: ruc))
        }
        try? modelContext.save()
        dismiss()
    }
}

/// Icono dorado al lado de cada campo del formulario
struct IconoCampo: View {
    let nombre: String

    var body: some View {
        Image(systemName: nombre)
            .font(.subheadline.weight(.semibold))
            .foregroundStyle(Color.accentColor)
            .frame(width: 30, height: 30)
            .background(Color.accentColor.opacity(0.14), in: RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}

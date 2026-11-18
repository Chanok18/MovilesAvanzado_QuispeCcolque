//
//  NuevaCompraView.swift
//  Compras
//
//  B5 · Nueva compra (Comprador).
//  Total menor a S/ 5,000: queda Aprobada al instante.
//  Desde S/ 5,000: se envia a aprobacion del supervisor.
//

import SwiftUI
import SwiftData

struct NuevaCompraView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(Sesion.self) private var sesion

    @Query(sort: \Proveedor.nombre) private var proveedores: [Proveedor]
    @Query(sort: \Producto.nombre) private var productos: [Producto]

    @State private var proveedor: Proveedor?
    @State private var producto: Producto?
    @State private var cantidad = 1
    @State private var costoUnitario = 0.0
    @State private var alCredito = false
    @State private var resultado: String?
    @State private var mensajeError: String?

    private var calculo: CalculoCompra {
        CalculoCompra(cantidad: cantidad, costoUnitario: costoUnitario)
    }

    private var puedeRegistrar: Bool {
        proveedor != nil && producto != nil && cantidad > 0 && costoUnitario > 0
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 22) {
                    // ① Comprador de la sesion (automatico)
                    if let usuario = sesion.usuario {
                        HStack(spacing: 12) {
                            AvatarCirculo(iniciales: usuario.iniciales, tamano: 44)
                                .overlay(Circle().stroke(.white.opacity(0.8), lineWidth: 2))
                            VStack(alignment: .leading, spacing: 2) {
                                Text(usuario.nombre)
                                    .font(.system(.headline, design: .rounded))
                                    .foregroundStyle(.white)
                                Text("Comprador de la sesión")
                                    .font(.caption)
                                    .foregroundStyle(.white.opacity(0.85))
                            }
                            Spacer()
                            Image(systemName: "cart.badge.plus")
                                .font(.title2)
                                .foregroundStyle(.white.opacity(0.9))
                        }
                        .padding()
                        .background(LinearGradient.dorado, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .shadow(color: Color.accentColor.opacity(0.3), radius: 10, y: 5)
                    }

                    // ② Proveedor
                    PasoCompra(numero: 1, titulo: "Proveedor", icono: "building.2.fill") {
                        if proveedores.isEmpty {
                            AvisoVacio(texto: "Aún no hay proveedores registrados.")
                        } else {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 10) {
                                    ForEach(proveedores) { item in
                                        TarjetaOpcion(titulo: item.nombre,
                                                      detalle: "RUC \(item.ruc)",
                                                      icono: "building.2",
                                                      seleccionado: proveedor == item) {
                                            proveedor = item
                                        }
                                        .frame(width: 170)
                                    }
                                }
                                .padding(.vertical, 4)
                            }
                        }
                    }

                    // ③ Producto
                    PasoCompra(numero: 2, titulo: "Producto", icono: "shippingbox.fill") {
                        if productos.isEmpty {
                            AvisoVacio(texto: "Aún no hay productos registrados.")
                        } else {
                            LazyVGrid(columns: [GridItem(.flexible(), spacing: 10),
                                                GridItem(.flexible(), spacing: 10)], spacing: 10) {
                                ForEach(productos) { item in
                                    TarjetaOpcion(titulo: item.nombre,
                                                  detalle: "Stock \(item.stock) · \(item.costoPromedio.soles)",
                                                  icono: Producto.icono(categoria: item.categoria),
                                                  seleccionado: producto == item) {
                                        producto = item
                                    }
                                }
                            }
                        }
                    }

                    // ④ Cantidad y costo
                    PasoCompra(numero: 3, titulo: "Cantidad y costo", icono: "number") {
                        VStack(spacing: 14) {
                            HStack {
                                BotonCantidad(icono: "minus") { if cantidad > 1 { cantidad -= 1 } }
                                Spacer()
                                VStack(spacing: 0) {
                                    Text("\(cantidad)")
                                        .font(.system(size: 34, weight: .bold, design: .rounded))
                                        .monospacedDigit()
                                        .contentTransition(.numericText())
                                    Text("unidades")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                                Spacer()
                                BotonCantidad(icono: "plus") { if cantidad < 10_000 { cantidad += 1 } }
                            }
                            .animation(.snappy, value: cantidad)

                            // Atajos de cantidad
                            HStack(spacing: 8) {
                                ForEach([5, 10, 50, 100], id: \.self) { valor in
                                    Button("+\(valor)") { cantidad = min(cantidad + valor, 10_000) }
                                        .font(.subheadline.weight(.semibold))
                                        .frame(maxWidth: .infinity)
                                        .padding(.vertical, 8)
                                        .foregroundStyle(Color.accentColor)
                                        .background(Color.accentColor.opacity(0.12), in: Capsule())
                                        .buttonStyle(.plain)
                                }
                            }

                            Divider()

                            HStack {
                                Label("Costo unitario", systemImage: "tag.fill")
                                    .foregroundStyle(.secondary)
                                Spacer()
                                Text("S/")
                                    .foregroundStyle(.secondary)
                                TextField("0.00", value: $costoUnitario, format: .number.precision(.fractionLength(2)))
                                    .keyboardType(.decimalPad)
                                    .multilineTextAlignment(.trailing)
                                    .font(.system(.title3, design: .rounded).weight(.semibold))
                                    .frame(maxWidth: 130)
                            }
                        }
                    }

                    // ⑤ Contado o Credito 30 dias
                    PasoCompra(numero: 4, titulo: "Forma de pago", icono: "creditcard.fill") {
                        HStack(spacing: 10) {
                            TarjetaOpcion(titulo: "Contado", detalle: "Se paga hoy",
                                          icono: "banknote.fill", seleccionado: !alCredito) {
                                alCredito = false
                            }
                            TarjetaOpcion(titulo: "Crédito 30 días",
                                          detalle: "Vence \(ReglasCompra.fechaVencimiento(desde: .now, alCredito: true).corta)",
                                          icono: "calendar.badge.clock", seleccionado: alCredito) {
                                alCredito = true
                            }
                        }
                    }

                    // Resumen
                    VStack(alignment: .leading, spacing: 10) {
                        Label("Resumen", systemImage: "doc.text.fill")
                            .font(.headline)
                        FilaMonto(titulo: "Subtotal", monto: calculo.subtotal)
                        FilaMonto(titulo: "IGV 18 % (crédito fiscal)", monto: calculo.igv)
                        Divider()
                        FilaMonto(titulo: "Total", monto: calculo.total, destacado: true)

                        // ⑥ Aviso cuando el total llega a S/ 5,000
                        if calculo.requiereAprobacion {
                            Label("Desde \(ReglasCompra.limiteAprobacion.soles) la compra necesita aprobación del supervisor.",
                                  systemImage: "exclamationmark.shield.fill")
                                .font(.footnote)
                                .foregroundStyle(.orange)
                                .padding(10)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(.orange.opacity(0.12), in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                        }
                    }
                    .padding()
                    .background(Color(.secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(Color.accentColor.opacity(0.35), lineWidth: 1))
                    .shadow(color: .black.opacity(0.05), radius: 8, y: 4)

                    if let mensajeError {
                        Label(mensajeError, systemImage: "exclamationmark.triangle.fill")
                            .font(.footnote)
                            .foregroundStyle(.red)
                    }

                    // ⑦ Enviar a aprobacion o Registrar compra
                    Button {
                        registrar()
                    } label: {
                        Label(calculo.requiereAprobacion ? "Enviar a aprobación" : "Registrar compra",
                              systemImage: calculo.requiereAprobacion ? "paperplane.fill" : "checkmark.circle.fill")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                    }
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .shadow(color: Color.accentColor.opacity(0.35), radius: 10, y: 5)
                    .disabled(!puedeRegistrar)
                }
                .padding()
                .animation(.snappy, value: proveedor)
                .animation(.snappy, value: producto)
                .animation(.snappy, value: alCredito)
            }
            .scrollDismissesKeyboard(.interactively)
            .navigationTitle("Nueva compra")
            .fondoPlateado()
            .conAvatar()
            .onChange(of: producto) { _, nuevo in
                // Sugerimos el costo promedio actual como costo unitario
                if let nuevo { costoUnitario = nuevo.costoPromedio }
            }
            .alert("Compra registrada",
                   isPresented: Binding(get: { resultado != nil },
                                        set: { if !$0 { resultado = nil } })) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(resultado ?? "")
            }
        }
    }

    private func registrar() {
        guard let usuario = sesion.usuario else { return }
        do {
            let compra = try ServicioCompras.registrar(cantidad: cantidad,
                                                       costoUnitario: costoUnitario,
                                                       alCredito: alCredito,
                                                       comprador: usuario,
                                                       proveedor: proveedor,
                                                       producto: producto,
                                                       en: modelContext)
            mensajeError = nil
            if compra.estaPendiente {
                resultado = "Total \(compra.total.soles). Quedó Pendiente de aprobación del supervisor."
            } else {
                let pago = compra.alCredito ? "Por pagar, vence el \(compra.vence.corta)." : "Pagada al contado."
                resultado = "Total \(compra.total.soles). Quedó Aprobada. \(pago)"
            }
            // Limpiar el formulario
            cantidad = 1
            producto = nil
            costoUnitario = 0
            alCredito = false
        } catch {
            mensajeError = error.localizedDescription
        }
    }
}

/// Fila de resumen: titulo a la izquierda y monto a la derecha
struct FilaMonto: View {
    let titulo: String
    let monto: Double
    var destacado = false

    var body: some View {
        HStack {
            Text(titulo)
                .foregroundStyle(destacado ? .primary : .secondary)
            Spacer()
            Text(monto.soles)
                .monospacedDigit()
                .fontWeight(destacado ? .bold : .regular)
                .foregroundStyle(destacado ? Color.accentColor : .primary)
        }
        .font(destacado ? .system(.title3, design: .rounded) : .body)
    }
}

// MARK: - Componentes de diseno de la compra

/// Bloque numerado de cada paso de la compra
struct PasoCompra<Contenido: View>: View {
    let numero: Int
    let titulo: String
    let icono: String
    @ViewBuilder let contenido: Contenido

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 8) {
                Text("\(numero)")
                    .font(.caption.bold())
                    .foregroundStyle(.white)
                    .frame(width: 22, height: 22)
                    .background(LinearGradient.dorado, in: Circle())
                Label(titulo, systemImage: icono)
                    .font(.headline)
            }
            contenido
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(.secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
        }
    }
}

/// Tarjeta seleccionable (proveedor, producto, forma de pago)
struct TarjetaOpcion: View {
    let titulo: String
    let detalle: String
    let icono: String
    let seleccionado: Bool
    let accion: () -> Void

    var body: some View {
        Button(action: accion) {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image(systemName: icono)
                        .font(.headline)
                        .foregroundStyle(seleccionado ? .white : Color.accentColor)
                        .frame(width: 34, height: 34)
                        .background(seleccionado ? AnyShapeStyle(LinearGradient.dorado)
                                                 : AnyShapeStyle(Color.accentColor.opacity(0.14)),
                                    in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                    Spacer()
                    Image(systemName: seleccionado ? "checkmark.circle.fill" : "circle")
                        .foregroundStyle(seleccionado ? Color.accentColor : Color.secondary.opacity(0.5))
                }
                Text(titulo)
                    .font(.subheadline.weight(.semibold))
                    .lineLimit(1)
                Text(detalle)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
            }
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(seleccionado ? Color.accentColor.opacity(0.10) : Color(.tertiarySystemGroupedBackground),
                        in: RoundedRectangle(cornerRadius: 14, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 14, style: .continuous)
                .stroke(seleccionado ? Color.accentColor : .clear, lineWidth: 1.5))
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}

/// Boton redondo dorado para sumar o restar la cantidad
struct BotonCantidad: View {
    let icono: String
    let accion: () -> Void

    var body: some View {
        Button(action: accion) {
            Image(systemName: icono)
                .font(.title3.bold())
                .foregroundStyle(.white)
                .frame(width: 48, height: 48)
                .background(LinearGradient.dorado, in: Circle())
                .shadow(color: Color.accentColor.opacity(0.35), radius: 6, y: 3)
        }
        .buttonStyle(.plain)
    }
}

/// Mensaje cuando no hay opciones para elegir
struct AvisoVacio: View {
    let texto: String

    var body: some View {
        Label(texto, systemImage: "info.circle")
            .font(.footnote)
            .foregroundStyle(.secondary)
    }
}

# Semana 14 – Trabajo de la semana

## Grupo B: Aplicación de Compras

## 1. Descripción del proyecto

El proyecto consiste en desarrollar una aplicación móvil llamada **Compras**, utilizando **SwiftUI** y **SwiftData**. Está dirigida a una distribuidora y permitirá gestionar proveedores, productos y compras al contado o al crédito.

La aplicación contará con dos tipos de usuarios:

- **Comprador:** podrá registrar compras y consultar sus operaciones.
- **Supervisor:** podrá administrar productos y proveedores, además de aprobar, rechazar y registrar pagos de compras.

## 2. Requisitos para ejecutar el proyecto

- Tener instalado **Xcode 16** o una versión posterior.
- Utilizar un simulador con **iOS 17** o superior.
- No es necesario instalar paquetes externos.
- Ubicación del proyecto: `Semana12/Compras/Compras.xcodeproj`

## 3. Estructura del proyecto

El código está organizado en las siguientes carpetas:

| Carpeta | Descripción |
|---|---|
| `Modelos/` | Contiene los modelos de usuarios, proveedores, productos y compras. |
| `Sesion/` | Maneja el inicio de sesión, registro y usuario conectado. |
| `Reglas/` | Contiene los cálculos y las reglas para procesar las compras. |
| `Vistas/` | Incluye las pantallas y los formularios de la aplicación. |
| `ComprasTests/` | Contiene las pruebas automáticas del proyecto. |

## 4. Pantallas principales

La aplicación tendrá las siguientes pantallas:

- **Login:** permite ingresar a la aplicación.
- **Crear cuenta:** permite registrar nuevos usuarios.
- **Productos:** permite visualizar y administrar productos.
- **Proveedores:** permite consultar y administrar proveedores.
- **Nueva compra:** permite al comprador registrar una compra.
- **Mis compras:** muestra las compras realizadas por el usuario.
- **Aprobar compras:** permite al supervisor aprobar o rechazar solicitudes.
- **Por pagar:** muestra las compras que todavía deben pagarse.
- **Resumen:** presenta información general de las operaciones.

También contará con un menú de usuario para cerrar sesión.

## 5. Funciones según el tipo de usuario

**Comprador:**

- Consultar productos y proveedores.
- Registrar nuevas compras.
- Revisar el historial de sus compras.
- Consultar el estado de sus operaciones.

**Supervisor:**

- Crear, editar y eliminar productos.
- Administrar proveedores.
- Aprobar o rechazar compras.
- Registrar pagos.
- Consultar el resumen de las operaciones.

## 6. Casos de prueba

Se deben comprobar los siguientes escenarios:

| N.º | Prueba | Resultado esperado |
|---|---|---|
| 1 | Registrar un usuario repetido. | El sistema no permite duplicar usuarios. |
| 2 | Iniciar sesión con una clave incorrecta. | Muestra un mensaje de error. |
| 3 | Registrar una compra al crédito. | Calcula los importes, actualiza el stock y el costo promedio. |
| 4 | Registrar una compra al contado. | La compra queda pagada. |
| 5 | Registrar una compra de importe elevado. | Queda pendiente de aprobación. |
| 6 | Aprobar una compra pendiente. | Actualiza el stock y el costo promedio. |
| 7 | Rechazar una compra. | Solicita un motivo para realizar el rechazo. |
| 8 | Pagar una compra vencida. | Cambia su estado a pagada. |
| 9 | Intentar pagar como comprador. | No permite realizar pagos. |

## 7. Reglas importantes del sistema

- Cada usuario debe tener un nombre de usuario único.
- Las compras deben calcular correctamente el IGV.
- El costo promedio se actualiza cuando corresponde.
- Las compras menores a S/ 5,000 se aprueban automáticamente.
- Las compras de S/ 5,000 o más necesitan aprobación del supervisor.
- El comprador solo puede consultar sus propias compras.
- Los pagos y las aprobaciones son funciones exclusivas del supervisor.

## 8. Pruebas y ejecución

Para ejecutar el proyecto:

1. Abrir el repositorio en la Mac.
2. Cambiar a la rama principal y actualizar los archivos.
3. Abrir el proyecto `Compras.xcodeproj` en Xcode.
4. Seleccionar el esquema **Compras**.
5. Elegir un simulador de iPhone.
6. Presionar **Run (⌘R)** para iniciar la aplicación.
7. Presionar **⌘U** para ejecutar las pruebas automáticas.

También se pueden ejecutar las pruebas mediante GitHub Actions.

## 9. Aspectos importantes para la exposición

- **SwiftData:** se utiliza para guardar y administrar la información de la aplicación.
- **Modelos:** se utilizan las clases `Usuario`, `Proveedor`, `Producto` y `Compra`.
- **Sesión:** permite mantener el usuario conectado y controlar el acceso.
- **Costo promedio:** se calcula considerando el stock y el costo anterior del producto.
- **Aprobaciones:** las compras de mayor importe necesitan autorización del supervisor.
- **Filtros:** permiten organizar las compras según su estado y los productos según su categoría.
- **Categorías:** al crear o editar un producto se elige su categoría de una lista.
- **IGV:** se muestra el crédito fiscal acumulado y el correspondiente al mes en el resumen.
- **Diseño:** estilo premium con color principal dorado y fondo plateado, compatible con modo oscuro.

## 10. Conclusión

El proyecto busca facilitar el control de compras de una distribuidora mediante una aplicación móvil. Se utilizan SwiftUI y SwiftData para desarrollar las pantallas y guardar la información, aplicando reglas de negocio claras para el registro, la aprobación y el pago de las compras.

# Resumen del esquema

## Fuente revisada

- Fuente de verdad técnica revisada: [database/01_Crear_Base_Datos.sql](../database/01_Crear_Base_Datos.sql).
- El script de datos revisado es [database/02_Datos_Prueba.sql](../database/02_Datos_Prueba.sql); contiene sentencias `INSERT`, `SELECT`, `USE`, `SET IDENTITY_INSERT` y control con `SET NOEXEC`.
- No se ejecutó ningún script.
- No se encontró `docs/prototipos/0. Diseño Oficial.png`; por tanto, el diseño visual no pudo validarse.

## Base de datos

- Nombre: `db_Supermercados`.
- El script usa `CREATE DATABASE db_Supermercados`, seguido de `USE db_Supermercados`.
- No hay guardas para evitar error si la base ya existe.

## Tablas, columnas y claves

Todas las columnas `IDENTITY(1,1)` indicadas son también la PK de su tabla. Las columnas sin `NOT NULL` son nullable.

### `Tbl_Sucursales`

- PK: `CodigoSucursal INT IDENTITY(1,1)`.
- Columnas: `Nombre VARCHAR(60) NOT NULL`, `Direccion VARCHAR(150) NOT NULL`, `Departamento VARCHAR(80) NOT NULL`, `Municipio VARCHAR(80) NOT NULL`, `Telefono VARCHAR(15) NOT NULL`, `FechaApertura DATE NOT NULL`, `Estado BIT NOT NULL`.

### `Tbl_Areas`

- PK: `CodigoArea INT IDENTITY(1,1)`.
- FK: `CodigoSucursal INT NOT NULL` → `Tbl_Sucursales(CodigoSucursal)`.
- Columnas: `Nombre VARCHAR(60) NOT NULL`, `Descripcion VARCHAR(100)`, `Estado BIT NOT NULL`.

### `Tbl_Empleados`

- PK: `CodigoEmpleado INT IDENTITY(1,1)`.
- FK: `CodigoSucursal INT NOT NULL` → `Tbl_Sucursales(CodigoSucursal)`.
- Columnas: `Nombre VARCHAR(60) NOT NULL`, `Apellido VARCHAR(60) NOT NULL`, `Dpi BIGINT NOT NULL`, `Puesto VARCHAR(50) NOT NULL`, `Salario DECIMAL(10,2) NOT NULL`, `Estado BIT NOT NULL`.
- Restricción: `Dpi` es `UNIQUE`.

### `Tbl_Categorias`

- PK: `CodigoCategoria INT IDENTITY(1,1)`.
- Columnas: `Nombre VARCHAR(50) NOT NULL`, `Descripcion VARCHAR(100)`, `FechaRegistro DATETIME NOT NULL`, `Estado BIT NOT NULL`.

### `Tbl_Productos`

- PK: `CodigoProducto INT IDENTITY(1,1)`.
- FK: `CodigoCategoria INT NOT NULL` → `Tbl_Categorias(CodigoCategoria)`.
- Columnas: `Nombre VARCHAR(80) NOT NULL`, `CodigoBarra VARCHAR(30) NOT NULL`, `Marca VARCHAR(100)`, `Presentacion VARCHAR(50)`, `UnidadMedida VARCHAR(30) NOT NULL`, `PrecioCompra DECIMAL(10,2)`, `PrecioVenta DECIMAL(10,2) NOT NULL`, `FechaRegistro DATE NOT NULL`, `Estado BIT NOT NULL`.
- Restricción: `CodigoBarra` es `UNIQUE`.

### `Tbl_Proveedores`

- PK: `CodigoProveedor INT IDENTITY(1,1)`.
- Columnas: `Nombre VARCHAR(100) NOT NULL`, `Nit VARCHAR(20) NOT NULL`, `Contacto VARCHAR(80) NOT NULL`, `Departamento VARCHAR(80) NOT NULL`, `Municipio VARCHAR(80) NOT NULL`, `Telefono VARCHAR(15) NOT NULL`, `Correo VARCHAR(100)`, `DiasCredito INT NOT NULL`, `FechaRegistro DATE NOT NULL`, `Estado BIT NOT NULL`.
- Restricción: `Nit` es `UNIQUE`.

### `Tbl_ProductosProveedores`

- PK: `CodigoProductoProveedor INT IDENTITY(1,1)`.
- FKs: `CodigoProveedor INT NOT NULL` → `Tbl_Proveedores(CodigoProveedor)`; `CodigoProducto INT NOT NULL` → `Tbl_Productos(CodigoProducto)`.
- Columnas: `CodigoExterno VARCHAR(20) NOT NULL`, `CostoReferencia DECIMAL(10,2) NOT NULL`, `DiasEntrega INT NOT NULL`, `FechaRegistro DATE NOT NULL`, `Estado BIT NOT NULL`.
- Restricción: combinación `(CodigoProveedor, CodigoProducto)` es `UNIQUE`.

### `Tbl_Inventarios`

- PK: `CodigoInventario INT IDENTITY(1,1)`.
- FKs: `CodigoArea INT NOT NULL` → `Tbl_Areas(CodigoArea)`; `CodigoProducto INT NOT NULL` → `Tbl_Productos(CodigoProducto)`.
- Columnas: `ExistenciaActual DECIMAL(10,2) NOT NULL`, `ExistenciaMinima DECIMAL(10,2) NOT NULL`, `ExistenciaMaxima DECIMAL(10,2)`, `CostoPromedio DECIMAL(10,2) NOT NULL`, `FechaUltimoIngreso DATETIME`, `FechaUltimoConteo DATETIME`, `Estado BIT NOT NULL`.
- Restricción: combinación `(CodigoArea, CodigoProducto)` es `UNIQUE`.

### `Tbl_Compras`

- PK: `CodigoCompra INT IDENTITY(1,1)`.
- FKs: `CodigoSucursal INT NOT NULL` → `Tbl_Sucursales(CodigoSucursal)`; `CodigoEmpleado INT NOT NULL` → `Tbl_Empleados(CodigoEmpleado)`; `CodigoProveedor INT NOT NULL` → `Tbl_Proveedores(CodigoProveedor)`.
- Columnas: `NumeroCompra VARCHAR(20) NOT NULL`, `FechaCompra DATE NOT NULL`, `FechaProgramada DATETIME NOT NULL`, `FechaRecepcion DATETIME`, `Observacion VARCHAR(150)`, `Estado VARCHAR(20) NOT NULL`.
- Restricción: `NumeroCompra` es `UNIQUE`; el comentario documenta estados `Borrador`, `Recibida`, `Anulada`, sin `CHECK` que los limite.

### `Tbl_ComprasDetalle`

- PK: `CodigoCompraDetalle INT IDENTITY(1,1)`.
- FKs: `CodigoCompra INT NOT NULL` → `Tbl_Compras(CodigoCompra)`; `CodigoProducto INT NOT NULL` → `Tbl_Productos(CodigoProducto)`.
- Columnas: `CantidadCompra DECIMAL(10,2) NOT NULL`, `CostoUnitario DECIMAL(10,2) NOT NULL`, `Descuento DECIMAL(10,2)`, `Observacion VARCHAR(200)`.
- Restricción: combinación `(CodigoCompra, CodigoProducto)` es `UNIQUE`.

### `Tbl_Clientes`

- PK: `CodigoCliente INT IDENTITY(1,1)`.
- Columnas: `Nombre VARCHAR(80) NOT NULL`, `Apellido VARCHAR(80) NOT NULL`, `Nit VARCHAR(20) NOT NULL`, `Departamento VARCHAR(80) NOT NULL`, `Municipio VARCHAR(80) NOT NULL`, `Telefono VARCHAR(15)`, `Correo VARCHAR(100)`, `FechaRegistro DATETIME NOT NULL`, `Estado BIT NOT NULL`.
- Restricción: `Nit` es `UNIQUE`; el comentario indica `CF` para consumidor final.

### `Tbl_Ventas`

- PK: `CodigoVenta INT IDENTITY(1,1)`.
- FKs: `CodigoCliente INT NOT NULL` → `Tbl_Clientes(CodigoCliente)`; `CodigoSucursal INT NOT NULL` → `Tbl_Sucursales(CodigoSucursal)`; `CodigoEmpleado INT NOT NULL` → `Tbl_Empleados(CodigoEmpleado)`.
- Columnas: `NumeroVenta VARCHAR(20) NOT NULL`, `FechaVenta DATE NOT NULL`, `Observacion VARCHAR(200)`, `Estado VARCHAR(20) NOT NULL`.
- Restricción: `NumeroVenta` es `UNIQUE`; el comentario documenta estados `Borrador`, `Confirmada`, `Anulada`, sin `CHECK` que los limite.

### `Tbl_VentasDetalle`

- PK: `CodigoVentaDetalle INT IDENTITY(1,1)`.
- FKs: `CodigoVenta INT NOT NULL` → `Tbl_Ventas(CodigoVenta)`; `CodigoProducto INT NOT NULL` → `Tbl_Productos(CodigoProducto)`.
- Columnas: `CantidadVenta DECIMAL(10,2) NOT NULL`, `PrecioUnitario DECIMAL(10,2) NOT NULL`, `Descuento DECIMAL(10,2)`, `CostoUnitarioHistorico DECIMAL(10,2) NOT NULL`.
- Restricción: combinación `(CodigoVenta, CodigoProducto)` es `UNIQUE`.

### `Tbl_Pagos`

- PK: `CodigoPago INT IDENTITY(1,1)`.
- FKs nullable: `CodigoVenta INT` → `Tbl_Ventas(CodigoVenta)`; `CodigoCompra INT` → `Tbl_Compras(CodigoCompra)`; `CodigoCliente INT` → `Tbl_Clientes(CodigoCliente)`; `CodigoProveedor INT` → `Tbl_Proveedores(CodigoProveedor)`; `CodigoEmpleado INT` → `Tbl_Empleados(CodigoEmpleado)`.
- Columnas: `TipoPago VARCHAR(15) NOT NULL`, `ComprobantePago VARCHAR(30) NOT NULL`, `FechaPago DATE NOT NULL`, `MetodoPago VARCHAR(25) NOT NULL`, `Monto DECIMAL(10,2) NOT NULL`, `Comision DECIMAL(10,2)`, `Autorizacion VARCHAR(30)`, `Estado VARCHAR(10) NOT NULL`.
- Restricción: `ComprobantePago` es `UNIQUE`; los comentarios documentan tipos y estados, sin `CHECK` ni regla que obligue una combinación válida de FKs.

### `Tbl_MovimientosInventario`

- PK: `CodigoMovimiento INT IDENTITY(1,1)`.
- FKs: `CodigoEmpleado INT NOT NULL` → `Tbl_Empleados(CodigoEmpleado)`; `CodigoInventarioOrigen INT` → `Tbl_Inventarios(CodigoInventario)`; `CodigoInventarioDestino INT` → `Tbl_Inventarios(CodigoInventario)`; `CodigoCompraDetalle INT` → `Tbl_ComprasDetalle(CodigoCompraDetalle)`; `CodigoVentaDetalle INT` → `Tbl_VentasDetalle(CodigoVentaDetalle)`.
- Columnas: `ReferenciaOperacion VARCHAR(30) NOT NULL`, `TipoMovimiento VARCHAR(10) NOT NULL`, `Motivo VARCHAR(20) NOT NULL`, `FechaMovimiento DATETIME NOT NULL`, `Cantidad DECIMAL(10,2) NOT NULL`, `CostoUnitario DECIMAL(10,2) NOT NULL`, `Observacion VARCHAR(200)`, `Estado VARCHAR(10) NOT NULL`.
- Los comentarios describen reglas para `Entrada`, `Salida` y `Traslado`, pero no existen `CHECK` que las impongan.

### `Tbl_OperacionesVarias`

- PK: `CodigoOperacion INT IDENTITY(1,1)`.
- FKs: `CodigoSucursal INT NOT NULL` → `Tbl_Sucursales(CodigoSucursal)`; `CodigoEmpleado INT NOT NULL` → `Tbl_Empleados(CodigoEmpleado)`; `CodigoCliente INT` → `Tbl_Clientes(CodigoCliente)`.
- Columnas: `TipoServicio VARCHAR(40) NOT NULL`, `Descripcion VARCHAR(150)`, `Monto DECIMAL(10,2) NOT NULL`, `FechaOperacion DATETIME NOT NULL`, `Estado BIT NOT NULL`.

## Relaciones y dependencias

- `Tbl_Sucursales` → `Tbl_Areas`, `Tbl_Empleados`, `Tbl_Compras`, `Tbl_Ventas`, `Tbl_OperacionesVarias`.
- `Tbl_Categorias` → `Tbl_Productos`.
- `Tbl_Productos` → `Tbl_ProductosProveedores`, `Tbl_Inventarios`, `Tbl_ComprasDetalle`, `Tbl_VentasDetalle`.
- `Tbl_Proveedores` → `Tbl_ProductosProveedores`, `Tbl_Compras`, `Tbl_Pagos`.
- `Tbl_Areas` → `Tbl_Inventarios`.
- `Tbl_Empleados` → `Tbl_Compras`, `Tbl_Ventas`, `Tbl_Pagos`, `Tbl_MovimientosInventario`, `Tbl_OperacionesVarias`.
- `Tbl_Compras` → `Tbl_ComprasDetalle`, `Tbl_Pagos`.
- `Tbl_Ventas` → `Tbl_VentasDetalle`, `Tbl_Pagos`.
- `Tbl_Clientes` → `Tbl_Ventas`, `Tbl_Pagos`, `Tbl_OperacionesVarias`.
- `Tbl_Inventarios` → `Tbl_MovimientosInventario` como origen o destino.
- `Tbl_ComprasDetalle` y `Tbl_VentasDetalle` → `Tbl_MovimientosInventario`.
- La creación respeta las dependencias observadas: catálogos y maestros antes de sus tablas dependientes; no se observan ciclos de FK.

## Observaciones, errores y ambigüedades

1. Falta la imagen oficial en `docs/prototipos/0. Diseño Oficial.png`; no es posible comprobar la UI solicitada contra el diseño.
2. `CREATE DATABASE` no comprueba si `db_Supermercados` ya existe; repetirlo produciría error.
3. No hay `CHECK`, `DEFAULT` ni reglas de dominio para estados, tipos de pago, tipos de movimiento, cantidades, montos, precios o rangos de fechas. Los comentarios no sustituyen restricciones.
4. `Tbl_Pagos` permite múltiples FKs nulas o combinaciones incompatibles con `TipoPago`; el script no garantiza que un cobro tenga venta/cliente, un pago a proveedor tenga compra/proveedor o un salario tenga empleado.
5. `Tbl_MovimientosInventario` permite origen y destino nulos o simultáneos sin validar la regla descrita en comentarios, y tampoco obliga la correspondencia entre motivo y detalle.
6. La pertenencia entre sucursal y empleado en compras/ventas, y la pertenencia entre proveedor/producto y sus detalles, se documentan en los datos pero no se fuerzan con restricciones adicionales.
7. El script de datos no usa una transacción global. Un error intermedio puede dejar inserciones parciales y `IDENTITY_INSERT` podría quedar activo en la sesión.
8. Si se cumple la condición inicial del script de datos, `SET NOEXEC ON` salta los lotes siguientes; como el `SET NOEXEC OFF` está después, la sesión podría permanecer con `NOEXEC` activo hasta corregirse manualmente.
9. El script de datos verifica que no existan datos, salvo el cliente `Nit = 'CF'`, y luego inserta con identidades fijas. No debe ejecutarse sin confirmar el estado real de la base.

## Estado de revisión

Este documento es un inventario de lo escrito en los scripts, no una autorización para ejecutar SQL ni para modificar el esquema.



-- 1. Crear base de datos
CREATE DATABASE db_Supermercados;
GO

-- 2. Usar base de datos
USE db_Supermercados;
GO


-- 3. Creacion de tablas


CREATE TABLE Tbl_Sucursales
(
    CodigoSucursal INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(60) NOT NULL,
    Direccion VARCHAR(150) NOT NULL,
    Departamento VARCHAR(80) NOT NULL,
    Municipio VARCHAR(80) NOT NULL,
    Telefono VARCHAR(15) NOT NULL,
    FechaApertura DATE NOT NULL,
    Estado BIT NOT NULL
);

CREATE TABLE Tbl_Areas
(
    CodigoArea INT IDENTITY(1,1) PRIMARY KEY,
    CodigoSucursal INT NOT NULL REFERENCES Tbl_Sucursales(CodigoSucursal),
    Nombre VARCHAR(60) NOT NULL,
    Descripcion VARCHAR(100),
    Estado BIT NOT NULL
);

CREATE TABLE Tbl_Empleados
(
    CodigoEmpleado INT IDENTITY(1,1) PRIMARY KEY,
    CodigoSucursal INT NOT NULL REFERENCES Tbl_Sucursales(CodigoSucursal),
    Nombre VARCHAR(60) NOT NULL,
    Apellido VARCHAR(60) NOT NULL,
    Dpi BIGINT NOT NULL UNIQUE,
    Puesto VARCHAR(50) NOT NULL,
    Salario DECIMAL(10,2) NOT NULL,
    Estado BIT NOT NULL
);

CREATE TABLE Tbl_Categorias
(
    CodigoCategoria INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(100),
    FechaRegistro DATETIME NOT NULL,
    Estado BIT NOT NULL
);

CREATE TABLE Tbl_Productos
(
    CodigoProducto  INT IDENTITY(1,1) PRIMARY KEY,
    CodigoCategoria INT NOT NULL REFERENCES Tbl_Categorias(CodigoCategoria),
    Nombre VARCHAR(80) NOT NULL,
    CodigoBarra VARCHAR(30) NOT NULL UNIQUE,
    Marca VARCHAR(100),
    Presentacion VARCHAR(50),
    UnidadMedida VARCHAR(30) NOT NULL,
    PrecioCompra DECIMAL(10,2),
    PrecioVenta DECIMAL(10,2) NOT NULL,
    FechaRegistro DATE NOT NULL,
    Estado BIT NOT NULL
);

CREATE TABLE Tbl_Proveedores
(
    CodigoProveedor INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Nit VARCHAR(20)  NOT NULL UNIQUE,
    Contacto VARCHAR(80) NOT NULL,
    Departamento VARCHAR(80) NOT NULL,
    Municipio VARCHAR(80) NOT NULL,
    Telefono VARCHAR(15) NOT NULL,
    Correo VARCHAR(100),
    DiasCredito INT NOT NULL,
    FechaRegistro DATE NOT NULL,
    Estado BIT NOT NULL
);

CREATE TABLE Tbl_ProductosProveedores
(
    CodigoProductoProveedor INT IDENTITY(1,1) PRIMARY KEY,
    CodigoProveedor INT NOT NULL REFERENCES Tbl_Proveedores(CodigoProveedor),
    CodigoProducto INT NOT NULL REFERENCES Tbl_Productos(CodigoProducto),
    CodigoExterno VARCHAR(20) NOT NULL,
    CostoReferencia DECIMAL(10,2) NOT NULL,
    DiasEntrega INT NOT NULL,
    FechaRegistro DATE NOT NULL,
    Estado BIT NOT NULL,
    UNIQUE (CodigoProveedor, CodigoProducto)      -- no se repite la pareja
);

CREATE TABLE Tbl_Inventarios
(
    CodigoInventario INT IDENTITY(1,1) PRIMARY KEY,
    CodigoArea INT NOT NULL REFERENCES Tbl_Areas(CodigoArea),
    CodigoProducto INT NOT NULL REFERENCES Tbl_Productos(CodigoProducto),
    ExistenciaActual DECIMAL(10,2) NOT NULL,
    ExistenciaMinima DECIMAL(10,2) NOT NULL,
    ExistenciaMaxima DECIMAL(10,2),
    CostoPromedio DECIMAL(10,2) NOT NULL,
    FechaUltimoIngreso DATETIME,
    FechaUltimoConteo  DATETIME,
    Estado BIT NOT NULL,
    UNIQUE (CodigoArea, CodigoProducto)    -- un registro por area y producto
);



CREATE TABLE Tbl_Compras
(
    CodigoCompra INT IDENTITY(1,1) PRIMARY KEY,
    CodigoSucursal INT NOT NULL REFERENCES Tbl_Sucursales(CodigoSucursal),
    CodigoEmpleado INT NOT NULL REFERENCES Tbl_Empleados(CodigoEmpleado),
    CodigoProveedor INT NOT NULL REFERENCES Tbl_Proveedores(CodigoProveedor),
    NumeroCompra VARCHAR(20) NOT NULL UNIQUE,
    FechaCompra DATE NOT NULL,
    FechaProgramada DATETIME NOT NULL,
    FechaRecepcion DATETIME,
    Observacion VARCHAR(150),
    Estado VARCHAR(20)  NOT NULL    -- Borrador, Recibida, Anulada
);

CREATE TABLE Tbl_ComprasDetalle
(
    CodigoCompraDetalle INT IDENTITY(1,1) PRIMARY KEY,
    CodigoCompra INT NOT NULL REFERENCES Tbl_Compras(CodigoCompra),
    CodigoProducto INT NOT NULL REFERENCES Tbl_Productos(CodigoProducto),
    CantidadCompra DECIMAL(10,2) NOT NULL,
    CostoUnitario DECIMAL(10,2) NOT NULL,
    Descuento DECIMAL(10,2),
    Observacion VARCHAR(200),
    UNIQUE (CodigoCompra, CodigoProducto)  -- no repetir producto en una compra
);


CREATE TABLE Tbl_Clientes
(
    CodigoCliente INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(80) NOT NULL,
    Apellido VARCHAR(80) NOT NULL,
    Nit VARCHAR(20) NOT NULL UNIQUE,   -- 'CF' para Consumidor final
    Departamento VARCHAR(80) NOT NULL,
    Municipio VARCHAR(80) NOT NULL,
    Telefono VARCHAR(15),
    Correo VARCHAR(100),
    FechaRegistro DATETIME NOT NULL,
    Estado BIT NOT NULL
);

CREATE TABLE Tbl_Ventas
(
    CodigoVenta INT IDENTITY(1,1) PRIMARY KEY,
    CodigoCliente INT NOT NULL REFERENCES Tbl_Clientes(CodigoCliente),
    CodigoSucursal INT NOT NULL REFERENCES Tbl_Sucursales(CodigoSucursal),
    CodigoEmpleado INT NOT NULL REFERENCES Tbl_Empleados(CodigoEmpleado),
    NumeroVenta VARCHAR(20) NOT NULL UNIQUE,
    FechaVenta DATE NOT NULL,
    Observacion VARCHAR(200),
    Estado VARCHAR(20) NOT NULL     -- Borrador, Confirmada, Anulada
);

CREATE TABLE Tbl_VentasDetalle
(
    CodigoVentaDetalle INT IDENTITY(1,1) PRIMARY KEY,
    CodigoVenta INT NOT NULL REFERENCES Tbl_Ventas(CodigoVenta),
    CodigoProducto INT NOT NULL REFERENCES Tbl_Productos(CodigoProducto),
    CantidadVenta DECIMAL(10,2) NOT NULL,
    PrecioUnitario DECIMAL(10,2) NOT NULL,
    Descuento DECIMAL(10,2),
    CostoUnitarioHistorico DECIMAL(10,2) NOT NULL,
    UNIQUE (CodigoVenta, CodigoProducto)          -- no repetir producto en una venta
);



CREATE TABLE Tbl_Pagos
(
    CodigoPago INT IDENTITY(1,1) PRIMARY KEY,
    TipoPago VARCHAR(15) NOT NULL,      -- Cobro, PagoProveedor, Salario
    CodigoVenta INT REFERENCES Tbl_Ventas(CodigoVenta),
    CodigoCompra INT REFERENCES Tbl_Compras(CodigoCompra),
    CodigoCliente INT REFERENCES Tbl_Clientes(CodigoCliente),
    CodigoProveedor INT REFERENCES Tbl_Proveedores(CodigoProveedor),
    CodigoEmpleado INT REFERENCES Tbl_Empleados(CodigoEmpleado),
    ComprobantePago VARCHAR(30) NOT NULL UNIQUE,
    FechaPago DATE NOT NULL,
    MetodoPago VARCHAR(25) NOT NULL,
    Monto DECIMAL(10,2) NOT NULL,
    Comision DECIMAL(10,2),
    Autorizacion VARCHAR(30),
    Estado VARCHAR(10) NOT NULL       -- Aplicado, Anulado
);



CREATE TABLE Tbl_MovimientosInventario
(
    CodigoMovimiento INT IDENTITY(1,1) PRIMARY KEY,
    ReferenciaOperacion VARCHAR(30) NOT NULL,   -- agrupa los registros de una operacion
    TipoMovimiento VARCHAR(10) NOT NULL,   -- Entrada, Salida, Traslado
    Motivo VARCHAR(20) NOT NULL,   -- Compra, Venta, Ajuste, Devolucion...
    FechaMovimiento DATETIME NOT NULL,
    Cantidad DECIMAL(10,2) NOT NULL,
    CostoUnitario DECIMAL(10,2) NOT NULL,
    CodigoEmpleado INT NOT NULL REFERENCES Tbl_Empleados(CodigoEmpleado),
    CodigoInventarioOrigen INT REFERENCES Tbl_Inventarios(CodigoInventario),
    CodigoInventarioDestino INT REFERENCES Tbl_Inventarios(CodigoInventario),
    CodigoCompraDetalle INT REFERENCES Tbl_ComprasDetalle(CodigoCompraDetalle),
    CodigoVentaDetalle INT REFERENCES Tbl_VentasDetalle(CodigoVentaDetalle),
    Observacion VARCHAR(200),
    Estado VARCHAR(10) NOT NULL    -- Aplicado, Anulado
);


CREATE TABLE Tbl_OperacionesVarias
(
    CodigoOperacion INT IDENTITY(1,1) PRIMARY KEY,
    CodigoSucursal INT NOT NULL REFERENCES Tbl_Sucursales(CodigoSucursal),
    CodigoEmpleado INT NOT NULL REFERENCES Tbl_Empleados(CodigoEmpleado),
    CodigoCliente INT REFERENCES Tbl_Clientes(CodigoCliente),
    TipoServicio VARCHAR(40) NOT NULL,
    Descripcion VARCHAR(150),
    Monto DECIMAL(10,2) NOT NULL,
    FechaOperacion DATETIME NOT NULL,
    Estado BIT NOT NULL
);


USE db_Supermercados;
GO

-- =====================================================
-- 1. SUCURSALES: 5 REGISTROS
-- =====================================================

INSERT INTO Tbl_Sucursales
(Nombre, Direccion, Departamento, Municipio, Telefono, FechaApertura, Estado)
VALUES
('Sucursal Central', 'Zona 1, Avenida Central', 'Guatemala', 'Guatemala', '22334455', '2020-01-15', 1),
('Sucursal Norte', 'Zona 18, Ruta al Atlantico', 'Guatemala', 'Guatemala', '22334456', '2021-03-10', 1),
('Sucursal Sur', 'Avenida Petapa, Zona 12', 'Guatemala', 'Guatemala', '22334457', '2022-06-20', 1),
('Sucursal Antigua', 'Calle del Arco', 'Sacatepequez', 'Antigua Guatemala', '78334458', '2023-02-01', 1),
('Sucursal Escuintla', 'Avenida Centroamerica', 'Escuintla', 'Escuintla', '78834459', '2024-05-12', 1);


-- =====================================================
-- 2. AREAS: 5 REGISTROS
-- =====================================================

INSERT INTO Tbl_Areas
(CodigoSucursal, Nombre, Descripcion, Estado)
VALUES
(1, 'Abarrotes', 'Productos de consumo diario', 1),
(2, 'Bebidas', 'Agua y bebidas variadas', 1),
(3, 'Limpieza', 'Productos de limpieza del hogar', 1),
(4, 'Lacteos', 'Leche y derivados', 1),
(5, 'Snacks', 'Galletas y golosinas', 1);


-- =====================================================
-- 3. EMPLEADOS: 5 REGISTROS
-- =====================================================

INSERT INTO Tbl_Empleados
(CodigoSucursal, Nombre, Apellido, Dpi, Puesto, Salario, Estado)
VALUES
(1, 'Carlos', 'Lopez', 2500100100101, 'Administrador', 6500.00, 1),
(2, 'Maria', 'Garcia', 2500200200202, 'Cajera', 3800.00, 1),
(3, 'Jose', 'Hernandez', 2500300300303, 'Bodeguero', 4000.00, 1),
(4, 'Ana', 'Martinez', 2500400400404, 'Vendedora', 3750.00, 1),
(5, 'Pedro', 'Ramirez', 2500500500505, 'Supervisor', 5000.00, 1);


-- =====================================================
-- 4. CATEGORIAS: 5 REGISTROS
-- =====================================================

INSERT INTO Tbl_Categorias
(Nombre, Descripcion, FechaRegistro, Estado)
VALUES
('Abarrotes', 'Arroz, frijol y otros alimentos', '2026-01-05', 1),
('Bebidas', 'Agua, jugos y gaseosas', '2026-02-10', 1),
('Limpieza', 'Detergentes y desinfectantes', '2026-03-15', 1),
('Lacteos', 'Leche, queso y yogur', '2026-04-20', 1),
('Snacks', 'Galletas, papalinas y golosinas', '2026-05-25', 1);


-- =====================================================
-- 5. PRODUCTOS: 5 REGISTROS
-- =====================================================

INSERT INTO Tbl_Productos
(CodigoCategoria, Nombre, CodigoBarra, Marca, Presentacion,
 UnidadMedida, PrecioCompra, PrecioVenta, FechaRegistro, Estado)
VALUES
(1, 'Arroz blanco', '740100000001', 'GT Alimentos', 'Bolsa de 1 kg', 'Unidad', 12.00, 18.50, '2026-01-10', 1),
(2, 'Agua pura', '740100000002', 'Agua Guatemala', 'Botella de 1 litro', 'Unidad', 3.50, 6.00, '2026-02-15', 1),
(3, 'Detergente', '740100000003', 'Limpieza GT', 'Bolsa de 500 g', 'Unidad', 15.00, 24.50, '2026-03-20', 1),
(4, 'Leche entera', '740100000004', 'Lacteos Guatemala', 'Caja de 1 litro', 'Unidad', 9.00, 13.50, '2026-04-25', 1),
(5, 'Galletas dulces', '740100000005', 'GT Snacks', 'Paquete de 200 g', 'Unidad', 5.00, 10.00, '2026-05-30', 1);


-- =====================================================
-- 6. PROVEEDORES: 5 REGISTROS
-- =====================================================

INSERT INTO Tbl_Proveedores
(Nombre, Nit, Contacto, Departamento, Municipio, Telefono,
 Correo, DiasCredito, FechaRegistro, Estado)
VALUES
('Distribuidora Chapina', '1234567-1', 'Luis Perez', 'Guatemala', 'Guatemala', '55112233', 'chapina@ejemplo.com', 30, '2026-01-10', 1),
('Bebidas del Pacifico', '1234567-2', 'Rosa Diaz', 'Escuintla', 'Escuintla', '55112234', 'bebidas@ejemplo.com', 15, '2026-02-12', 1),
('Productos del Hogar', '1234567-3', 'Mario Soto', 'Guatemala', 'Mixco', '55112235', 'hogar@ejemplo.com', 30, '2026-03-14', 1),
('Lacteos Nacionales', '1234567-4', 'Elena Cruz', 'Guatemala', 'Villa Nueva', '55112236', 'lacteos@ejemplo.com', 20, '2026-04-16', 1),
('Snacks Chapines', '1234567-5', 'Oscar Leon', 'Sacatepequez', 'Antigua Guatemala', '55112237', 'snacks@ejemplo.com', 15, '2026-05-18', 1);


-- =====================================================
-- 7. PRODUCTOS POR PROVEEDOR: 5 REGISTROS
-- =====================================================

INSERT INTO Tbl_ProductosProveedores
(CodigoProveedor, CodigoProducto, CodigoExterno, CostoReferencia,
 DiasEntrega, FechaRegistro, Estado)
VALUES
(1, 1, 'PROV-ARR-01', 12.00, 2, '2026-01-12', 1),
(2, 2, 'PROV-AGU-01', 3.50, 1, '2026-02-14', 1),
(3, 3, 'PROV-DET-01', 15.00, 3, '2026-03-16', 1),
(4, 4, 'PROV-LEC-01', 9.00, 2, '2026-04-18', 1),
(5, 5, 'PROV-GAL-01', 5.00, 2, '2026-05-20', 1);


-- =====================================================
-- 8. INVENTARIOS: 5 REGISTROS
-- =====================================================

INSERT INTO Tbl_Inventarios
(CodigoArea, CodigoProducto, ExistenciaActual, ExistenciaMinima,
 ExistenciaMaxima, CostoPromedio, FechaUltimoIngreso,
 FechaUltimoConteo, Estado)
VALUES
(1, 1, 8, 10, 100, 12.00, '2026-09-20', '2026-09-25', 1),
(2, 2, 50, 20, 200, 3.50, '2026-09-22', '2026-09-26', 1),
(3, 3, 5, 15, 100, 15.00, '2026-09-10', '2026-09-25', 1),
(4, 4, 12, 15, 80, 9.00, NULL, '2026-09-24', 1),
(5, 5, 10, 10, 120, 5.00, '2026-09-18', '2026-09-25', 1);


-- =====================================================
-- 9. COMPRAS: 5 REGISTROS
-- =====================================================

INSERT INTO Tbl_Compras
(CodigoSucursal, CodigoEmpleado, CodigoProveedor, NumeroCompra,
 FechaCompra, FechaProgramada, FechaRecepcion, Observacion, Estado)
VALUES
(1, 1, 1, 'COM-001', '2026-09-01', '2026-09-03', '2026-09-03', 'Compra de arroz', 'Recibida'),
(2, 2, 2, 'COM-002', '2026-09-02', '2026-09-04', '2026-09-04', 'Compra de agua', 'Recibida'),
(3, 3, 3, 'COM-003', '2026-09-05', '2026-09-07', '2026-09-07', 'Compra de detergente', 'Recibida'),
(4, 4, 4, 'COM-004', '2026-09-08', '2026-09-10', NULL, 'Compra de leche pendiente', 'Borrador'),
(5, 5, 5, 'COM-005', '2026-09-10', '2026-09-12', '2026-09-12', 'Compra de galletas', 'Recibida');


-- =====================================================
-- 10. DETALLE DE COMPRAS: 5 REGISTROS
-- =====================================================

INSERT INTO Tbl_ComprasDetalle
(CodigoCompra, CodigoProducto, CantidadCompra, CostoUnitario, Descuento, Observacion)
VALUES
(1, 1, 50, 12.00, 0.00, 'Arroz para inventario'),
(2, 2, 100, 3.50, 0.00, 'Agua para inventario'),
(3, 3, 30, 15.00, 5.00, 'Detergente para inventario'),
(4, 4, 40, 9.00, 0.00, 'Leche pendiente de recepcion'),
(5, 5, 60, 5.00, 2.00, 'Galletas para inventario');


-- =====================================================
-- 11. CLIENTES: 5 REGISTROS EN TOTAL
-- Incluye Consumidor Final (CF)
-- =====================================================

INSERT INTO Tbl_Clientes
(Nombre, Apellido, Nit, Departamento, Municipio, Telefono,
 Correo, FechaRegistro, Estado)
VALUES
('Consumidor', 'Final', 'CF', 'Guatemala', 'Guatemala', NULL, NULL, '2026-01-01', 1),
('Andrea', 'Lopez', '9876543-1', 'Guatemala', 'Guatemala', '41112233', 'andrea@ejemplo.com', '2026-02-01', 1),
('Roberto', 'Garcia', '9876543-2', 'Santa Rosa', 'Cuilapa', '41112234', 'roberto@ejemplo.com', '2026-03-01', 1),
('Daniela', 'Morales', '9876543-3', 'Sacatepequez', 'Antigua Guatemala', '41112235', 'daniela@ejemplo.com', '2026-04-01', 1),
('Fernando', 'Castillo', '9876543-4', 'Escuintla', 'Escuintla', '41112236', 'fernando@ejemplo.com', '2026-05-01', 1);


-- =====================================================
-- 12. VENTAS: 5 REGISTROS
-- =====================================================

INSERT INTO Tbl_Ventas
(CodigoCliente, CodigoSucursal, CodigoEmpleado, NumeroVenta,
 FechaVenta, Observacion, Estado)
VALUES
(1, 1, 1, 'VEN-001', '2026-09-20', 'Venta a consumidor final', 'Confirmada'),
(2, 2, 2, 'VEN-002', '2026-09-21', 'Venta de agua', 'Confirmada'),
(3, 3, 3, 'VEN-003', '2026-09-22', 'Venta de detergente', 'Confirmada'),
(4, 4, 4, 'VEN-004', '2026-09-23', 'Venta de leche', 'Confirmada'),
(5, 5, 5, 'VEN-005', '2026-09-24', 'Venta de galletas', 'Confirmada');


-- =====================================================
-- 13. DETALLE DE VENTAS: 5 REGISTROS
-- =====================================================

INSERT INTO Tbl_VentasDetalle
(CodigoVenta, CodigoProducto, CantidadVenta, PrecioUnitario,
 Descuento, CostoUnitarioHistorico)
VALUES
(1, 1, 2, 18.50, 0.00, 12.00),
(2, 2, 5, 6.00, 0.00, 3.50),
(3, 3, 2, 24.50, 1.00, 15.00),
(4, 4, 3, 13.50, 0.00, 9.00),
(5, 5, 4, 10.00, 0.00, 5.00);


-- =====================================================
-- 14. PAGOS: 5 REGISTROS
-- =====================================================

INSERT INTO Tbl_Pagos
(TipoPago, CodigoVenta, CodigoCompra, CodigoCliente,
 CodigoProveedor, CodigoEmpleado, ComprobantePago, FechaPago,
 MetodoPago, Monto, Comision, Autorizacion, Estado)
VALUES
('Cobro', 1, NULL, 1, NULL, NULL, 'PAG-001', '2026-09-20', 'Efectivo', 37.00, 0.00, NULL, 'Aplicado'),
('Cobro', 2, NULL, 2, NULL, NULL, 'PAG-002', '2026-09-21', 'Tarjeta', 30.00, 1.00, 'AUT-002', 'Aplicado'),
('PagoProveedor', NULL, 1, NULL, 1, NULL, 'PAG-003', '2026-09-21', 'Transferencia', 600.00, 0.00, 'AUT-003', 'Aplicado'),
('PagoProveedor', NULL, 2, NULL, 2, NULL, 'PAG-004', '2026-09-22', 'Transferencia', 350.00, 0.00, 'AUT-004', 'Aplicado'),
('Salario', NULL, NULL, NULL, NULL, 3, 'PAG-005', '2026-09-30', 'Transferencia', 4000.00, 0.00, 'AUT-005', 'Aplicado');


-- =====================================================
-- 15. MOVIMIENTOS DE INVENTARIO: 5 REGISTROS
-- =====================================================

INSERT INTO Tbl_MovimientosInventario
(ReferenciaOperacion, TipoMovimiento, Motivo, FechaMovimiento,
 Cantidad, CostoUnitario, CodigoEmpleado, CodigoInventarioOrigen,
 CodigoInventarioDestino, CodigoCompraDetalle, CodigoVentaDetalle,
 Observacion, Estado)
VALUES
('MOV-001', 'Entrada', 'Compra', '2026-09-03', 50, 12.00, 1, NULL, 1, 1, NULL, 'Entrada de arroz', 'Aplicado'),
('MOV-002', 'Entrada', 'Compra', '2026-09-04', 100, 3.50, 2, NULL, 2, 2, NULL, 'Entrada de agua', 'Aplicado'),
('MOV-003', 'Salida', 'Venta', '2026-09-20', 2, 12.00, 1, 1, NULL, NULL, 1, 'Salida de arroz vendido', 'Aplicado'),
('MOV-004', 'Salida', 'Venta', '2026-09-21', 5, 3.50, 2, 2, NULL, NULL, 2, 'Salida de agua vendida', 'Aplicado'),
('MOV-005', 'Entrada', 'Ajuste', '2026-09-25', 3, 15.00, 3, NULL, 3, NULL, NULL, 'Ajuste de inventario', 'Aplicado');


-- =====================================================
-- 16. OPERACIONES VARIAS: 5 REGISTROS
-- =====================================================

INSERT INTO Tbl_OperacionesVarias
(CodigoSucursal, CodigoEmpleado, CodigoCliente, TipoServicio,
 Descripcion, Monto, FechaOperacion, Estado)
VALUES
(1, 1, 1, 'Servicio de empaque', 'Empaque de productos', 5.00, '2026-09-20', 1),
(2, 2, 2, 'Entrega a domicilio', 'Entrega de compra', 15.00, '2026-09-21', 1),
(3, 3, NULL, 'Mantenimiento', 'Mantenimiento de estanterias', 250.00, '2026-09-22', 1),
(4, 4, 4, 'Pedido especial', 'Preparacion de pedido', 20.00, '2026-09-23', 1),
(5, 5, NULL, 'Limpieza', 'Limpieza de bodega', 100.00, '2026-09-24', 1);
GO
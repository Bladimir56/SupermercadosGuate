# Memoria del proyecto

## Estado inicial

- Proyecto académico: Supermercado Multisucursal, Base de Datos I.
- Se creó la estructura inicial de carpetas y documentos.
- No existe todavía un esquema SQL aprobado en este proyecto.
- No se han registrado credenciales.

## Pendientes

- Recibir y aprobar el modelo relacional y el esquema SQL.
- Definir datos de prueba sin exponer secretos.
- Definir instrucciones de conexión para cada entorno.
- Obtener aprobación antes de implementar cualquier funcionalidad de aplicación.

## Avance de revisión del esquema

- Se leyó `database/01_Crear_Base_Datos.sql` y se identificó la base `db_Supermercados` con 16 tablas, sus columnas, PK, FK, restricciones `UNIQUE`, relaciones y dependencias.
- Se leyó `database/02_Datos_Prueba.sql`; contiene carga de datos, validaciones y consultas posteriores. No se ejecutó.
- Se creó `docs/RESUMEN_ESQUEMA.md` con el inventario y las ambigüedades detectadas.
- No se encontró `docs/prototipos/0. Diseño Oficial.png`.
- Se verificó que `docs/COMANDOS_RAPIDOS.md` existe.
- Pendiente: recibir la imagen oficial y confirmar autorización antes de ejecutar cualquier SQL.

## Entorno SQL Server

- Se leyó `database/CONEXION.md`; la contraseña fue retirada del Markdown y debe proporcionarse mediante un mecanismo local seguro.
- Docker tiene un contenedor existente y activo: `sqlserver_basedatos`, imagen `mcr.microsoft.com/mssql/server:2022-latest`, puerto publicado `1435:1433`.
- No se creó ni reemplazó ningún contenedor.
- No se ejecutaron scripts ni consultas SQL.
- Pendiente: recibir/proveer la contraseña mediante un mecanismo local seguro, revisar la base existente y obtener aprobación explícita antes de ejecutar los scripts.

## Verificación del entorno actual

- La contraseña fue leída localmente sin imprimirse y se retiró nuevamente de `database/CONEXION.md`.
- `db_Supermercados` existe y está `ONLINE` en el contenedor `sqlserver_basedatos`.
- El contenedor publica `1435:1433` y tiene volumen persistente `sqlserver_basedatos_data` montado en `/var/opt/mssql`.
- La base contiene 17 tablas: las 16 tablas del grupo más `dbo.sysdiagrams`.
- La base contiene 30 FK; la consulta detallada confirmó que corresponden a las relaciones del esquema documentado.
- Conteos observados: `Tbl_Sucursales` 6, `Tbl_Areas` 5, `Tbl_Empleados` 5, `Tbl_Categorias` 5, `Tbl_Productos` 5, `Tbl_Proveedores` 5, `Tbl_ProductosProveedores` 5, `Tbl_Inventarios` 5, `Tbl_Compras` 5, `Tbl_ComprasDetalle` 5, `Tbl_Clientes` 1, `Tbl_Ventas` 0, `Tbl_VentasDetalle` 0, `Tbl_Pagos` 0, `Tbl_MovimientosInventario` 0 y `Tbl_OperacionesVarias` 0.
- No se ejecutaron `01_Crear_Base_Datos.sql` ni `02_Datos_Prueba.sql`: el primero fallaría porque la base ya existe y el segundo detectaría datos existentes y activaría `NOEXEC`.
- Decisión aprobada: conservar la base parcial existente.
- No cargar los datos de prueba y no ejecutar `database/02_Datos_Prueba.sql`.
- No autorizar operaciones de reemplazo, limpieza o borrado de la base.

## Git y GitHub

- Se autorizó inicializar Git, crear el repositorio público `SupermercadoGuate` y publicarlo en la cuenta indicada.
- Git local está disponible y el repositorio fue inicializado en la rama `main`.
- GitHub CLI no está instalado; la autenticación web de GitHub está pendiente.
- `database/CONEXION.md` está excluido mediante `.gitignore` para evitar publicar la contraseña.
- Repositorio remoto creado y publicado: `https://github.com/Bladimir56/SupermercadosGuate`.
- Rama publicada: `main`; remoto: `origin`.
- El primer commit `2cfedf2` fue publicado correctamente.

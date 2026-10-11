# Comandos rápidos

Los comandos de esta guía no contienen secretos. Las rutas indican el directorio desde el que se ejecutan.

## Windows/PowerShell

### Comandos usados

- `Get-ChildItem -Force -Recurse | Select-Object -ExpandProperty FullName` — inspecciona la estructura existente. Ruta: `C:\2026_BaseDatos`.
- `New-Item -ItemType Directory -Force -Path database, docs, docs\diagramas, docs\prototipos, ia, ia\skills, ia\skills\crud-simple, ia\skills\crud-foreign-key, ia\skills\crud-encabezado-detalle, ia\skills\diseno-ui, src, power-bi` — crea directorios faltantes. Ruta: `C:\2026_BaseDatos`.
- `Get-Content -Raw database\01_Crear_Base_Datos.sql` — lee el script de creación sin ejecutarlo. Ruta: `C:\2026_BaseDatos`.
- `Get-Content -Raw database\02_Datos_Prueba.sql` — lee el script de datos sin ejecutarlo. Ruta: `C:\2026_BaseDatos`.
- `$paths = @('docs\prototipos\0. Diseño Oficial.png','docs\COMANDOS_RAPIDOS.md','MEMORY.md','AGENTS.md'); foreach ($p in $paths) { if (Test-Path -LiteralPath $p) { $i = Get-Item -LiteralPath $p; "EXISTE`t$($i.FullName)`t$($i.Length) bytes" } else { "FALTA`t$((Join-Path (Get-Location) $p))" } }` — comprueba la existencia de archivos requeridos. Ruta: `C:\2026_BaseDatos`.
- `Get-ChildItem -Force -Recurse | Sort-Object FullName | Select-Object -ExpandProperty FullName` — verifica la estructura final. Ruta: `C:\2026_BaseDatos`.

## Docker

- `docker ps -a --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"` — revisa contenedores existentes antes de crear uno. Ruta: `C:\2026_BaseDatos`. Resultado relevante: `sqlserver_basedatos` está activo en `1435:1433`.
- `docker version --format "Client={{.Client.Version}} Server={{.Server.Version}}"` — revisa versiones de Docker. Ruta: `C:\2026_BaseDatos`.
- `docker inspect sqlserver_basedatos --format "Name=...; Status=...; Image=...; Ports=...; Mounts=..."` — verifica estado, puerto y almacenamiento persistente del contenedor. Ruta: `C:\2026_BaseDatos`.
- `docker exec -e "SQLCMDPASSWORD=<contraseña-local>" sqlserver_basedatos /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -C -d master -Q "<consulta de solo lectura>"` — consulta existencia de base, tablas, FK y conteos sin registrar la contraseña. Ruta: `C:\2026_BaseDatos`.
- No se creó un contenedor nuevo porque ya existe `sqlserver_basedatos` activo.

## dotnet

Pendiente de definir cuando se apruebe la aplicación ASP.NET Core MVC.

## SQL Server

Pendiente de definir cuando exista un esquema SQL aprobado. No ejecutar scripts vacíos como si fueran un esquema.

## Git

- `git status` — revisa cambios locales. Ruta: `C:\2026_BaseDatos`.
- `git diff -- <ruta>` — revisa cambios de una ruta. Ruta: `C:\2026_BaseDatos`.
- `git init -b main` — inicializa el repositorio local en la rama `main`. Ruta: `C:\2026_BaseDatos`.
- `git status --short --ignored` — verifica archivos pendientes y confirma que `database/CONEXION.md` está ignorado. Ruta: `C:\2026_BaseDatos`.

## Diagnóstico

- `Get-ChildItem -Force -Recurse` — revisa archivos y carpetas existentes. Ruta: `C:\2026_BaseDatos`.
- `Get-Content <ruta>` — lee un archivo para diagnóstico. Ruta: `C:\2026_BaseDatos`.
- `Get-NetTCPConnection -State Listen` — comprueba puertos TCP locales en escucha. Ruta: `C:\2026_BaseDatos`.
- `docker exec -e "SQLCMDPASSWORD=<contraseña-local>" sqlserver_basedatos /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -C -d db_Supermercados -Q "<consulta de FK de solo lectura>"` — verifica las relaciones FK existentes. Ruta: `C:\2026_BaseDatos`.
- Decisión operativa: conservar `db_Supermercados`; no ejecutar el script de datos de prueba ni comandos de limpieza o reemplazo. Ruta: `C:\2026_BaseDatos`.

## Solución de errores

Antes de corregir un error, conservar el mensaje completo, verificar la ruta de ejecución y revisar las reglas de [AGENTS.md](../AGENTS.md). No incluir secretos en reportes o comandos.

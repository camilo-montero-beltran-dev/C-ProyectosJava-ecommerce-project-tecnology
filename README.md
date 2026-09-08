# ✅ Proyecto: Ecommerce Technology — Admin Backoffice
Desarrollado por **Camilo Montero**

<br>

<img width="1872" height="907" alt="image" src="https://github.com/user-attachments/assets/abf6f077-0b8e-4805-bc84-6e5da91657dd" />

<br>



---

## 📌 Descripción
API REST de administración (backoffice), compuesta por un backend en Spring Boot, una interfaz web en Angular/TypeScript, y una base de datos MySQL. Incluye almacenamiento de imágenes en Amazon S3.

Este repositorio es el **panel de gestión** del ecosistema: administra los datos maestros del negocio (productos, marcas, categorías, inventario, usuarios y roles). La tienda de cara al cliente (catálogo público, carrito, checkout y órdenes) se construirá como una **API de ecommerce independiente**, que consumirá este backoffice como fuente de datos del catálogo — ver [Próximas mejoras](#-próximas-mejoras).



Diagrama relacional

<img width="946" height="1051" alt="bd" src="https://github.com/user-attachments/assets/7d75fc16-e5d7-41b2-a364-ee09e58ace27" />

<br>

---

## 🚀 Características actuales
- ✅ CRUD para productos, marcas y categorías.
- 📦 Control de inventario mediante registro de movimientos (`MovimientoInventario`), no solo un campo de stock sobrescrito.
- 🖼 Subida y eliminación de imágenes a Amazon S3.
- 🔗 Asociación de imágenes según tipo de entidad (`TipoEntidad`).
- 👤 Gestión de usuarios administrativos con estado (`EstadoUsuario`) en lugar de eliminación física.
- 🔐 Autenticación y autorización con JWT + Spring Security.
- ⚠️ Manejo de errores centralizado (`GlobalExceptionHandler`, `ResponseStatusException`).
- 📦 Uso de DTOs + MapStruct.
- 📄 Paginación en los listados principales (productos, usuarios).
- 🧱 Backend con arquitectura por capas (`controller`, `service`, `dao`, `dto`, `entity`, `mapper`).
- 🗄 Script SQL de base de datos incluido.
- 🖥️ Frontend desacoplado en Angular, con interceptor de token JWT y adapters para normalizar respuestas del backend.

---

## 📁 Estructura del repositorio
```
ecommerce-tecnology/
├── backend/
│   └── src/main/java/com/development/ecommerce_tecnology/
│       ├── config/          → Configuración (S3, Spring Data REST, Security)
│       ├── controller/
│       ├── dao/
│       ├── dto/
│       ├── entity/
│       ├── enums/
│       ├── exception/
│       ├── mapper/
│       ├── security/        → JWT, UserDetails
│       └── service/
│
├── frontend/
│   └── src/app/
│       ├── component/       → inventario, marca, producto, usuario, validador
│       ├── interceptors/    → token.interceptor.ts
│       ├── models/          → entidades, adapters, DTOs de actualización
│       └── services/
│
├── database/    → Scripts SQL de la base de datos
└── README.md    → Este archivo
```

---

## ⚙️ Cómo ejecutar el backend
1. Clona el repositorio:
```bash
git clone https://github.com/tuusuario/ecommerce-tecnology.git
cd ecommerce-tecnology/backend
```
2. Copia el archivo de configuración de ejemplo:
```bash
cp src/main/resources/application.properties.example src/main/resources/application.properties
```
3. Edita el archivo con tus credenciales:
```properties
# MySQL
spring.datasource.url=jdbc:mysql://localhost:3306/mi_base
spring.datasource.username=mi_usuario
spring.datasource.password=mi_contraseña

# AWS S3
aws.accessKey=TU_ACCESS_KEY
aws.secretKey=TU_SECRET_KEY
aws.region=us-east-2
aws.bucketName=mi-bucket
```
4. Ejecuta:
```bash
./mvnw spring-boot:run
```

---

## ⚙️ Cómo ejecutar el frontend (Angular)
1. Entra a la carpeta:
```bash
cd ecommerce-tecnology/frontend
```
2. Instala las dependencias:
```bash
npm install
```
3. Ejecuta el servidor local:
```bash
ng serve
```
4. Abre en tu navegador: `http://localhost:4200`

---

## 🗃️ Base de datos
Los scripts `.sql` están en la carpeta `database/`. Puedes importarlos desde **MySQL Workbench**:
1. Abre Workbench → `File > Open SQL Script`
2. Ejecuta cada archivo `.sql` según el orden lógico (ej. primero `categoria.sql`, luego `producto.sql`, etc.)

---

## 🔜 Próximas mejoras
- 🛒 API de Ecommerce independiente (catálogo público, carrito, checkout, órdenes) que consuma este backoffice como fuente de datos del catálogo.
- 🔒 Corregir condición de carrera en la generación de código de producto y reforzar control de stock concurrente.
- 🛡️ Autorización granular por rol (`@PreAuthorize`) en endpoints administrativos.
- 🧪 Pruebas unitarias con JUnit + Mockito.
- 🧾 Documentación Swagger/OpenAPI.
- 🔍 Revisión de exposición de Spring Data REST, para evitar exponer entidades sin pasar por los DTOs/reglas de negocio.
- 🐳 Dockerizar backend y frontend.
- 🧹 Refactorización y modularización avanzada.

---

## 📁 Tecnologías utilizadas
- ☕ Java 21, Spring Boot, JPA, Hibernate
- 🗄 MySQL
- ☁️ Amazon S3 (AWS SDK)
- 💻 Angular 17, TypeScript
- 🔐 Spring Security + JWT
- 🧪 JUnit, Mockito (planeado)

---

## 📝 Licencia
Este proyecto está bajo la Licencia MIT.

---

## 🤝 Contacto
Camilo Montero


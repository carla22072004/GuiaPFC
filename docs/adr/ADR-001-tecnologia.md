# ADR-001: Selección de la tecnología principal

## Estado

Aceptado.

## Contexto

El equipo necesitaba seleccionar las tecnologías para desarrollar el Sistema Web de Gestión de Pre-sustentaciones de la UTEQ.

El sistema requiere autenticación por roles, generación de documentos PDF, envío de notificaciones, persistencia de datos y una interfaz web responsiva.

## Opciones consideradas

- Java 17 con Spring Boot 3.2.1
- PHP 8.2 con Laravel 11
- ASP.NET Core 8

## Decisión

Se seleccionó Java 17 con Spring Boot 3.2.1 para el backend, Angular 21 para el frontend y PostgreSQL 15 para la base de datos.

Spring Boot permite implementar una API REST, autenticación mediante JWT, persistencia con JPA/Hibernate, envío de correos y generación de documentos PDF.

Angular permite construir una aplicación de página única con interfaces organizadas según los roles del sistema.

## Consecuencias positivas

- Separación del sistema por capas.
- Integración con PostgreSQL.
- Seguridad mediante Spring Security y JWT.
- Desarrollo de una interfaz web responsiva.
- Facilidad para realizar pruebas unitarias.

## Consecuencias negativas

- Spring Boot requiere una configuración inicial más compleja.
- Java puede requerir más código que otros lenguajes.
- El equipo debe mantener conocimientos de frontend y backend.

# Fase 3: Creación de un Paquete

Este proyecto es un ejemplo práctico de la creación y uso de un paquete en Flutter. Se basa en la Fase 2, que consistió en el consumo de una **Fake API**. La aplicación muestra los datos obtenidos de la API en una pantalla.

## Objetivo del Proyecto

El objetivo principal es demostrar cómo estructurar y desarrollar un paquete reutilizable en Flutter, siguiendo buenas prácticas y principios de arquitectura limpia (**Clean Architecture**).

## Características

- **Consumo de API**: Obtención de datos desde una Fake API.
- **Pantalla de Visualización**: Interfaz gráfica para mostrar los datos obtenidos.
- **Estructura Modular**: Implementación basada en Clean Architecture para facilitar la escalabilidad y el mantenimiento.

## Estructura del Proyecto Base

La estructura de carpetas sigue los principios de **Clean Architecture**, separando las responsabilidades en capas bien definidas:

1. **Data**: Contiene las fuentes de datos, modelos y mapeadores.
2. **Domain**: Incluye las entidades, repositorios y casos de uso.
3. **Presentation**: Maneja la interfaz de usuario y la lógica de presentación (como blocs o providers).

Para más detalles sobre la estructura específica del proyecto, consulta el README del siguiente enlace: [Clean Architecture en Flutter](https://github.com/ResoCoder/flutter-tdd-clean-architecture-course).

## Estructura del Proyecto Example

El proyecto `example` es una implementación de ejemplo que utiliza el paquete creado. Sirve como referencia para entender cómo integrar y usar el paquete en una aplicación Flutter.

## Requisitos Previos

- Flutter SDK instalado.
- Conocimientos básicos de Flutter y Dart.
- Familiaridad con Clean Architecture (opcional, pero recomendado).

## Instalación y Configuración

1. Clona este repositorio:
   ```bash
   git clone https://github.com/tu-usuario/packagePragma.git
   cd packagePragma
   ```

2. Instala las dependencias:
   ```bash
   flutter pub get
   ```

3. Ejecuta el proyecto de ejemplo:
   ```bash
   cd example
   flutter run
   ```

## Uso del Paquete

Para usar este paquete en tu proyecto, sigue estos pasos:

1. Agrega la dependencia en tu archivo `pubspec.yaml`:
   ```yaml
   dependencies:
     package_pragma:
       path: ../
   ```

2. Importa el paquete en tu código:
   ```dart
   import 'package:package_pragma/package_pragma.dart';
   ```

3. Utiliza las funcionalidades del paquete según sea necesario.

## Contribuciones

Las contribuciones son bienvenidas. Si encuentras algún problema o tienes sugerencias, no dudes en abrir un **issue** o enviar un **pull request**.

## Licencia

Este proyecto está bajo la licencia MIT. Consulta el archivo [LICENSE](./LICENSE) para más detalles.

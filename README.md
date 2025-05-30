# packagePragma

## Introducción

`packagePragma` es un paquete de Flutter diseñado para facilitar la gestión de productos y carritos en aplicaciones móviles. Este paquete incluye funcionalidades como cargar productos, crear carritos, eliminar productos y más.

## Requisitos previos

Antes de comenzar, asegúrate de tener lo siguiente instalado:

- Flutter SDK (versión 3.0 o superior).
- Dart SDK.
- Un editor de texto como Visual Studio Code o Android Studio.

## Instalación

Para instalar el paquete, sigue estos pasos:

1. Agrega la dependencia en tu archivo `pubspec.yaml`:

   ```yaml
   dependencies:
     fake_maker_api_pragma_api:
       path: ../fake_maker_api_pragma_api
   ```

2. Ejecuta el siguiente comando para instalar las dependencias:

   ```bash
   flutter pub get
   ```

## Uso del paquete

Aquí tienes un ejemplo básico de cómo usar el paquete:

```dart
import 'package:fake_maker_api_pragma_api/presentation/blocs/product_bloc.dart';
import 'package:fake_maker_api_pragma_api/presentation/initializationbloc/product_initialization.dart';

void main() {
  final productBloc = initializeProductBloc((productOrProducts) {
    if (productOrProducts is Product) {
      print('Producto cargado: ${productOrProducts.title}');
    } else if (productOrProducts is List<Product>) {
      print('Productos cargados: ${productOrProducts.length}');
    }
  });

  productBloc.eventSink.add(LoadProduct(1));
}
```

## Ejecutar el ejemplo

Para ejecutar el proyecto de ejemplo incluido en este repositorio:

1. Clona el repositorio:

   ```bash
   git clone https://github.com/diagomezpa/packagePragma.git
   ```

2. Navega al directorio del ejemplo:

   ```bash
   cd packagePragma/example
   ```

3. Instala las dependencias:

   ```bash
   flutter pub get
   ```

4. Ejecuta la aplicación:

   ```bash
   flutter run
   ```

## Contribuir

Si deseas contribuir al proyecto, por favor sigue estos pasos:

1. Haz un fork del repositorio.
2. Crea una rama para tu funcionalidad o corrección.
3. Realiza tus cambios y haz un commit.
4. Envía un pull request.

## Licencia

Este proyecto está bajo la licencia MIT. Consulta el archivo `LICENSE` para más detalles.

## Estructura del Proyecto

La estructura de carpetas sigue los principios de **Clean Architecture**, con las siguientes principales:

```
fase2cleanarchitecture/
├── lib/
│   ├── core/
│   │   └── error/
│   │       └── failures.dart  # Define las clases de error y las fallas comunes
│   ├── data/
│   │   ├── data_sources/
│   │   │   └── api_client.dart  # Cliente para manejar las solicitudes HTTP
│   │   │   └── api_endpoints.dart  # Define los endpoints de la API
│   │   ├── models/
│   │   │   ├── cart/
│   │   │   │   └── cart_model.dart  # Modelo para Cart
│   │   │   │   └── products_model.dart  # Modelo para Products en Cart
│   │   │   ├── product/
│   │   │   │   └── product_model.dart  # Modelo para Product
│   │   │   │   └── rating_model.dart  # Modelo para Rating en Product
│   │   │   │   └── enum_values.dart  # Utilidad para manejar valores de enumeración
│   │   │   └── user/
│   │   │       └── user_model.dart  # Modelo para User
│   │   │       └── name_model.dart  # Modelo para Name en User
│   │   │       └── address_model.dart  # Modelo para Address en User
│   │   │       └── geolocation_model.dart  # Modelo para Geolocation en Address
│   │   ├── mappers/
│   │   │   └── user_mapper.dart  # Mappers para User
│   │   │   └── product_mapper.dart  # Mappers para Product
│   │   │   └── cart_mapper.dart  # Mappers para Cart
│   │   ├── repositories/
│   │       └── user_repository_impl.dart  # Implementación del repositorio para User
│   │       └── product_repository_impl.dart  # Implementación del repositorio para Product
│   │       └── cart_repository_impl.dart  # Implementación del repositorio para Cart
│   ├── domain/
│   │   ├── entities/
│   │   │   └── user.dart  # Entidad para User
│   │   │   └── product.dart  # Entidad para Product
│   │   │   └── cart.dart  # Entidad para Cart
│   ├── repositories/
│   │   └── user_repository.dart  # Interfaz para el repositorio de User
│   │   └── product_repository.dart  # Interfaz para el repositorio de Product
│   │   └── cart_repository.dart  # Interfaz para el repositorio de Cart
│   └── use_cases/
│       └── users/
│           └── get_users.dart  # Caso de uso para obtener los usuarios
│           └── create_user.dart  # Caso de uso para crear un usuario
│           └── delete_user.dart  # Caso de uso para eliminar un usuario
│           └── get_user.dart  # Caso de uso para obtener un usuario por ID
│           └── update_user.dart  # Caso de uso para actualizar un usuario
│       └── products/
│           └── get_products.dart  # Caso de uso para obtener productos
│           └── create_product.dart  # Caso de uso para crear un producto
│           └── delete_product.dart  # Caso de uso para eliminar un producto
│           └── get_product.dart  # Caso de uso para obtener un producto por ID
│           └── update_product.dart  # Caso de uso para actualizar un producto
│       └── carts/
│           └── get_carts.dart  # Caso de uso para obtener el carrito
│           └── create_cart.dart  # Caso de uso para crear un carrito
│           └── remove_from_cart.dart  # Caso de uso para eliminar productos del carrito
│           └── update_cart.dart  # Caso de uso para actualizar el carrito
│   └── presentation/
│       ├── blocs/
│       │   └── user_bloc.dart  # BLoC para manejar el estado de los usuarios
│       │   └── product_bloc.dart  # BLoC para manejar el estado de los productos
│       │   └── cart_bloc.dart  # BLoC para manejar el estado del carrito
│       ├── initializationbloc/
│       │   └── user_initialization.dart  # Inicialización del estado de User
│       │   └── cart_initialization.dart  # Inicialización del estado de Cart
│       │   └── product_initialization.dart  # Inicialización del estado de Product
│       └── main.dart  # Punto de entrada de la aplicación
├── test/
│   └── ...  # falta por implementar
└── README.md  # Documentación de la arquitectura del proyecto

```

## Descripción del Diseño de los Modelos de Datos

### Entidades
Las entidades representan los objetos del dominio y están definidas en el directorio `lib/domain/entities/`. Estas entidades contienen la lógica del negocio principal. Las principales entidades son:

- **User:** Representa a un usuario con atributos como ID, nombre, correo electrónico, etc.
- **Product:** Representa un producto con atributos como ID, nombre, precio, etc.
- **Cart:** Representa un carrito de compras con productos añadidos y su cantidad.

### Modelos
Los modelos están definidos en `lib/data/models/` y se encargan de la serialización/deserialización de datos entre la aplicación y la API. Por ejemplo, `UserModel` es el modelo que convierte datos JSON a la estructura `User` y viceversa.

### Mapeo de Modelos a Entidades
Cada vez que se recibe una respuesta de la API, los modelos se convierten a las entidades correspondientes usando un proceso de mapeo. Esta transformación asegura que las entidades de dominio permanezcan independientes de las implementaciones externas.

## Solicitudes y Procesamiento de la API

El proyecto realiza solicitudes HTTP a la API usando el `ApiClient`. Se definen las siguientes operaciones para cada entidad:

- **Usuarios:** Obtener usuarios, crear, actualizar, eliminar.
- **Productos:** Obtener productos, crear, actualizar, eliminar.
- **Carrito:** Obtener carrito, agregar o eliminar productos del carrito.

Cada repositorio implementa un método correspondiente para interactuar con la API y retorna un resultado utilizando la estructura `Either<Failure, T>` proporcionada por **dartz** para manejar errores y datos de forma funcional.

### Ejemplo de una solicitud para obtener productos:

```dart
final response = await apiClient.fetchList(
  ApiEndpoints.products,
  (data) => ProductModel.fromJson(data),
);
```

## Manejo de Errores con `Either`

Se usa la librería **dartz** para manejar errores de manera funcional. Los resultados de las solicitudes HTTP se envuelven en un tipo `Either<Failure, T>`, donde:

- **Left:** Representa un error de tipo `Failure`.
- **Right:** Representa un valor exitoso de tipo `T` (por ejemplo, una lista de productos o un usuario).

Esto permite que el control de flujo sea claro y que los errores se manejen de manera explícita en lugar de usar excepciones.


Espero que este `README.md` sea útil documente de forma clara y completa.
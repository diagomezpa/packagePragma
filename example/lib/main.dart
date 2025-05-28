import 'package:fake_maker_api_pragma_api/presentation/blocs/product_bloc.dart';
import 'package:fake_maker_api_pragma_api/presentation/initializationbloc/product_initialization.dart';
import 'package:flutter/material.dart';
// Importar product_initialization desde fake_maker_api_pragma_api
import 'package:fake_maker_api_pragma_api/fake_maker_api_pragma_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final ProductBloc productBloc;
  late final CartBloc cartBloc; // Inicializar cartBloc
  Product? _loadedProduct;
  final List<Product> _products = [];
  final List<Cart> _carts = []; // Lista para almacenar los carritos

  @override
  void initState() {
    super.initState();
    productBloc = initializeProductBloc((productOrProducts) {
      setState(() {
        if (productOrProducts is Product) {
          _loadedProduct = productOrProducts;
        } else if (productOrProducts is List<Product>) {
          _products.clear();
          _products.addAll(productOrProducts);
        } else if (productOrProducts is ProductDeleted) {
          _loadedProduct = productOrProducts.product; // Manejar producto eliminado
        }
      });
    });

    cartBloc = initializeCartBloc((cartState) {
      // Handle cart state changes here if needed
    }); // Inicializar cartBloc
    cartBloc.state.listen((state) {
      if (state is CartsLoaded) {
        setState(() {
          _carts.clear();
          _carts.addAll(state.carts); // Actualizar la lista de carritos
        });
      }
    });
  }

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _showModal(BuildContext context, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Modal'),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              child: const Text('Cerrar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _clearProduct() {
    setState(() {
      _loadedProduct = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_carts.isNotEmpty) ...[
              Expanded(
                child: ListView.builder(
                  itemCount: _carts.length,
                  itemBuilder: (context, index) {
                    final cart = _carts[index];
                    return ListTile(
                      title: Text('Cart ID: ${cart.id}'),
                      subtitle: Text('User ID: ${cart.userId}'),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _carts.clear(); // Clear carts and return to main menu
                  });
                },
                child: const Text('Volver'),
              ),
            ] else if (_loadedProduct != null) ...[
              Text('ID: ${_loadedProduct!.id}'),
              Text('Title: ${_loadedProduct!.title}'),
              Text('Price: ${_loadedProduct!.price}'),
              Text('Category: ${_loadedProduct!.category}'),
              Image.network(
                  _loadedProduct!.image,
                  width: MediaQuery.of(context).size.width * 0.6, // Limitar ancho al 60% de la pantalla
                  fit: BoxFit.contain, // Mantener proporciones
                ),
              ElevatedButton(
                onPressed: _clearProduct,
                child: const Text('Volver a los números'),
              ),
            ] else if (_products.isNotEmpty) ...[
              Expanded(
              child: ListView.builder(
                itemCount: _products.length,
                itemBuilder: (context, index) {
                final product = _products[index];
                return ListTile(
                  title: Text(product.title),
                  subtitle: Text('Price: ${product.price}'),
                  leading: Image.network(product.image),
                );
                },
              ),
              ),
              ElevatedButton(
              onPressed: () {
                setState(() {
                _products.clear(); // Clear products and return to main menu
                });
              },
              child: const Text('Volver'),
              ),
            ] else ...[
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(9, (index) {
                      final optionDescriptions = [
                        'Opción 1: Cargar un producto 1',
                        'Opción 2: Cargar todos los productos',
                        'Opción 3: Eliminar producto 1',
                        'Opción 4: Crear producto 1',
                        'Opción 5: Cargar carritos',
                        'Opción 6: Cargar carrito 1',
                        'Opción 7: Eliminar carrito 1',
                        'Opción 8: Crear carrito',
                        'Opción 9: Actualizar carrito 1',
                      ];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: InkWell(
                          onTap: () {
                            if (index == 0) { // cargar un producto 1
                              productBloc.eventSink.add(LoadProduct(1));
                            }
                            if (index == 1) { // cargar todos los productos
                              productBloc.eventSink.add(LoadProducts());
                            }
                            if (index == 2) { // eliminar producto 1
                              productBloc.eventSink.add(DeleteProductEvent(1));
                            }
                            if (index == 3) { // crear producto 1
                              productBloc.eventSink.add(CreateProductEvent(Product(
                                id: 0,
                                title: 'prueba',
                                description: 'producto de prueba',
                                category: Category.ELECTRONICS,
                                image: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
                                rating: Rating(rate: 1, count: 2),
                                price: 100,
                              )));
                            }
                            if (index == 4) { // cargar carritos 
                              cartBloc.eventSink.add(LoadCartsEvent());
                              cartBloc.state.listen((state) {
                                if (state is CartsLoaded) {
                                  setState(() {
                                    _carts.clear();
                                    _carts.addAll(state.carts);
                                  });
                                }
                              });
                            }
                            if (index == 5) { // cargar carrito
                              cartBloc.eventSink.add(LoadCartEvent(1));
                              cartBloc.state.listen((state) {
                                if (state is CartLoaded) {
                                  final cart = state.cart;
                                  setState(() {
                                    _carts.clear();
                                    _carts.add(cart);
                                  });
                                }
                              });
                            }
                            if (index == 6) { // eliminar carrito
                              cartBloc.eventSink.add(DeleteCartEvent(1));
                              cartBloc.state.listen((state) {
                                if (state is CartDeleted) {
                                  final cart = state.cart;
                                  setState(() {
                                    _carts.clear();
                                    _carts.add(cart);
                                  });
                                }
                              });
                            }
                            if (index == 7) { // crear carrito
                              cartBloc.eventSink.add(CreateCartEvent(Cart(
                                id: 5,
                                userId: 5,
                                date: DateTime.now(),
                                products: [],
                              )));
                              cartBloc.state.listen((state) {
                                if (state is CartCreated) {
                                  final cart = state.cart;
                                  setState(() {
                                    _carts.clear();
                                    _carts.add(cart);
                                  });
                                }
                              });
                            }
                            if (index == 8) { // actualizar carrito
                              cartBloc.eventSink.add(UpdateCartEvent(1));
                              cartBloc.state.listen((state) {
                                if (state is CartUpdated) {
                                  final cart = state.cart;
                                  setState(() {
                                    _carts.clear();
                                    _carts.add(cart);
                                  });
                                }
                              });
                            }
                          },
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Text(
                                      optionDescriptions[index],
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text('Tap to perform action'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

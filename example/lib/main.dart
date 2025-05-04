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
  Product? _loadedProduct;
  final List<Product> _products = [];

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
        }
      });
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
            if (_loadedProduct != null) ...[
              Text('ID: ${_loadedProduct!.id}'),
              Text('Title: ${_loadedProduct!.title}'),
              Text('Price: ${_loadedProduct!.price}'),
              Text('Category: ${_loadedProduct!.category}'),
              Image.network(_loadedProduct!.image),
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
            ] else ...[
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                children: List.generate(9, (index) {
                  return Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (index == 0) { // cargar un producto 1
                          productBloc.eventSink.add(LoadProduct(1));
                        }
                        if (index == 1) { // cargar todos los productos
                          productBloc.eventSink.add(LoadProducts());
                        }
                        if (index == 2) { // eliminar producto 1
                          //productBloc.eventSink.add(DeleteProductEvent(1));
                          productBloc.eventSink.add(DeleteProductEvent(1));
                        }
                        if (index == 3) { // crear producto 1
                          //productBloc.eventSink.add(LoadProducts());
                          
                        }
                        if (index == 4) { // cargar carritos 
                          //productBloc.eventSink.add(LoadProducts());
                        }
                        if (index == 5) { // carrgar carrito
                          //productBloc.eventSink.add(LoadProducts());
                        }
                        if (index == 6) { // eliminar carrito
                          //productBloc.eventSink.add(LoadProducts());
                         // productBloc.eventSink.add(LoadProducts());
                        }
                        if (index == 7) { // crear carrito
                          //productBloc.eventSink.add(LoadProducts());
                        }
                        if (index == 8) { // actualizar carrito
                          //productBloc.eventSink.add(LoadProducts());
                        }
                        if (index == 9) { // cargar usuarios
                          //productBloc.eventSink.add(LoadProducts());
                        }
                        if (index == 10) { // cargar usuario
                          //productBloc.eventSink.add(LoadProducts());
                        }
                        if (index == 11) { // eliminar usuario
                          //productBloc.eventSink.add(LoadProducts());
                        }
                        if (index == 12) { // crear usuario
                          //productBloc.eventSink.add(LoadProducts());
                        }
                        

                        
                        // Acción al presionar otros botones
                      },
                      child: Text('${index + 1}'),
                    ),
                  );
                }),
              ),
            ],
          ],
        ),
      ),
   
    );
  }
}

// Ensure this import is present

import 'package:fake_maker_api_pragma_api/data/data_sources/api_client.dart';
import 'package:fake_maker_api_pragma_api/data/repositories/product_repository_impl.dart';
import 'package:fake_maker_api_pragma_api/domain/entities/product.dart';
import 'package:fake_maker_api_pragma_api/domain/use_cases/products/create_product.dart';
import 'package:fake_maker_api_pragma_api/domain/use_cases/products/delete_product.dart';
import 'package:fake_maker_api_pragma_api/domain/use_cases/products/get_product.dart';
import 'package:fake_maker_api_pragma_api/domain/use_cases/products/get_products.dart';
import 'package:fake_maker_api_pragma_api/domain/use_cases/products/update_product.dart';
import 'package:fake_maker_api_pragma_api/presentation/blocs/product_bloc.dart';
import 'package:flutter/material.dart';

typedef ProductLoadedCallback = void Function(dynamic productOrProducts);

ProductBloc initializeProductBloc(ProductLoadedCallback onProductLoaded) {
  int titleWidth = 16; // Default width
  int priceWidth = 8; // Default width
  int imageWidth = 16; // Default width
  int categoryWidth = 16; // Default width

  final productRepository = ProductRepositoryImpl(apiClient: ApiClient());
  final getProduct = GetProduct(productRepository);
  final getProducts = GetProducts(productRepository);
  final createProduct = CreateProduct(productRepository);
  final deleteProduct = DeleteProduct(productRepository);
  final updateProduct = UpdateProduct(productRepository, getProduct);
  final productBloc = ProductBloc(
      getProduct, getProducts, createProduct, deleteProduct, updateProduct);


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
  productBloc.state.listen((state) {
    if (state is ProductLoading) {
      print('Loading product...');
    } else if (state is ProductsLoaded) {
      
      onProductLoaded(state.products);
    } else if (state is ProductLoaded) {
      onProductLoaded(state.product);
    } else if (state is ProductCreated) {
      onProductLoaded(state.product); 
     // Llamar al callback con el producto creado
    } else if (state is ProductDeleted) {
      onProductLoaded(state.product); // Llamar al callback con el producto eliminado
    } else if (state is ProductUpdated) {
    } else if (state is ProductError) {}
  });

  return productBloc;
}

import 'package:fake_maker_api_pragma_api/data/data_sources/api_client.dart';
import 'package:fake_maker_api_pragma_api/data/repositories/cart_repository_impl.dart';
import 'package:fake_maker_api_pragma_api/domain/use_cases/carts/create_cart.dart';
import 'package:fake_maker_api_pragma_api/domain/use_cases/carts/delete_cart.dart';
import 'package:fake_maker_api_pragma_api/domain/use_cases/carts/get_cart.dart';
import 'package:fake_maker_api_pragma_api/domain/use_cases/carts/get_carts.dart';
import 'package:fake_maker_api_pragma_api/domain/use_cases/carts/update_cart.dart';
import 'package:fake_maker_api_pragma_api/presentation/blocs/cart_bloc.dart';


typedef CartLoadedCallback = void Function(dynamic cartOrCarts);

CartBloc initializeCartBloc( CartLoadedCallback onCartLoaded) {
  int userIdWidth = 8;
  int dateWidth = 8;
  int productsWidth = 8;
  final cartRepository = CartRepositoryImpl(apiClient: ApiClient());
  final getCarts = GetCarts(cartRepository);
  final getCart = GetCart(cartRepository);
  final deleteCart = DeleteCart(cartRepository);
  final createCart = CreateCart(cartRepository);
  final updateCart = UpdateCart(cartRepository, getCart);



  final cartBloc =
      CartBloc(getCarts, getCart, deleteCart, createCart, updateCart);

  cartBloc.state.listen((state) {
    if (state is CartLoading) {
      print('Loading carts...');
    } else if (state is CartLoaded) {
      
      onCartLoaded(state.cart);
    } else if (state is CartsLoaded) {
      
    onCartLoaded(state.carts);

    } else if (state is CartDeleted) {
      
      onCartLoaded(state.cart);
    } else if (state is CartCreated) {
      
      onCartLoaded(state.cart);
    } else if (state is CartUpdated) {
     
      onCartLoaded(state.cart);
    } else if (state is CartError) {
      print('Error: ${state.message}');
    }
  });

  return cartBloc;
}

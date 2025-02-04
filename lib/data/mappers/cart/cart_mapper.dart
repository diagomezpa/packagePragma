import 'package:fake_maker_api_pragma_api/data/mappers/cart/products_mapper.dart';
import 'package:fake_maker_api_pragma_api/data/models/cart/cart_model.dart';
import 'package:fake_maker_api_pragma_api/data/models/cart/products_model.dart';
import 'package:fake_maker_api_pragma_api/domain/entities/cart.dart';

class CartMapper {
  static Cart toEntity(CartModel model) {
    return Cart(
      id: model.id,
      userId: model.userId,
      date: model.date,
      products: model.products?.map((e) => ProductsMapper.toEntity(e)).toList(),
    );
  }

  static Map<String, dynamic> toJson(Cart cart) {
    return {
      "id": cart.id,
      "userId": cart.userId,
      "date": cart.date?.toIso8601String(),
      "products": cart.products != null
          ? List<dynamic>.from(cart.products!.map((x) =>
              ProductsModel(productId: x.productId, quantity: x.quantity)
                  .toJson()))
          : null,
    };
  }
}

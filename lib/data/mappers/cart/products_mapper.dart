import 'package:fake_maker_api_pragma_api/data/models/cart/products_model.dart';
import 'package:fake_maker_api_pragma_api/domain/entities/cart.dart';

class ProductsMapper {
  static Products toEntity(ProductsModel model) {
    return Products(
      productId: model.productId,
      quantity: model.quantity,
    );
  }
}

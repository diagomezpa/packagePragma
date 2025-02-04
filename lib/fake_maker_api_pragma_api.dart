library fake_maker_api_pragma_api;

export 'data/models/cart/products_model.dart';
export 'data/models/cart/cart_model.dart';
export 'data/models/user/name_model.dart';
export 'data/models/user/address_model.dart';

export 'data/models/user/geolocation_model.dart';
export 'data/models/user/user_model.dart';
export 'data/models/user/address_model.dart';
export 'data/models/user/name_model.dart';

export 'data/models/product/product_model.dart';
export 'data/models/product/rating_model.dart';

export 'data/enum/enum_values.dart';
export 'data/data_sources/api_client.dart';
export 'data/data_sources/api_endpoints.dart';

export 'data/mappers/cart/cart_mapper.dart';
export 'data/mappers/cart/products_mapper.dart';
export 'data/mappers/user/address_mapper.dart';
export 'data/mappers/user/geolocation_mapper.dart';
export 'data/mappers/user/name_mapper.dart';
export 'data/mappers/user/user_mapper.dart';
export 'data/mappers/product/product_mapper.dart';

export 'data/repositories/cart_repository_impl.dart';
export 'data/repositories/user_repository_impl.dart';
export 'data/repositories/product_repository_impl.dart';

// domain
export 'domain/entities/cart.dart';
export 'domain/entities/user.dart';
export 'domain/entities/product.dart';

export 'domain/repositories/cart_repository.dart';
export 'domain/repositories/user_repository.dart';
export 'domain/repositories/product_repository.dart';

export 'domain/use_cases/carts/create_cart.dart';
export 'domain/use_cases/carts/delete_cart.dart';
export 'domain/use_cases/carts/get_cart.dart';
export 'domain/use_cases/carts/get_carts.dart';
export 'domain/use_cases/carts/update_cart.dart';

export 'domain/use_cases/users/create_user.dart';
export 'domain/use_cases/users/delete_user.dart';
export 'domain/use_cases/users/get_user.dart';
export 'domain/use_cases/users/get_users.dart';
export 'domain/use_cases/users/update_user.dart';

export 'domain/use_cases/products/create_product.dart';
export 'domain/use_cases/products/delete_product.dart';
export 'domain/use_cases/products/get_product.dart';
export 'domain/use_cases/products/get_products.dart';
export 'domain/use_cases/products/update_product.dart';

// presentation

export 'presentation/blocs/cart_bloc.dart';
export 'presentation/blocs/user_bloc.dart';
export 'presentation/blocs/product_bloc.dart';

export 'presentation/initializationbloc/cart_ser_initialization.dart';
export 'presentation/initializationbloc/product_initialization.dart';
export 'presentation/initializationbloc/user_initialization.dart';

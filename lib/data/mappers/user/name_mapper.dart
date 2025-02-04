import 'package:fake_maker_api_pragma_api/data/models/user/name_model.dart';
import 'package:fake_maker_api_pragma_api/domain/entities/user.dart';

class NameMapper {
  static Name toEntity(NameModel model) {
    return Name(
      firstname: model.firstname,
      lastname: model.lastname,
    );
  }

  static NameModel toModel(Name entity) {
    return NameModel(
      firstname: entity.firstname,
      lastname: entity.lastname,
    );
  }

  static Map<String, dynamic> toJson(Name entity) {
    return {
      'firstname': entity.firstname,
      'lastname': entity.lastname,
    };
  }
}

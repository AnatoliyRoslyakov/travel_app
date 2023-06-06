// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

enum Routes {
  detail,
  home,
  welcom;

  static Routes? fromName(String? name) {
    return Routes.values.firstWhereOrNull(
      (Routes element) => element.name == name,
    );
  }
}

extension MobileRoutesExt on Routes {
  String get path => '/$name';
}

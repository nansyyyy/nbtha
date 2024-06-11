import 'package:application5/language/ar.dart';
import 'package:application5/language/en.dart';
import 'package:application5/uttils/string.dart';
import 'package:get/get.dart';

class Localization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ene: en,
        ara: ar,
      };
}

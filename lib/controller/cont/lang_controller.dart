import 'package:application5/uttils/string.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageController extends GetxController {
  GetStorage storage = GetStorage();
  var langLocal = ene;

  @override
  void onInit() {
    super.onInit();
    langLocal = storage.read("l") ?? ene;
  }

  void saveLanguage(String lang) {
    storage.write("l", lang);
    langLocal = lang;
    update();
  }

  void changeLanguage(String typeLang) {
    saveLanguage(typeLang);
    update();
  }
}

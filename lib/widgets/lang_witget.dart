import 'package:application5/controller/cont/lang_controller.dart';
import 'package:application5/uttils/string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageWidget extends StatelessWidget {
  LanguageWidget({super.key});

  final controller = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageController>(
        init: LanguageController(),
        builder: (_) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Language".tr,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Container(
                width: 120,
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(
                      color: Colors.black,
                    )),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                      borderRadius: BorderRadius.circular(13),
                      iconSize: 25,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      items: [
                        DropdownMenuItem(
                            value: ene,
                            child: const Text(
                              "English",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            )),
                        DropdownMenuItem(
                            value: ara,
                            child: Text(
                              "Arabic".tr,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ))
                      ],
                      value: controller.langLocal,
                      onChanged: (value) {
                        controller.changeLanguage(value!);
                        Get.updateLocale(Locale(value));
                      }),
                ),
              )
            ],
          );
        });
  }
}

import 'package:application5/controller/cont/cycleController.dart';
import 'package:application5/pages/cycle&tips/cycle_Cat.dart';
import 'package:application5/widgets/tips_info/cycleCatWidget.dart';
import 'package:application5/widgets/heading_with_back.dart';
import 'package:application5/widgets/myDrawer.dart';
import 'package:application5/widgets/topArticlesWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AgryCycle extends StatelessWidget {
  AgryCycle({super.key});

  final controller = Get.put(CycleController());

  @override
  Widget build(BuildContext context) {
    // controller.getAgricycles();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF1FCF3),
      ),
      drawer: const Mydrawer(),
      body: Container(
        color: const Color(0xffF1FCF3),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeadingWithBack(title: "AgriTips", fontFamily: "WorkSans"),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                   
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CycleCatWidget(
                            image: "images/CycleVegatables.png",
                            title: "Vegetable",
                            onTap: () {
                              Get.to(CategoryPage(category: "Vegatables"));
                            },
                          ),
                          CycleCatWidget(
                            image: "images/CycleLegumes.png",
                            title: "Legumes",
                            onTap: () {
                              Get.to(CategoryPage(category: "Legumes"));
                            },
                          ),
                          CycleCatWidget(
                            image: "images/CycleHerbs.png",
                            title: "Herbs",
                            onTap: () {
                               Get.to(CategoryPage(category: "Herbs"));
                            },
                          ),
                          CycleCatWidget(
                            image: "images/CycleFlowers.png",
                            title: "Flowers",
                            onTap: () {
                               Get.to(CategoryPage(category: "Flowers"));
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 35),
                      child: const Text(
                        "Top Articles",
                        style: TextStyle(
                          color: Color(0xff1A7431),
                          fontFamily: "WorkSans",
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Container(
                      height: 310,
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0xffEDEDED),
                          ),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const [
                            BoxShadow(
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: Offset(0, 0),
                                color: Colors.black26)
                          ]),
                      child: Obx(() {
                        return ListView.builder(
                            itemCount: controller.topArticlesList.length,
                            itemBuilder: (constex, i) {
                              return TopArticleWidget(
                            
                                name: "${controller.topArticlesList[i]["name"]}",
                              
                                article:
                                    '${controller.topArticlesList[i]["article"]}',
                               
                              );
                            });
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

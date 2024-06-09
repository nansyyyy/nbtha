import 'package:application5/controller/cont/cart_controller.dart';
import 'package:application5/model/productModel.dart';
import 'package:application5/pages/agriMarket/product_details2.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductItemsWidget extends StatelessWidget {
  ProductItemsWidget({
    super.key,
    required this.img,
    required this.name,
    required this.price,
  });

  final String img;
  final String name;
  final String price;
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(ProductDetails(
          img: img,
          name:
              name ,
              price: price,        ));
      },
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xffD9D9D9), width: 1),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 7,
              offset: const Offset(0, 3),
              spreadRadius: 0,
              color: Colors.grey.withOpacity(.2),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: NetworkImage(img),
                ),
              ),
            ),
            Text(
              name,
              textAlign: TextAlign.start,
              maxLines: 1,
              style: GoogleFonts.workSans(
                color: const Color.fromRGBO(30, 155, 61, 1),
                fontSize: 18,
                letterSpacing: -2.24,
                fontWeight: FontWeight.w400,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "EGP $price",
                  style: GoogleFonts.workSans(
                    color: const Color.fromRGBO(30, 155, 61, 1),
                    fontSize: 18,
                    letterSpacing: -2.24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                InkWell(
                  onTap: () {
                    final product = CartItem(
                      quantity: 1,
                      name: name,
                      image: img,
                      price: double.parse(price),
                    );
                    cartController.addProduct(product);
                  },
                  child: const Icon(
                    Icons.add_box_outlined,
                    color: Color.fromRGBO(30, 155, 61, 1),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
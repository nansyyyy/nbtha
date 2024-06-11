// ignore_for_file: file_names

import 'package:application5/controller/cont/cycleController.dart';
// import 'package:application5/pages/cycle_Item_Info.dart';
import 'package:application5/pages/cycle&tips/topArticle_Item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';

class TopArticleWidget extends StatefulWidget {

  final String name;
  final String article;
  final String date;
  final String img;
  final String readtime;



  const TopArticleWidget({
    super.key,
 
    required this.name,

    required this.article, required this.date, required this.img, required this.readtime,

  });

  @override
  State<TopArticleWidget> createState() => _TopArticleWidgetState();
}

class _TopArticleWidgetState extends State<TopArticleWidget> {
  // late bool _isFavorite; // Declare _isFavorite without initialization
  final CycleController _controller = Get.find(); // Get CycleController instance

  @override
  void initState() {
    super.initState();
    // Initialize the initial favorite state
    // _isFavorite = widget.favorite; // Initialize _isFavorite with the initial favorite state from the widget
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(TopArticleItem(
    
          name: widget.name,
  
          article: widget.article,
           date: widget.date,
            img: widget.img,
             readtime: widget.readtime,
       
        ));
      },
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xffCAEDCF))),
        height: 62.29,
        child: Row(
          children: [
            Container(
              height: 52,
              width: 56,
              decoration: BoxDecoration(
                image:  DecorationImage(
                    image: NetworkImage(widget.img), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 200,
              child: Text(
                widget.name,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            // InkWell(
            //   onTap: () async {
            //     setState(() {
            //       _isFavorite = !_isFavorite; // Invert the favorite state
            //     });
            //     await _controller.toggleFavorite(widget.name, _isFavorite);
            //     // Other navigation or actions
            //   },
            //   child: Container(
            //     height: 10,
            //     width: 10,
            //     decoration: BoxDecoration(
            //         color: Colors.white,
            //         image: DecorationImage(
            //             image: _isFavorite
            //                 ? const AssetImage("images/Heart.png")
            //                 : const AssetImage("images/HeartSelecteed.png"))),
            //   ),

            // ),
            
          ],
        ),
      ),
    );
  }
}

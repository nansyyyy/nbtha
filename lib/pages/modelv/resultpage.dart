import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsPage extends StatelessWidget {
  final File image;
  final String results;

  ResultsPage({required this.image, required this.results});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(241, 252, 243, 1),
        toolbarHeight: 70,
      ),
      body: Column(
        children: [
          Container(
            color: const Color.fromRGBO(241, 252, 252, 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30, top: 20),
                  child: Text(
                    "NBTAH Scan",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: "WorkSans",
                      color: Color(0xff1A7431),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.only(left: 40),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15),
                      Text(
                        "    Plant Detection",
                        style: GoogleFonts.workSans(
                          textStyle: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 0.66),
                            fontSize: 23,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Stack(
                        children:<Widget> [
                          Center(
                            child: Container(
                              width: 407,
                              height:350 ,
                            
                              child: Image.asset("images/frame1.jpeg",  fit: BoxFit.fill),
                            ),
                          ),
                         
                           Padding(
                             padding: const EdgeInsets.all(20.0),
                             child: Center(
                                                     child: Image.file(
                                                       
                                                       image,
                                                       width: 368,
                                                       height: 308,
                                                       fit: BoxFit.fill,
                                                     ),
                                                   ),
                           ),
                          
                         

                      ]  ),
                      SizedBox(height: 20),
                      Center(
                        child: Container(
                          width: 380,
                          height:70,
                          // child: Padding(
                            padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(15),
                                            border:Border.all(color: Color.fromRGBO(202, 237, 207, 1),width: 3)),
                            child: Center(
                              child: Text(
                                results,
                                style: GoogleFonts.workSans(
                                  textStyle: const TextStyle(
                                    color: Color.fromRGBO(26, 116, 49, 1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ),
                        Container(
                          width: 366,
                          height: 52,

                        ),
                    InkWell(
                      onTap: (){

                      },
                      child: Center(child: Container(
                        height: 60,
                        width: 366,
                        decoration: BoxDecoration(color: Color.fromRGBO(30, 155, 61, 1),
                        borderRadius: BorderRadius.circular(15)),
                        child: Center(child: Text("For More Information About Mint",
                        style: GoogleFonts.workSans(
                          textStyle:TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                          )
                        ),))
                      )),
                    )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

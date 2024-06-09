// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.lable,  this.onPressed});
  final String lable;
  // final double width;
  // final double height;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
                onPressed: onPressed,
                color: Color(0xff1A7431),
              
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                      child: Text(
                  lable,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: "WorkSans"
                  ),
                ),
                  
                // height: height,
                // minWidth: width,
              
            );
  }
}
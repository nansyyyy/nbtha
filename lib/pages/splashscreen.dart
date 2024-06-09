import 'package:application5/controller/constant/imgs.dart';
import 'package:application5/pages/bottom_Bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:type_text/type_text.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool firstAnimationCompleted = false;
  bool secondAnimationCompleted = false;
  bool textAnimationCompleted = false;

  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Future.delayed(const Duration(milliseconds: 5324), () {
          Navigator.of(context).pushReplacementNamed("onBoarding");
        });
      } else {
        Future.delayed(const Duration(milliseconds: 5324), () {
          Get.off(BottomBar(selectedIndex: 0));
        });
      }
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1FCF3),
      body: Stack(
        children: <Widget>[
          if (!firstAnimationCompleted)
            Center(
              child: BounceInUp(
                animate: true,
                from: 500,
                duration: const Duration(seconds: 3),
                child: const Image(
                  image: AssetImage(logo),
                  width: 90,
                  height: 90,
                ),
                onFinish: (direction) {
                  setState(() {
                    firstAnimationCompleted = true;
                  });
                },
              ),
            ),
          if (firstAnimationCompleted) ...[
            AnimatedPositioned(
              duration: const Duration(seconds: 1),
              left: 138,
              top: MediaQuery.of(context).size.height / 2 - 24,
              child: Text("NB",
                  style: GoogleFonts.lexendDeca(
                      textStyle: const TextStyle(
                          fontSize: 40,
                          color: Color.fromRGBO(27, 96, 45, 1),
                          fontWeight: FontWeight.w600))),
              onEnd: () {
                setState(() {
                  textAnimationCompleted = true;
                });
              },
            ),
          ],
          if (firstAnimationCompleted && !secondAnimationCompleted) ...[
            AnimatedPositioned(
              duration: const Duration(seconds: 0),
              curve: Curves.easeInOut,
              left: 30,
              top: MediaQuery.of(context).size.height / 2 -
                  45, // Center vertically
              child: const Image(
                image: AssetImage(logo),
                width: 90,
                height: 90,
              ),
              onEnd: () {
                setState(() {
                  secondAnimationCompleted = true;
                });
              },
            ),
            if (firstAnimationCompleted &&
                !secondAnimationCompleted &&
                !textAnimationCompleted) ...[
              AnimatedPositioned(
                left: 200,
                top: MediaQuery.of(context).size.height / 2 - 22,
                duration: const Duration(seconds: 1),
                child: TypeText(
                  "TAH",
                  duration: const Duration(seconds: 1),
                  style: const TextStyle(
                      fontSize: 40,
                      color: Color.fromRGBO(44, 187, 80, 1),
                      fontWeight: FontWeight.w600),
                  onType: (progress) {
                    setState(() {});
                  },
                ),
              )
            ]
          ]
        ],
      ),
    );
  }
}

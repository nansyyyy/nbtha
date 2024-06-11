// ignore_for_file: prefer_const_constructors
import 'package:application5/controller/cont/cart_controller.dart';
import 'package:application5/language/lang.dart';
import 'package:application5/pages/agriMarket/MyOrderss.dart';
import 'package:application5/pages/agriMarket/Payment_Page.dart';
import 'package:application5/pages/Porfile_Page2.dart';
import 'package:application5/pages/agriMarket/Shipping_Process.dart';
import 'package:application5/pages/agriMarket/cart_page.dart';
import 'package:application5/pages/agriMarket/checkout.dart';
import 'package:application5/pages/agriMarket/empty_cart.dart';
import 'package:application5/pages/community/communityhome.dart';
import 'package:application5/pages/account/login.dart';
import 'package:application5/pages/onboarding.dart';
import 'package:application5/pages/scan.dart';
import 'package:application5/pages/account/signup.dart';
import 'package:application5/pages/splashscreen.dart';
import 'package:application5/pages/agriMarket/store.dart';
import 'package:application5/pages/agriMarket/success_page.dart';
import 'package:application5/uttils/string.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
   await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // name: "flutterapplication4-2d098",
      options: const FirebaseOptions(
          apiKey: "AIzaSyDPVSJbwS4GpdmC1nsYDdT7Puv71DQs5Rw",
          appId: "1:1028160968707:android:af85f262e79b630bb39636",
          messagingSenderId: "1028160968707",
          storageBucket: "application5-3bcfb.appspot.com",
          projectId: "application5-3bcfb")
          );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      home: SplashScreen(),

      
      locale: Locale(GetStorage().read<String>("l").toString()),
      translations: Localization(),
      fallbackLocale: Locale(ene),

      // BottomBar(selectedIndex: 0,),
      // FirebaseAuth.instance.currentUser != null &&
      //         FirebaseAuth.instance.currentUser!.emailVerified
      //     ? BottomBar(),
      //     : SplashScreen(),
      routes:{
        "porfile2": (context) => Porfile_Page2(),
        "login":(context) => LoginPage(),
        "SignUp": (context) => SignUp(),
        "store":(context) =>  Store(),
         "Scanpage":(context) => ScanPage(),
        "communitypage":(context) => CommunityHome(members: '',),
        "paymentpage2":(context) => PaymentPage2(),
         "splash":(context) => SplashScreen(),
          "onBoarding":(context)=> OnBoarding(),
          "cartpage":(context)=> CartPage(),
          "checkout":(context)=> checkout(),
          "successpage":(context)=> PaymentSuccessPage(),
          "Shipping_Process":(context)=> Shipping_Process(),
          "Empty_Cart":(context)=>Empty_Cart(),
          "communtiy":(context) => CommunityHome(members: '',),
          "myorders":(context) =>MyOrderss(),
      },
      initialBinding: BindingsBuilder(() {
        Get.put(CartController());
      }),
      debugShowCheckedModeBanner: false,
    );
  }
}

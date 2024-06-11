import 'package:application5/pages/account/editprofile_Page.dart';
import 'package:application5/pages/homepage.dart';
import 'package:application5/pages/account/login.dart';
import 'package:application5/pages/privacy.dart';
import 'package:application5/widgets/lang_witget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  void signOutFromApp() async {
    try {
      await auth.signOut();
      await googleSignIn.signOut();
      Get.off(const LoginPage(), arguments: (route) => false);
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 30,
          ),
          const Row(
            children: [
              Text(
                " Nab",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff184F27)),
              ),
              Text(
                "Ta",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff2CBB50)),
              ),
            ],
          ),
          Container(
            height: 50,
          ),
          ListTile(
            leading: Image.asset(
              "images/IconNotification.png",
              height: 30,
            ),
            title:  Text(
              'Notifications'.tr,
              style: TextStyle(
                color: Color(0xff184F27),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {},
          ),
         
          // ListTile(
          //   leading: Image.asset(
          //     "images/IconLanguage.png",
          //     height: 30,
          //   ),
          //   title: const Text(
          //     'Language',
          //     style: TextStyle(
          //       color: Color(0xff184F27),
          //       fontSize: 20,
          //       fontWeight: FontWeight.w500,
          //     ),
          //   ),
          //   onTap: () {},
          // ),

          LanguageWidget(),
          ListTile(
            leading: Image.asset(
              "images/IconSecurity.png",
              height: 30,
            ),
            title:  Text(
              'Privacy and Security'.tr,
              style: TextStyle(
                color: Color(0xff184F27),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              Get.to(PrivacySecurityPage());
            },
          ),
          ListTile(
            leading: Image.asset(
              "images/IconHelp.png",
              height: 30,
            ),
            title:  Text(
              'Help & Support'.tr,
              style: TextStyle(
                color: Color(0xff184F27),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Image.asset(
              "images/IconAboutapp.png",
              height: 30,
            ),
            title: Text(
              'About App'.tr,
              style: TextStyle(
                color: Color(0xff184F27),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {},
          ),
          const Spacer(),
          ListTile(
            leading: Image.asset("images/logout.png"),
            title: Text(
              'Logout'.tr,
              style: TextStyle(
                color: const Color(0xff184F27),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              signOutFromApp();
            },
          ),
        ],
      ),
    );
  }
}

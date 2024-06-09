// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';

class cont_chat extends StatelessWidget {
  final String text1;
  final String Image;
  const cont_chat({super.key, required this.text1, required this.Image});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('images/$Image'),
            ),
            Container(
              height: 165,
              width: 310,
              padding: const EdgeInsets.all(7),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(text1),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
class text_field extends StatelessWidget {
  const text_field({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(15, 113, 115,1))),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(39, 41, 50, 1))),
        ),
      ),
    );
  }
}

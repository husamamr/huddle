import 'package:flutter/material.dart';
class text_field extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obsecureText;

  const text_field({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obsecureText,

}) ;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller ,
        obscureText: obsecureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(15, 113, 115,1))),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(39, 41, 50, 1))),
          hintText: hintText,
        ),
      ),
    );
  }
}

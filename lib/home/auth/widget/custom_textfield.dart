// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget{
  String hin;
  IconData icons;
  TextEditingController controllers;
  CustomTextfield({
    required this.hin,
    required this.icons,
    required this.controllers,
  });
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: 400,height: 50,
        decoration: BoxDecoration(
          color: const Color.fromARGB(69, 187, 187, 187),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 5),
          child: TextField(
            controller: controllers,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hin, 
              prefixIcon: Icon(icons),
            ),
          ),
        ),
      ),
    );
  }
}

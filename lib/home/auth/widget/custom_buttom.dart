// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class CustomButtom extends StatelessWidget {
  String title;
  VoidCallback? onTap;
  Color? colors;
  CustomButtom({
    Key? key,
    required this.title,
    this.onTap,
    this.colors,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity, height: 50, 
        decoration: BoxDecoration(color: colors,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(child: Text(title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),),
      ),
    );
  }
}

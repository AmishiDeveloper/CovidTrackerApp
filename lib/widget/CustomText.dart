import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final FontWeight weight;
  final double size;
  final TextAlign align;
  final Color color;

  CustomText({Key? key,required this.text,this.weight=FontWeight.bold,this.size=20,this.align=TextAlign.center,this.color=Colors.white}) : super(key: key);
    @override
    Widget build(BuildContext context)
    {
      return Text(
        text,
        style: TextStyle(
          fontWeight: weight,
          fontSize: size,
          color: color,
        ),
        textAlign: align,
      );
    }
}


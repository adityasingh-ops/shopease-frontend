import 'package:flutter/material.dart';

class ReusableText2 extends StatelessWidget {
  const ReusableText2({super.key,required this.text,required this.style});
  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
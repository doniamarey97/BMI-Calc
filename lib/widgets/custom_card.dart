import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      required this.image,
      required this.text,
      this.color,
      required this.borderColor});
  final String image;
  final String text;
  final Color? color;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            width:2.5 ,
            color: borderColor)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(image),
            height: 130,
            width: 90,
          ),
          Text(
            text,
            style: const TextStyle(fontFamily: 'Raleway', fontSize: 20),
          ),
        ],
      ),
    );
  }
}

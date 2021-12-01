import 'package:flutter/material.dart';



class DataContainer extends StatelessWidget {
  const DataContainer({
    Key? key,
    required this.title,
    required this.icon,
    required this.size,
  }) : super(key: key);

  final Size size;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: size.height * 0.129,
          color: Colors.white,
        ),
        Text(title,
            style: TextStyle(
                fontSize: size.height * 0.03,
                color: Colors.white70,
                fontWeight: FontWeight.bold))
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';

class ContainerBox extends StatelessWidget {
  final Widget childWidget;
  final Color color;
  ContainerBox({required this.color,required this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: childWidget,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color:color),
    );
  }
}

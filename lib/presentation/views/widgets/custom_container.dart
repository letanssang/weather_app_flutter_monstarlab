import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final EdgeInsetsGeometry? margin;
  const CustomContainer(
      {Key? key, required this.child, this.height, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xFF298AC1)),
      padding: const EdgeInsets.all(16),
      margin: margin ?? const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: child,
    );
  }
}

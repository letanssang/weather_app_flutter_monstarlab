import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  const CustomContainer(
      {Key? key,
      required this.child,
      this.height,
      this.margin,
      this.color,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          boxShadow: const [],
          borderRadius: BorderRadius.circular(16),
          color: color ?? const Color(0xFF201F89)),
      padding: padding ?? const EdgeInsets.all(16),
      margin: margin ?? const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: child,
    );
  }
}

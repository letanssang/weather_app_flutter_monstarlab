import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      padding: padding ?? EdgeInsets.all(ScreenUtil().setWidth(16)),
      margin: margin ??
          EdgeInsets.symmetric(
              vertical: ScreenUtil().setHeight(5),
              horizontal: ScreenUtil().setWidth(5)),
      child: child,
    );
  }
}

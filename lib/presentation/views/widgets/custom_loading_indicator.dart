import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SpinKitWave(
      size: ScreenUtil().setHeight(30),
      itemBuilder: (BuildContext context, int index) {
        final colors = [
          Colors.cyan[200],
          Colors.cyan[400],
          Colors.cyan[600],
          Colors.cyan[800],
          Colors.cyan[1000],
        ];
        return DecoratedBox(
          decoration: BoxDecoration(
            color: colors[index % colors.length],
            borderRadius: BorderRadius.circular(ScreenUtil().setHeight(8)),
          ),
        );
      },
    );
  }
}

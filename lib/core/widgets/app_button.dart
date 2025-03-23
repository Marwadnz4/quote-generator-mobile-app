import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final Color? backgroundColor;
  final VoidCallback onPressed;
  final Widget child;
  final BorderRadiusGeometry borderRadius;
  final Color borderColor;

  const AppButton({
    super.key,
    this.backgroundColor,
    required this.onPressed,
    required this.borderRadius,
    required this.child,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
          side: BorderSide(color: borderColor),
        ),
        backgroundColor: backgroundColor ?? Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
        fixedSize: Size(double.maxFinite, 60.h),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}

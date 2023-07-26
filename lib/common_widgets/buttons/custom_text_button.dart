import 'package:flutter/material.dart';
import 'package:vets_project/core/theme/colors.dart';
import 'package:vets_project/core/theme/styles.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Color? color;
  final TextStyle? textStyle;
  final FontWeight? fontWeight;
  final double? size;

  final void Function() onpressed;
  const CustomTextButton(
      {Key? key,
      required this.text,
      required this.onpressed,
      this.color,
      this.textStyle,
      this.fontWeight,
      this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.only(top: 8),
        minimumSize: const Size(50, 30),
        tapTargetSize: MaterialTapTargetSize.padded,
        alignment: Alignment.topRight,
      ),
      onPressed: onpressed,
      child: Text(
        text,
        style: TextStyles.baseTextStyle.copyWith(
          color: color ?? kWhiteColor,
          fontWeight: fontWeight ?? FontWeight.w500,
          fontSize: size ?? 14,
        ),
      ),
    );
  }
}

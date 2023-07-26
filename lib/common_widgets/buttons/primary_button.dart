import 'package:flutter/material.dart';
import 'package:vets_project/core/global_use/size_config.dart';
import 'package:vets_project/core/theme/styles.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  final Color? color;
  final TextStyle? textStyle;

  const PrimaryButtonWidget({
    Key? key,
    required this.text,
    required this.onPress,
    this.color,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: SizeConfig().widht,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
         // backgroundColor: color ?? const Color.fromRGBO(77, 122, 188, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onPress,
        child: Text(
          text,
          style: textStyle ?? TextStyles.primaryButtonTextSTyle,
        ),
      ),
    );
  }
}

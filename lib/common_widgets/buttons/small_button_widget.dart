import 'package:flutter/material.dart';
import 'package:vets_project/core/global_use/size_config.dart';
import 'package:vets_project/core/theme/styles.dart';

class CustomSmallButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;

  const CustomSmallButton({Key? key, required this.text, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: SizeConfig().widht,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          // backgroundColor: kBlueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onPress,
        child: Text(
          text,
          style: TextStyles.primaryButtonTextSTyle,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vets_project/core/theme/styles.dart';

class CustomButton extends StatelessWidget {
  final String text;

  final VoidCallback onPress;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 56,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          //backgroundColor: kWhiteColor,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onPress,
        child: Text(
          text,
          style: TextStyles.primaryButtonDarkTextSTyle,
        ),
      ),
    );
  }
}

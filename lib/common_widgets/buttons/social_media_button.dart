import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vets_project/core/theme/colors.dart';
import 'package:vets_project/core/theme/styles.dart';

class SocialMediaButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  final String icon;
  final Color color;
  final Color textColor;
  final bool isesmall;

  const SocialMediaButton({
    Key? key,
    required this.text,
    required this.isesmall,
    required this.onPress,
    required this.icon,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 40,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          //backgroundColor: color,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: kLightWhite, width: 0.5),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onPress,
        child: Row(
          mainAxisAlignment:
              isesmall ? MainAxisAlignment.start : MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              fit: BoxFit.scaleDown,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                text,
                style: TextStyles.primaryButtonTextSTyle.copyWith(
                  color: textColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

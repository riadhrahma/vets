import 'package:flutter/material.dart';
import 'package:vets_project/core/theme/colors.dart';
import 'package:vets_project/core/theme/styles.dart';
import 'package:vets_project/core/values/constant_strings.dart';

class CustomCLientStatusCard extends StatelessWidget {
  const CustomCLientStatusCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 0,
        color: kLightPurpleColor,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 5,
            bottom: 5,
            left: 5,
            right: 5,
          ),
          child: Text(
            visitorText,
            style: TextStyles.smallTextStyle.copyWith(
              color: kPurpleColor,
            ),
          ),
        ),
      ),
    );
  }
}

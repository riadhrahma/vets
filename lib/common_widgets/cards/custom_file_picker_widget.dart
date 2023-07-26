import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vets_project/core/theme/colors.dart';
import 'package:vets_project/core/theme/styles.dart';

class CustomFilePickerWidget extends StatelessWidget {
  final String iconPath;
  final void Function() ontap;
  final String title;
  const CustomFilePickerWidget({
    super.key,
    required this.iconPath,
    required this.ontap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: ontap,
          child: SizedBox(
            height: 70,
            width: 70,
            child: Card(
              elevation: 0,
              color: const Color.fromRGBO(235, 237, 239, 1),
              shape: const CircleBorder(),
              child: Center(
                child: SvgPicture.asset(iconPath),
              ),
            ),
          ),
        ),
        Text(
          title,
          style: TextStyles.smallTextStyle.copyWith(
            color: kGreyCOlor,
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}

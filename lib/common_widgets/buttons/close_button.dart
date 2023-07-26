import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:vets_project/core/theme/app_assets.dart';

class CustomCloseButton extends StatelessWidget {
  final void Function() ontap;
  const CustomCloseButton({Key? key, required this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.canvas,
      elevation: 0,
      borderOnForeground: false,
      surfaceTintColor: Colors.transparent,
      child: InkWell(
        onTap: ontap,
        child: SvgPicture.asset(
          AppAssets.closeIcon,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}

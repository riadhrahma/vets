import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vets_project/core/theme/app_assets.dart';

class TakePhotoWidget extends StatelessWidget {
  final void Function() ontap;
  const TakePhotoWidget({Key? key, required this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: SizedBox(
        height: 30,
        width: 30,
        child: Card(
          color: const Color.fromRGBO(77, 122, 188, 1),
          elevation: 0,
          shape: const CircleBorder(),
          child: SvgPicture.asset(
            AppAssets.profileCamera,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vets_project/core/theme/app_assets.dart';
import 'package:vets_project/core/theme/styles.dart';

class PickFileWidget extends StatelessWidget {
  const PickFileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 70,
          width: 70,
          child: Card(
            elevation: 0,
            color: const Color.fromRGBO(
              235,
              237,
              239,
              1,
            ),
            shape: const CircleBorder(),
            child: Center(
              child: SvgPicture.asset(
                AppAssets.galleryIcon,
              ),
            ),
          ),
        ),
        Text(
          'Gallerie',
          style: TextStyles.smallTextStyle.copyWith(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: const Color.fromRGBO(
              53,
              73,
              97,
              1,
            ),
          ),
        )
      ],
    );
  }
}

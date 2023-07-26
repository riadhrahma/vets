import 'package:flutter/material.dart';
import 'package:vets_project/core/theme/app_assets.dart';
import 'package:vets_project/core/theme/colors.dart';

class GalleyPreviewWidget extends StatelessWidget {
  const GalleyPreviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(3.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        // border: Border.all(
        //   width: 1.5,
        //   color: kGreenColor,
        // ),
      ),
      child: Container(
        height: 120,
        width: 120,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              AppAssets.catImage,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Padding(
              padding: EdgeInsets.only(
                top: 5,
                right: 5,
              ),
              child: SizedBox(
                height: 22,
                width: 22,
                child: Card(
                  color: Colors.transparent,
                  elevation: 0,
                  shape: CircleBorder(
                    side: BorderSide(
                      width: 1,
                      color: kWhiteColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

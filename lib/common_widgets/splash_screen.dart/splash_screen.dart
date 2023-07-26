import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:vets_project/core/theme/app_assets.dart';
import 'package:vets_project/core/theme/colors.dart';
import 'package:vets_project/features/authentication/presentation/Views/get_started_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: const Image(
        image: AssetImage(AppAssets.logoIcon2),
      ),
      // title: const Text(
      //   'Tagamuta Valley',
      //   style: appBarTitle,
      // ),
      backgroundColor: kDarkCOlor,

      showLoader: true,
      loaderColor: kWhiteColor,
      navigator: const GetStartedScreen(),
      durationInSeconds: 4,
    );
  }
}

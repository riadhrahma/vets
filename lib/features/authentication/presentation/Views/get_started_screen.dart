import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vets_project/common_widgets/buttons/custom_primary_button.dart';
import 'package:vets_project/core/routes/routes.dart';
import 'package:vets_project/core/theme/app_assets.dart';
import 'package:vets_project/core/theme/colors.dart';
import 'package:vets_project/core/theme/styles.dart';
import 'package:vets_project/core/values/constant_strings.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kDarkCOlor,
      body: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            Image(
              height: height,
              width: width,
              fit: BoxFit.cover,
              image: const AssetImage(AppAssets.getStartedImage),
            ),
            Positioned(
              top: 40,
              left: 50,
              child: SvgPicture.asset(AppAssets.logoIcon),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 50.h, left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    child: Text(
                      sloganText,
                      style: TextStyles.sloganTextStyle,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                      bottom: 30,
                    ),
                    child: Text(
                      createAccountAndGetAccessText,
                      style: TextStyles.meduimTextSTyle,
                    ),
                  ),
                  CustomButton(
                    text: letsGoText,
                    onPress: () {
                      Navigator.pushNamed(
                        context,
                        Routes.registerMainScreen,
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

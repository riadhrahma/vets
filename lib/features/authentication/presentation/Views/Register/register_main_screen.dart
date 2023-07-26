import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vets_project/core/theme/app_assets.dart';
import 'package:vets_project/core/theme/colors.dart';
import 'package:vets_project/core/theme/doubles.dart';
import 'package:vets_project/core/theme/styles.dart';
import 'package:vets_project/core/values/constant_strings.dart';
import 'package:vets_project/features/authentication/presentation/Views/Register/signin/signin_screen.dart';
import 'package:vets_project/features/authentication/presentation/Views/Register/choose_role_screen.dart';

class RegisterMainScreen extends StatelessWidget {
  const RegisterMainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Stack(
            children: [
              Positioned(
                top: 12,
                left: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 0, right: 0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      AppAssets.closeIcon,
                      fit: BoxFit.scaleDown,
                      color: kLightWhite,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: TabBar(
                  isScrollable: false,
                  labelColor: kWhiteColor,
                  unselectedLabelColor: kLightWhite.withOpacity(0.7),
                  indicatorWeight: 1,
                  indicatorColor: kWhiteColor,
                  unselectedLabelStyle: const TextStyle(
                    fontSize: baseTextSize,
                    fontWeight: FontWeight.w500,
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: TextStyles.baseTextStyle.copyWith(
                    color: kWhiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                  tabs: const [
                    Tab(
                      text: loginText,
                    ),
                    Tab(
                      text: aNewAccountText,
                    ),
                  ],
                ),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          toolbarHeight: 85,
        ),
        backgroundColor: const Color.fromRGBO(13, 18, 24, 1),
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Column(
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 83),
              child: Divider(
                thickness: 0.2,
                color: kLightWhite,
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SigninScreen(),
                  ChooseRoleScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

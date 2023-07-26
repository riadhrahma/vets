import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vets_project/common_widgets/buttons/custom_text_button.dart';
import 'package:vets_project/common_widgets/buttons/primary_button.dart';
import 'package:vets_project/common_widgets/dividers/custom_divider.dart';
import 'package:vets_project/core/theme/app_assets.dart';
import 'package:vets_project/core/theme/colors.dart';
import 'package:vets_project/core/theme/styles.dart';
import 'package:vets_project/core/values/constant_strings.dart';
import 'package:vets_project/features/authentication/presentation/Widgets/custom_login_text_form_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(13, 18, 24, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            children: [
              SvgPicture.asset(AppAssets.lockIcon),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SvgPicture.asset(AppAssets.dashedIcon),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Center(
                  child: Text(
                    forgotPasswordText,
                    style:
                        TextStyles.largeTextStyle.copyWith(color: kWhiteColor),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32, right: 32),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Center(
                        child: Text(
                          aCodeHasBenSentToYourEmailText,
                          style: TextStyles.baseTextStyle.copyWith(
                              fontWeight: FontWeight.w300,
                              color: kLightWhite.withOpacity(0.7)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: CustomLoginFormField(
                        errorText: '',
                        onChanged: (value) {},
                        textInputType: TextInputType.emailAddress,
                        labelText: addressEmailText,
                        obscureText: false,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 190.h),
                      child: PrimaryButtonWidget(
                        text: sendText,
                        onPress: () {
                          showModalBottomSheet<void>(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: 550,
                                decoration: const BoxDecoration(
                                  color: kWhiteColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                  ),
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        width: 50,
                                        child: CustomDividerWidget(
                                          thikness: 2,
                                          color: kGreyCOlor.withOpacity(0.2),
                                        ),
                                      ),
                                      const Image(
                                        height: 270,
                                        width: 270,
                                        image: AssetImage(AppAssets.gifIcon),
                                      ),
                                      Text(
                                        "Vérifier votre courriel",
                                        style: TextStyles.largeTextStyle
                                            .copyWith(color: kGreyCOlor),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 45,
                                            right: 45,
                                            top: 20,
                                            bottom: 20),
                                        child: Text(
                                          "Nous avons un E-mail contenant les instructions.",
                                          style: TextStyles.largeTextStyle
                                              .copyWith(
                                            color: kGreyCOlor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      CustomTextButton(
                                        color: kBlueColor,
                                        size: 18,
                                        fontWeight: FontWeight.w700,
                                        text: 'Ok',
                                        onpressed: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

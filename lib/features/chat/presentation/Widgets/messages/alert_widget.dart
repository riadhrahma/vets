import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vets_project/common_widgets/buttons/primary_button.dart';
import 'package:vets_project/common_widgets/dividers/custom_divider.dart';
import 'package:vets_project/core/theme/app_assets.dart';
import 'package:vets_project/core/theme/colors.dart';
import 'package:vets_project/core/theme/styles.dart';

import '../../../../../core/values/constant_strings.dart';

class EmergencyAlertWidget extends StatelessWidget {
  final String title;
  final String buttonText;
  final void Function() onTap;
  final Color color;
  const EmergencyAlertWidget(
      {super.key,
      required this.title,
      required this.buttonText,
      required this.onTap,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CircleAvatar(
            radius: 10,
            backgroundColor: color,
            child: const Image(
              color: kWhiteColor,
              height: 15,
              width: 15,
              image: AssetImage(
                AppAssets.logoIcon3,
              ),
            ),
          ),
          SizedBox(
            width: 260,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 0,
              color: kLightRedColor,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppAssets.emergencyIcon,
                          color: const Color.fromRGBO(196, 89, 89, 1),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            emergencyAlertText,
                            style: TextStyles.baseTextStyle.copyWith(
                              color: const Color.fromRGBO(
                                196,
                                89,
                                89,
                                1,
                              ),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10, top: 5),
                      child: CustomDividerWidget(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        title,
                        style: TextStyles.baseTextStyle.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10, top: 5, left: 10, right: 10),
                      child: SizedBox(
                        height: 35,
                        child: PrimaryButtonWidget(
                          text: buttonText,
                          onPress: onTap,
                          color: const Color.fromRGBO(232, 68, 56, 1),
                          textStyle: TextStyles.primaryButtonTextSTyle.copyWith(
                            fontWeight: FontWeight.w300,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 15,
                        right: 15,
                      ),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          '10:00 PM',
                          style: TextStyles.baseTextStyle.copyWith(
                            fontWeight: FontWeight.w300,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

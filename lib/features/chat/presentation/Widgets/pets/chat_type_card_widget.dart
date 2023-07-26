import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vets_project/core/global_use/size_config.dart';
import 'package:vets_project/core/theme/app_assets.dart';
import 'package:vets_project/core/theme/colors.dart';
import 'package:vets_project/core/theme/styles.dart';

class ChatTypeCardWidget extends StatelessWidget {
  final Color color;
  final String icon;
  final String title;
  final String subTitle;
  final Color iconCardColor;
  const ChatTypeCardWidget({
    Key? key,
    required this.color,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.iconCardColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
      child: SizedBox(
        height: 140,
        width: SizeConfig().widht,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
          color: color,
          child: Stack(
            children: [
              Positioned(
                left: 20,
                child: SvgPicture.asset(AppAssets.vetIcon),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 70,
                      child: Card(
                        elevation: 0,
                        shape: const CircleBorder(),
                        color: iconCardColor,
                        child: Center(
                          child: SvgPicture.asset(
                            icon,
                            fit: BoxFit.scaleDown,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyles.largeWhiteTextStyle,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                subTitle,
                                style: TextStyles.baseTextStyle.copyWith(
                                  color: kLightWhite,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

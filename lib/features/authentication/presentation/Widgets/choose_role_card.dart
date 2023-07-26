import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vets_project/core/global_use/size_config.dart';
import 'package:vets_project/core/theme/app_assets.dart';
import 'package:vets_project/core/theme/colors.dart';
import 'package:vets_project/core/theme/styles.dart';

class ChooseRoleCard extends StatelessWidget {
  final String icon;
  final String title;
  final String subTitle;
  final void Function() ontap;
  final bool isSelected;

  const ChooseRoleCard(
      {Key? key,
      required this.icon,
      required this.title,
      required this.subTitle,
      required this.ontap,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: SizedBox(
        height: 200,
        width: SizeConfig().widht,
        child: Card(
          color: isSelected ? kWhiteColor : const Color.fromRGBO(53, 73, 97, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(
              width: 1,
              color: kLightWhite,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  heightFactor: 0,
                  alignment: Alignment.topRight,
                  child: SizedBox(
                    height: 25,
                    width: 25,
                    child: Card(
                      elevation: 0,
                      color: isSelected ? Colors.black : Colors.transparent,
                      shape: CircleBorder(
                        side: isSelected
                            ? BorderSide.none
                            : const BorderSide(
                                width: 1,
                                color: kWhiteColor,
                              ),
                      ),
                      child: isSelected
                          ? Center(
                              child: SvgPicture.asset(
                                AppAssets.checkBoxIcon,
                                color: kWhiteColor,
                                fit: BoxFit.scaleDown,
                              ),
                            )
                          : Container(),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SvgPicture.asset(
                        icon,
                        fit: BoxFit.scaleDown,
                        color: isSelected ? kDarkCOlor : kWhiteColor,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 10),
                  child: Text(
                    title,
                    style: TextStyles.largeTextStyle.copyWith(
                      fontSize: 18,
                      color: isSelected ? kDarkCOlor : kWhiteColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    subTitle,
                    style: TextStyles.baseTextStyle.copyWith(
                      fontWeight: FontWeight.w500,
                      color: isSelected
                          ? kDarkCOlor.withOpacity(1)
                          : kLightWhite.withOpacity(0.7),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

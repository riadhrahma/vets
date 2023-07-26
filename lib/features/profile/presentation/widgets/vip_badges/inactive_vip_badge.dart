import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vets_project/common_widgets/buttons/custom_text_button.dart';
import 'package:vets_project/core/global_use/size_config.dart';
import 'package:vets_project/core/theme/app_assets.dart';
import 'package:vets_project/core/theme/colors.dart';
import 'package:vets_project/core/theme/styles.dart';
import 'package:vets_project/core/values/constant_strings.dart';

class InactiveVipBadge extends StatelessWidget {
  final void Function() ontap;
  const InactiveVipBadge({Key? key, required this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig().widht,
      height: 170,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 0.5,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    clientStatusText,
                    style: TextStyles.smallTextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      elevation: 0,
                      color: kLightPurpleColor,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 5,
                          left: 5,
                          right: 5,
                        ),
                        child: Text(
                          visitorText,
                          style: TextStyles.smallTextStyle.copyWith(
                            color: kPurpleColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                horizontalTitleGap: 1,
                title: Text(
                  ifYouAreAvetsClient,
                  style: TextStyles.smallTextStyle.copyWith(
                    color: kGreyCOlor.withOpacity(0.7),
                  ),
                ),
                leading: SvgPicture.asset(
                  AppAssets.messageIcon,
                  fit: BoxFit.scaleDown,
                ),
              ),
              CustomTextButton(
                text: addYourCLientCode,
                color: kBlueColor,
                onpressed: ontap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

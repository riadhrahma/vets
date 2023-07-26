import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vets_project/core/global_use/size_config.dart';
import 'package:vets_project/core/theme/app_assets.dart';
import 'package:vets_project/core/theme/colors.dart';
import 'package:vets_project/core/theme/styles.dart';
import 'package:vets_project/core/values/constant_strings.dart';

class ActiveVipBadge extends StatelessWidget {
  const ActiveVipBadge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig().widht,
      height: 116,
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
                  SvgPicture.asset(AppAssets.vipBadgeIcon),
                ],
              ),
              ListTile(
                dense: true,
                contentPadding: const EdgeInsets.all(0),
                horizontalTitleGap: 10,
                title: Text(
                  verifiedClientCode,
                  style: TextStyles.smallTextStyle.copyWith(
                    color: kGreyCOlor.withOpacity(0.7),
                    fontSize: 10,
                  ),
                ),
                subtitle: Text(
                  '123456',
                  style: TextStyles.baseTextStyle
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                leading: SizedBox(
                  width: 40,
                  height: 40,
                  child: Card(
                    color: Colors.transparent,
                    elevation: 0,
                    shape: const CircleBorder(
                        side: BorderSide(
                      width: 0.3,
                      color: kGreenColor,
                    )),
                    child: Center(
                      child: SvgPicture.asset(
                        AppAssets.checkBoxIcon,
                        color: kGreenColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

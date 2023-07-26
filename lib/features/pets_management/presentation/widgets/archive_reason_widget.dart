import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vets_project/core/global_use/size_config.dart';
import 'package:vets_project/core/theme/app_assets.dart';
import 'package:vets_project/core/theme/colors.dart';
import 'package:vets_project/core/theme/styles.dart';

class ArchiveReasonWWidget extends StatelessWidget {
  final String title;
  final void Function() onTap;
  final bool isselected;
  const ArchiveReasonWWidget(
      {super.key,
      required this.title,
      required this.onTap,
      required this.isselected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: SizeConfig().widht,
        height: 70,
        child: Card(
          elevation: 0,
          color: isselected
              ? const Color.fromRGBO(237, 242, 248, 1)
              : const Color.fromRGBO(245, 246, 247, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: isselected
                ? const BorderSide(width: 1, color: kBlueColor)
                : BorderSide.none,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  SizedBox(
                    height: 27,
                    width: 27,
                    child: Card(
                      color: isselected
                          ? kBlueColor.withOpacity(0.7)
                          : Colors.transparent,
                      elevation: 0,
                      shape: CircleBorder(
                        side: isselected
                            ? BorderSide.none
                            : BorderSide(
                                width: 1.5,
                                color: kGreyCOlor.withOpacity(0.5),
                              ),
                      ),
                      child: isselected
                          ? Center(
                              child: SvgPicture.asset(
                                AppAssets.checkBoxIcon,
                                color: kWhiteColor,
                                fit: BoxFit.scaleDown,
                                height: 10,
                                width: 10,
                              ),
                            )
                          : const SizedBox(
                              height: 0,
                              width: 0,
                            ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Text(
                      title,
                      style: TextStyles.baseTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                        color: isselected
                            ? kBlueColor.withOpacity(0.7)
                            : kGreyCOlor.withOpacity(0.7),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

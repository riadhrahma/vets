import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vets_project/core/global_use/size_config.dart';
import 'package:vets_project/core/theme/app_assets.dart';
import 'package:vets_project/core/theme/colors.dart';
import 'package:vets_project/core/theme/styles.dart';

class TransportMannerCardWidget extends StatelessWidget {
  final bool iselected;
  final String title;
  final String subTitile;
  final String icon;
  final void Function() ontap;
  final String type;
  const TransportMannerCardWidget({
    Key? key,
    required this.iselected,
    required this.title,
    required this.subTitile,
    required this.icon,
    required this.ontap,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: SizedBox(
        width: SizeConfig().widht,
        child: Card(
          color:
              iselected ? const Color.fromRGBO(77, 122, 188, 1) : kWhiteColor,
          elevation: 0.5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 25,
                            width: 25,
                            child: Card(
                              elevation: 0,
                              color:
                                  iselected ? kWhiteColor : Colors.transparent,
                              shape: CircleBorder(
                                side: iselected
                                    ? BorderSide.none
                                    : const BorderSide(
                                        width: 0.5,
                                        color: kDarkCOlor,
                                      ),
                              ),
                              child: iselected
                                  ? Center(
                                      child: SvgPicture.asset(
                                        AppAssets.checkBoxIcon,
                                        color: kBlueColor,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    )
                                  : Container(),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 10,
                                right: type == 'Home' ? 0 : 20,
                                top: 5,
                              ),
                              child: type == 'Clinic'
                                  ? Text(
                                      title,
                                      style:
                                          TextStyles.meduimTextSTyle.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: iselected
                                            ? kWhiteColor
                                            : kDarkCOlor,
                                      ),
                                      textAlign: TextAlign.start,
                                    )
                                  : type == 'Home'
                                      ? EasyRichText(
                                          title,
                                          defaultStyle: TextStyles
                                              .meduimTextSTyle
                                              .copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            color: iselected
                                                ? kWhiteColor
                                                : kDarkCOlor,
                                          ),
                                          patternList: [
                                            EasyRichTextPattern(
                                              hasSpecialCharacters: true,
                                              targetString:
                                                  '(Transport + Consultation)',
                                              style: TextStyles.smallTextStyle
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: iselected
                                                          ? kLightWhite
                                                              .withOpacity(0.7)
                                                          : kGreyCOlor
                                                              .withOpacity(
                                                                  0.7)),
                                            )
                                          ],
                                        )
                                      : Text(
                                          title,
                                          style: TextStyles.meduimTextSTyle
                                              .copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: iselected
                                                ? kWhiteColor
                                                : kDarkCOlor,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 70,
                      width: 70,
                      child: Card(
                        shape: const CircleBorder(),
                        elevation: 0,
                        color: iselected
                            ? kWhiteColor
                            : const Color.fromRGBO(235, 237, 239, 1),
                        child: Center(
                          child: SvgPicture.asset(
                            icon,
                            color: kDarkCOlor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                type == 'Car'
                    ? Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Gratuit',
                              style: TextStyles.meduimTextSTyle.copyWith(
                                fontWeight: FontWeight.w500,
                                color: iselected
                                    ? kWhiteColor
                                    : kGreyCOlor.withOpacity(0.7),
                              ),
                            ),
                            EasyRichText(
                              '0 DT',
                              defaultStyle: TextStyles.meduimTextSTyle.copyWith(
                                color: iselected ? kWhiteColor : kGreyCOlor,
                                fontWeight: FontWeight.w600,
                              ),
                              patternList: [
                                EasyRichTextPattern(
                                  superScript: true,
                                  targetString: 'DT',
                                  style: TextStyles.meduimTextSTyle.copyWith(
                                    color: iselected ? kWhiteColor : kGreyCOlor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          type == 'Clinic'
                              ? Padding(
                                  padding: const EdgeInsets.only(left: 25),
                                  child: SizedBox(
                                    width: 110,
                                    height: 40,
                                    child: Card(
                                      elevation: 0,
                                      color: iselected
                                          ? kWhiteColor
                                          : const Color.fromRGBO(
                                              235, 237, 239, 1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Grand Tunis',
                                          style: TextStyles.smallTextStyle
                                              .copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: kDarkCOlor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          Container(
                            color: iselected ? Colors.transparent : kWhiteColor,
                            alignment: Alignment.topCenter,
                            child: Row(
                              children: [
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10, left: 20),
                                    child: Stack(
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 16.0),
                                          padding: const EdgeInsets.fromLTRB(
                                            8.0,
                                            20.0,
                                            10.0,
                                            8.0,
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: iselected
                                                  ? kWhiteColor
                                                  : kDarkCOlor,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.wb_sunny_rounded,
                                                color: iselected
                                                    ? kWhiteColor
                                                    : kDarkCOlor,
                                                size: 18,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 8,
                                                ),
                                                child: Text(
                                                  'De 09h à 19h',
                                                  style: TextStyles
                                                      .smallTextStyle
                                                      .copyWith(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w600,
                                                    color: iselected
                                                        ? kWhiteColor
                                                        : kDarkCOlor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                            8.0,
                                            4.0,
                                            4.0,
                                            4.0,
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0,
                                          ),
                                          color: iselected
                                              ? const Color.fromRGBO(
                                                  77,
                                                  122,
                                                  188,
                                                  1,
                                                )
                                              : kWhiteColor,
                                          child: EasyRichText(
                                            type == 'Home' ? '95 DT' : '55 DT',
                                            defaultStyle: TextStyles
                                                .largeWhiteTextStyle
                                                .copyWith(
                                              color: iselected
                                                  ? kWhiteColor
                                                  : kDarkCOlor.withOpacity(0.8),
                                            ),
                                            patternList: [
                                              EasyRichTextPattern(
                                                targetString: 'DT',
                                                style: TextStyles
                                                    .meduimTextSTyle
                                                    .copyWith(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 12,
                                                  color: iselected
                                                      ? kWhiteColor
                                                      : kDarkCOlor,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      right: 10,
                                      left: 20,
                                    ),
                                    child: Stack(
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 16.0),
                                          padding: const EdgeInsets.fromLTRB(
                                            8.0,
                                            20.0,
                                            10.0,
                                            8.0,
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: iselected
                                                  ? kWhiteColor
                                                  : kDarkCOlor,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                          ),
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                AppAssets.moonIcon,
                                                fit: BoxFit.scaleDown,
                                                color: iselected
                                                    ? kWhiteColor
                                                    : kDarkCOlor,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 8,
                                                ),
                                                child: Text(
                                                  'De 19h à 09h',
                                                  style: TextStyles
                                                      .smallTextStyle
                                                      .copyWith(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w600,
                                                    color: iselected
                                                        ? kWhiteColor
                                                        : kDarkCOlor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                            8.0,
                                            4.0,
                                            4.0,
                                            4.0,
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0,
                                          ),
                                          color: iselected
                                              ? const Color.fromRGBO(
                                                  77,
                                                  122,
                                                  188,
                                                  1,
                                                )
                                              : kWhiteColor,
                                          child: EasyRichText(
                                            type == 'Home'
                                                ? '140 DT'
                                                : '100 DT',
                                            defaultStyle: TextStyles
                                                .largeWhiteTextStyle
                                                .copyWith(
                                              color: iselected
                                                  ? kWhiteColor
                                                  : kDarkCOlor.withOpacity(0.8),
                                            ),
                                            patternList: [
                                              EasyRichTextPattern(
                                                targetString: 'DT',
                                                style: TextStyles
                                                    .meduimTextSTyle
                                                    .copyWith(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 12,
                                                  color: iselected
                                                      ? kWhiteColor
                                                      : kDarkCOlor,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 20),
                            child: EasyRichText(
                              subTitile,
                              defaultStyle: TextStyles.smallTextStyle.copyWith(
                                color: iselected
                                    ? kWhiteColor
                                    : kDarkCOlor.withOpacity(0.8),
                                fontWeight: FontWeight.w400,
                              ),
                              patternList: [
                                EasyRichTextPattern(
                                  targetString: '20km',
                                  style: TextStyles.smallTextStyle.copyWith(
                                    color: iselected
                                        ? kWhiteColor
                                        : kDarkCOlor.withOpacity(0.8),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                EasyRichTextPattern(
                                  targetString:
                                      type == 'Clinic' ? '2DT/km' : '3DT/km',
                                  style: TextStyles.smallTextStyle.copyWith(
                                    color: iselected
                                        ? kWhiteColor
                                        : kDarkCOlor.withOpacity(0.8),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vets_project/common_widgets/dividers/custom_divider.dart';
import 'package:vets_project/core/global_use/size_config.dart';
import 'package:vets_project/core/theme/colors.dart';
import 'package:vets_project/core/theme/styles.dart';

class PetCardPreviewWidget extends StatelessWidget {
  final String petName;
  final String petAge;
  final String petImageUrl;
  final String petSpecies;
  final String petIcon;
  final String petBreed;
  final String petGender;
  final double petWeight;

  const PetCardPreviewWidget({
    Key? key,
    required this.petName,
    required this.petAge,
    required this.petImageUrl,
    required this.petSpecies,
    required this.petIcon,
    required this.petBreed,
    required this.petGender,
    required this.petWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig().widht,
      height: 220,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0.5,
        margin: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Container(
              height: 130,
              width: SizeConfig().widht,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    petImageUrl,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 20,
              top: 105,
              child: SizedBox(
                width: 40,
                height: 40,
                child: Card(
                  elevation: 0.5,
                  shape: const CircleBorder(),
                  color: kWhiteColor,
                  child: Center(
                    child: SvgPicture.asset(
                      petIcon,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              top: 140,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          petName,
                          style: TextStyles.meduimTextSTyle.copyWith(
                            color: kDarkCOlor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            '$petSpecies $petBreed',
                            style: TextStyles.smallTextStyle
                                .copyWith(fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: CustomDividerWidget(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        EasyRichText(
                          'Age $petAge an',
                          defaultStyle: TextStyles.baseTextStyle.copyWith(
                              fontSize: 12, fontWeight: FontWeight.w500),
                          patternList: [
                            EasyRichTextPattern(
                              targetString: '$petAge an',
                              style: TextStyles.baseTextStyle.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: kGreyCOlor.withOpacity(0.8),
                              ),
                            )
                          ],
                        ),
                        EasyRichText(
                          'Sexe $petGender',
                          defaultStyle: TextStyles.baseTextStyle.copyWith(
                              fontSize: 12, fontWeight: FontWeight.w500),
                          patternList: [
                            EasyRichTextPattern(
                                targetString: petGender,
                                style: TextStyles.baseTextStyle.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                  color: kGreyCOlor.withOpacity(0.8),
                                ))
                          ],
                        ),
                        EasyRichText(
                          'Poids $petWeight Kg',
                          defaultStyle: TextStyles.baseTextStyle.copyWith(
                              fontSize: 12, fontWeight: FontWeight.w500),
                          patternList: [
                            EasyRichTextPattern(
                              targetString: '$petWeight Kg',
                              style: TextStyles.baseTextStyle.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: kGreyCOlor.withOpacity(0.8),
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

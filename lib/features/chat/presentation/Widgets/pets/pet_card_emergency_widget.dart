import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vets_project/core/global_use/size_config.dart';
import 'package:vets_project/core/theme/app_assets.dart';
import 'package:vets_project/core/theme/colors.dart';
import 'package:vets_project/core/theme/styles.dart';

class PetEmergencyCardWidget extends StatelessWidget {
  final String petID;
  final String petImage;
  final String petName;
  final String petSpecies;
  final String speciesIcon;
  final bool isSelected;
  final void Function() ontap;
  const PetEmergencyCardWidget({
    Key? key,
    required this.petID,
    required this.petImage,
    required this.petName,
    required this.petSpecies,
    required this.isSelected,
    required this.speciesIcon,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: SizedBox(
        height: 220,
        width: SizeConfig().widht,
        child: Card(
          margin: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: isSelected
                ? const BorderSide(
                    width: 2,
                    color: kRedColor,
                  )
                : BorderSide.none,
          ),
          elevation: 0.5,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: 60,
                ),
                child: petName == 'Autre animal'
                    ? Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              8,
                            ),
                            color: const Color.fromRGBO(215, 219, 223, 1),
                          ),
                          child: Center(
                            child: SizedBox(
                              height: 70,
                              width: 70,
                              child: Card(
                                shape: const CircleBorder(),
                                elevation: 0,
                                child: Center(
                                  child: SvgPicture.asset(
                                    AppAssets.petDarkIcon,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage(
                              petImage,
                            ),
                          ),
                        ),
                      ),
              ),
              petName == 'Autre animal'
                  ? const SizedBox(
                      height: 0,
                      width: 0,
                    )
                  : Positioned(
                      left: 0,
                      right: 0,
                      top: 130,
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: Card(
                          elevation: 0,
                          shape: const CircleBorder(),
                          color: kWhiteColor,
                          child: Center(
                            child: SvgPicture.asset(
                              speciesIcon,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ),
                    ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                    top: 10,
                    right: 5,
                    bottom: 5,
                  ),
                  child: SizedBox(
                    height: 50,
                    width: SizeConfig().widht,
                    child: Card(
                      elevation: 0,
                      color: isSelected ? kLightRedColor : kLightGreyColor,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              petName,
                              style: TextStyles.baseTextStyle.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 22,
                              width: 22,
                              child: Card(
                                elevation: 0,
                                color:
                                    isSelected ? kRedColor : Colors.transparent,
                                shape: CircleBorder(
                                  side: isSelected
                                      ? BorderSide.none
                                      : const BorderSide(
                                          width: 0.5,
                                          color: kDarkCOlor,
                                        ),
                                ),
                                child: isSelected
                                    ? Center(
                                        child: SvgPicture.asset(
                                          AppAssets.checkBoxIcon,
                                        ),
                                      )
                                    : Container(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

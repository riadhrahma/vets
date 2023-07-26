import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vets_project/core/theme/colors.dart';
import 'package:vets_project/core/theme/styles.dart';

class PetSpeciesCard extends StatelessWidget {
  final bool isSelected;
  final String title;
  final String icon;
  final void Function(bool) onSelected;
  const PetSpeciesCard({
    super.key,
    required this.isSelected,
    required this.title,
    required this.icon,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5, left: 5),
      child: ChoiceChip(
        onSelected: onSelected,
        padding: const EdgeInsets.only(
          left: 5,
          right: 3,
        ),
        avatar: SizedBox(
          height: 40,
          width: 40,
          child: Card(
            elevation: 0,
            color: isSelected
                ? kWhiteColor
                : const Color.fromRGBO(245, 246, 247, 1),
            shape: const CircleBorder(),
            child: Center(
              child: SvgPicture.asset(
                icon,
                height: 12,
                width: 12,
                color: kDarkCOlor,
              ),
            ),
          ),
        ),
        disabledColor: kWhiteColor,
        backgroundColor: kWhiteColor,
        selectedColor: const Color.fromRGBO(53, 73, 97, 1),
        label: Text(
          title,
          style: isSelected
              ? TextStyles.baseTextStyle
                  .copyWith(color: kWhiteColor, fontWeight: FontWeight.w500)
              : TextStyles.baseTextStyle.copyWith(
                  color: kGreyCOlor.withOpacity(
                    0.5,
                  ),
                ),
        ),
        selected: isSelected,
      ),
    );
  }
}

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:vets_project/core/theme/colors.dart';
import 'package:vets_project/core/theme/styles.dart';

class CustomDropDowButton extends StatelessWidget {
  final List<DropDownValueModel> dropDownList;
  final String label;
  final SingleValueDropDownController singleValueDropDownController;
  const CustomDropDowButton({
    Key? key,
    required this.dropDownList,
    required this.singleValueDropDownController,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropDownTextField(
      textFieldDecoration: InputDecoration(
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(1),
          borderSide: const BorderSide(
            color: kDarkCOlor,
            width: 0.5,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(1),
          borderSide: const BorderSide(
            color: kDarkCOlor,
            width: 0.5,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(1),
          borderSide: const BorderSide(
            color: kBlueColor,
            width: 0.5,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(1),
          borderSide: const BorderSide(
            color: kDarkCOlor,
            width: 0.5,
          ),
        ),
        contentPadding: const EdgeInsets.only(
          left: 10,
        ),
        label: Text(
          label,
          style: TextStyles.smallTextStyle.copyWith(
            color: kGreyCOlor.withOpacity(0.5),
            fontSize: 14,
          ),
        ),
      ),
      singleController: singleValueDropDownController,
      clearOption: false,
      textStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      listTextStyle: TextStyles.meduimTextSTyle.copyWith(
        color: kDarkCOlor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      dropDownList: dropDownList,
    );
  }
}

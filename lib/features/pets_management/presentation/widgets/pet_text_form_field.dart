import 'package:flutter/material.dart';
import 'package:vets_project/core/theme/colors.dart';
import 'package:vets_project/core/theme/styles.dart';

class CustomPetTextFormField extends StatefulWidget {
  final void Function(String) onChanged;
  final String labelText;
  final TextInputType textInputType;

  final String? errorText;
  const CustomPetTextFormField({
    Key? key,
    required this.onChanged,
    required this.textInputType,
    required this.labelText,
    this.errorText,
  }) : super(key: key);

  @override
  State<CustomPetTextFormField> createState() => _CustomPetTextFormFieldState();
}

class _CustomPetTextFormFieldState extends State<CustomPetTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.textInputType,
      onChanged: widget.onChanged,
      textCapitalization: TextCapitalization.words,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        labelStyle: TextStyles.smallTextStyle.copyWith(
          color: kGreyCOlor.withOpacity(0.5),
          fontSize: 14,
        ),
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
        fillColor: kWhiteColor,
        filled: true,
        errorText: widget.errorText,
        labelText: widget.labelText,
        errorStyle: TextStyles.baseTextStyle.copyWith(
          color: kRedColor,
          fontSize: 12,
          height: 0,
        ),
        contentPadding: const EdgeInsets.only(
          top: 12,
          bottom: 12,
          left: 10,
        ),
      ),
    );
  }
}

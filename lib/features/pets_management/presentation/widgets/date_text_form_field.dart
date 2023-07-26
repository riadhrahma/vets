import 'package:flutter/material.dart';
import 'package:vets_project/core/theme/colors.dart';
import 'package:vets_project/core/theme/styles.dart';

class DateTextFormField extends StatefulWidget {
  final void Function(String) onChanged;
  final String labelText;
  final Widget? suffixIcon;
  final TextInputType textInputType;
  final bool obscureText;
  final String? errorText;
  final void Function()? onTap;
  final TextEditingController? textEditingController;
  const DateTextFormField({
    Key? key,
    required this.onChanged,
    required this.textInputType,
    required this.labelText,
    this.obscureText = false,
    this.errorText,
    this.suffixIcon,
    this.onTap,
    this.textEditingController,
  }) : super(key: key);

  @override
  State<DateTextFormField> createState() => _DateTextFormFieldState();
}

class _DateTextFormFieldState extends State<DateTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      onTap: widget.onTap,
      obscureText: widget.obscureText,
      keyboardType: widget.textInputType,
      onChanged: widget.onChanged,
      textCapitalization: TextCapitalization.words,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
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
        labelStyle: TextStyles.smallTextStyle.copyWith(
          color: kGreyCOlor.withOpacity(0.5),
          fontSize: 14,
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
        suffixIcon: widget.suffixIcon ?? Container(),
        hintStyle: const TextStyle(
          fontSize: 14,
          color: kBlueColor,
          fontWeight: FontWeight.w500,
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

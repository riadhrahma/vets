import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vets_project/core/theme/app_assets.dart';
import 'package:vets_project/core/theme/colors.dart';

class CustomPofileTextFormField extends StatelessWidget {
  final void Function(String) onchanged;
  final String labelText;
  final Widget? suffixIcon;
  final TextInputType textInputType;
  final bool obsecureText;
  final String initialValue;
  final String? errorText;
  const CustomPofileTextFormField(
      {Key? key,
      required this.onchanged,
      required this.labelText,
      this.suffixIcon,
      required this.textInputType,
      required this.obsecureText,
      this.errorText,
      required this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      obscureText: obsecureText,
      keyboardType: textInputType,
      onChanged: onchanged,
      textCapitalization: TextCapitalization.words,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        errorText: errorText,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(1),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: kDarkCOlor,
            width: 0.5,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: kBlueColor,
            width: 0.5,
          ),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 0.5,
          ),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 0.5,
          ),
        ),
        suffixIcon: suffixIcon == null
            ? const SizedBox(
                width: 0,
                height: 0,
              )
            : SvgPicture.asset(
                AppAssets.eyeIcon,
                fit: BoxFit.scaleDown,
              ),
        hintStyle: const TextStyle(
          fontSize: 14,
          color: kBlueColor,
          fontWeight: FontWeight.w500,
        ),
        fillColor: kWhiteColor,
        filled: true,
        labelText: labelText,
        contentPadding: const EdgeInsets.only(
          top: 12,
          bottom: 12,
          left: 10,
        ),
      ),
    );
  }
}

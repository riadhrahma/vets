import 'package:flutter/material.dart';
import 'package:vets_project/core/theme/colors.dart';
import 'package:vets_project/core/theme/styles.dart';

class CustomProfilePhoneFormField extends StatelessWidget {
  final void Function(String) onchanged;
  final String labelTxt;
  final String initialValue;
  final String? errorText;
  const CustomProfilePhoneFormField({
    Key? key,
    required this.onchanged,
    required this.labelTxt,
    required this.initialValue,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      keyboardType: TextInputType.phone,
      onChanged: onchanged,
      textCapitalization: TextCapitalization.words,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        errorText: errorText,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: SizedBox(
            width: 70,
            child: Row(
              children: [
                Text(
                  '+216',
                  style: TextStyles.baseTextStyle.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 30,
                  child: VerticalDivider(
                    thickness: 0.5,
                    color: kGreyCOlor.withOpacity(0.5),
                  ),
                )
              ],
            ),
          ),
        ),
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

        hintStyle: const TextStyle(
          fontSize: 14,
          color: kBlueColor,
          fontWeight: FontWeight.w500,
        ),
        fillColor: kWhiteColor,
        filled: true,
        labelText: labelTxt,
        alignLabelWithHint: true,
        contentPadding: const EdgeInsets.only(
          top: 12,
          bottom: 12,
          left: 100,
        ),
      ),
    );
  }
}

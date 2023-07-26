import 'package:flutter/material.dart';
import 'package:vets_project/core/global_use/size_config.dart';
import 'package:vets_project/core/theme/colors.dart';
import 'package:vets_project/core/theme/styles.dart';

class CustomPhoneFormField extends StatelessWidget {
  final void Function(String) onChanged;
  final String labelText;
  final String errorText;

  const CustomPhoneFormField({
    Key? key,
    required this.onChanged,
    required this.labelText,
    required this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 55,
          width: SizeConfig().widht,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: kWhiteColor,
              ),
            ),
          ),
          child: TextFormField(
            keyboardType: TextInputType.phone,
            onChanged: onChanged,
            textCapitalization: TextCapitalization.words,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: kWhiteColor,
            ),
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  width: 70,
                  child: Row(
                    children: [
                      Text(
                        '+216',
                        style: TextStyles.baseTextStyle.copyWith(
                            fontWeight: FontWeight.w600, color: kWhiteColor),
                      ),
                      SizedBox(
                        height: 30,
                        child: VerticalDivider(
                          thickness: 0.5,
                          color: kLightWhite.withOpacity(0.5),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              hintStyle: const TextStyle(
                fontSize: 10,
                color: kWhiteColor,
                fontWeight: FontWeight.w500,
              ),
              label: Text(
                labelText,
                style: TextStyles.smallTextStyle.copyWith(
                  color: kWhiteColor,
                  fontSize: 14,
                ),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              contentPadding: const EdgeInsets.only(
                top: 12,
                bottom: 12,
                left: 100,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            errorText,
            style: TextStyles.smallTextStyle.copyWith(
              color: kRedColor,
              height: 0,
            ),
          ),
        )
      ],
    );
  }
}

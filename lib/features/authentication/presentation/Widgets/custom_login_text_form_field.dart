import 'package:flutter/material.dart';
import 'package:vets_project/core/global_use/size_config.dart';
import 'package:vets_project/core/theme/colors.dart';
import 'package:vets_project/core/theme/styles.dart';

class CustomLoginFormField extends StatefulWidget {
  final void Function(String) onChanged;
  final String labelText;
  final Widget? suffixIcon;
  final TextInputType textInputType;
  final bool obscureText;
  final String errorText;

  const CustomLoginFormField({
    Key? key,
    required this.onChanged,
    required this.textInputType,
    required this.labelText,
    this.obscureText = false,
    required this.errorText,
    this.suffixIcon,
  }) : super(key: key);

  @override
  State<CustomLoginFormField> createState() => _CustomLoginFormFieldState();
}

class _CustomLoginFormFieldState extends State<CustomLoginFormField> {
  FocusNode focus = FocusNode();

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
            focusNode: focus,
            obscureText: widget.obscureText,
            keyboardType: widget.textInputType,
            onChanged: widget.onChanged,
            textCapitalization: TextCapitalization.words,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: kWhiteColor,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              suffixIcon: widget.suffixIcon ,
              label: Text(
                widget.labelText,
                style: TextStyles.smallTextStyle.copyWith(
                  color: const Color.fromRGBO(245, 246, 247, 1),
                  fontSize: 14,
                ),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.auto,
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
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            widget.errorText,
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

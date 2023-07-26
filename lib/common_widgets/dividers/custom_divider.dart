import 'package:flutter/material.dart';
import 'package:vets_project/core/theme/colors.dart';

class CustomDividerWidget extends StatelessWidget {
  final double? thikness;
  final Color? color;
  const CustomDividerWidget({Key? key, this.thikness, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: thikness ?? 0.3,
      color: color ?? kGreyCOlor,
    );
  }
}

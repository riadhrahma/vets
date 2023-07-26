import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vets_project/core/theme/colors.dart';

class OverlayWidget extends StatelessWidget {
  const OverlayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kGreyCOlor,
      body: Center(
        child: SpinKitFadingFour(
          color: kWhiteColor,
          size: 50.0,
        ),
      ),
    );
  }
}

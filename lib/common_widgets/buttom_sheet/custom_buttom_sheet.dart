import 'package:flutter/material.dart';
import 'package:vets_project/common_widgets/dividers/custom_divider.dart';

class CustomButtomSheet extends StatelessWidget {
  final Widget widget;
  const CustomButtomSheet({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      maxChildSize: 0.5,
      minChildSize: 0.3,
      builder: (BuildContext context, ScrollController controller) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          height: 200,
          width: 200,
          child: SingleChildScrollView(
            controller: controller,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: SizedBox(
                    width: 60,
                    child: CustomDividerWidget(),
                  ),
                ),
                widget
              ],
            ),
          ),
        );
      },
    );
  }
}

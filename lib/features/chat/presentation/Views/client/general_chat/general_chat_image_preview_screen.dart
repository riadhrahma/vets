import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vets_project/core/global_use/size_config.dart';
import 'package:vets_project/core/theme/app_assets.dart';
import 'package:vets_project/core/theme/colors.dart';
import 'package:vets_project/core/theme/styles.dart';
import 'package:vets_project/core/values/constant_strings.dart';

class GeneralChatImagePreviewScreen extends StatelessWidget {
  const GeneralChatImagePreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController message = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: SizedBox(
              height: 30,
              width: 30,
              child: Card(
                elevation: 0,
                color: vetsGreen,
                shape: const CircleBorder(
                  side: BorderSide(
                    color: kWhiteColor,
                    width: 1.5,
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AppAssets.checkBoxIcon,
                    color: kWhiteColor,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
          ),
        ],
        title: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 17,
                  backgroundColor: kGreenColor,
                  child: Image(
                    color: kWhiteColor,
                    height: 27,
                    width: 27,
                    image: AssetImage(
                      AppAssets.logoIcon3,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Text(
                            'Dr. Vets',
                            style: TextStyles.baseTextStyle.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: kWhiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        onlineText,
                        style: TextStyles.smallTextStyle.copyWith(
                          color: kWhiteColor,
                          fontSize: 10,
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset(
            AppAssets.arrowLeftWhiteIcon,
            fit: BoxFit.scaleDown,
            color: kWhiteColor,
          ),
        ),
        backgroundColor: const Color.fromRGBO(31, 31, 31, 0.4),
        elevation: 0.2,
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: SizedBox(
        width: SizeConfig().widht,
        height: SizeConfig().height,
        child: Stack(
          fit: StackFit.loose,
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AppAssets.fullCatImage,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 100,
                width: SizeConfig().widht,
                color: Colors.transparent,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  fit: StackFit.loose,
                  children: [
                    TextField(
                      cursorColor: kWhiteColor,
                      controller: message,
                      style: TextStyles.baseTextStyle.copyWith(
                        color: kWhiteColor,
                      ),
                      decoration: InputDecoration(
                        hintStyle: TextStyles.smallTextStyle.copyWith(
                          color: kWhiteColor,
                          fontWeight: FontWeight.w300,
                        ),
                        contentPadding: const EdgeInsets.only(
                          top: 15,
                          bottom: 15,
                          left: 20,
                        ),
                        isDense: true,
                        hintText: 'Ajouter un commentaire...',
                        fillColor: const Color.fromRGBO(31, 31, 31, 0.4),
                        filled: true,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                        enabled: true,
                      ),
                    ),
                    Positioned(
                      top: 5,
                      bottom: 0,
                      right: 30,
                      child: InkWell(
                        onTap: () {},
                        child: SizedBox(
                          height: 45,
                          width: 45,
                          child: Card(
                            color: vetsGreen,
                            shape: const CircleBorder(),
                            child: Center(
                                child: SvgPicture.asset(
                              AppAssets.sendIcon,
                              fit: BoxFit.scaleDown,
                            )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.only(
            //       bottom: 10, left: 16, right: 16, top: 20),
            //   child: Align(
            //     alignment: Alignment.bottomCenter,
            //     child: Row(
            //       children: [
            //         Flexible(
            //           child: Padding(
            //             padding: const EdgeInsets.only(left: 10, right: 10),
            //             child:
            //           ),
            //         ),
            //         message.text.isEmpty
            //             ? InkWell(
            //                 onTap: () {},
            //                 child: const SizedBox(
            //                   height: 40,
            //                   width: 40,
            //                   child: Card(
            //                     color: kGreenColor,
            //                     shape: CircleBorder(),
            //                     child: Center(
            //                       child: Icon(
            //                         Icons.mic_outlined,
            //                         color: kWhiteColor,
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               )
            //             : InkWell(
            //                 onTap: () {},
            //                 child: const SizedBox(
            //                   height: 40,
            //                   width: 40,
            //                   child: Card(
            //                     color: kGreenColor,
            //                     shape: CircleBorder(),
            //                     child: Center(
            //                       child: Icon(
            //                         Icons.send,
            //                         color: kWhiteColor,
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               )
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

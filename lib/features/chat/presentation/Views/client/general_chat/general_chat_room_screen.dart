import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vets_project/common_widgets/cards/custom_file_picker_widget.dart';
import 'package:vets_project/core/global_use/size_config.dart';
import 'package:vets_project/core/routes/routes.dart';
import 'package:vets_project/core/theme/app_assets.dart';
import 'package:vets_project/core/theme/colors.dart';
import 'package:vets_project/core/theme/styles.dart';
import 'package:vets_project/core/values/constant_strings.dart';
import 'package:vets_project/features/chat/presentation/Widgets/messages/alert_widget.dart';

class GeneralChatRoomScreen extends StatelessWidget {
  const GeneralChatRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isTypingText = false;
    final TextEditingController message = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            position: PopupMenuPosition.under,
            icon: SvgPicture.asset(
              AppAssets.unionIcon,
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: SvgPicture.asset(
                        AppAssets.searchIcon,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    Text(
                      'Recherche',
                      style: TextStyles.smallTextStyle.copyWith(
                          color: kDarkCOlor,
                          fontSize: 10,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: SvgPicture.asset(
                        AppAssets.galleryIcon,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    Text(
                      'Médias partagés',
                      style: TextStyles.smallTextStyle.copyWith(
                          color: kDarkCOlor,
                          fontSize: 10,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
        title: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 17,
                  backgroundColor: vetsGreen,
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
                            'Dr Vets',
                            style: TextStyles.baseTextStyle.copyWith(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        onlineText,
                        style: TextStyles.smallTextStyle.copyWith(
                          color: kGreenColor,
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
            AppAssets.arrowLeftIcon,
            fit: BoxFit.scaleDown,
          ),
        ),
        backgroundColor: const Color.fromRGBO(245, 246, 247, 1),
        elevation: 0.5,
      ),
      body: SizedBox(
        width: SizeConfig().widht,
        height: SizeConfig().height,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(left: 20, right: 24, top: 26),
                shrinkWrap: true,
                children: [
                  // const Padding(
                  //   padding: EdgeInsets.only(bottom: 20),
                  //   child: GeneralMessageContainerWidget(
                  //     message: 'Bonjour, comment je peux vous aider?',
                  //     avatar: '',
                  //     isme: false,
                  //     time: "10:00",
                  //     isReaded: false,
                  //   ),
                  // ),
                  // const Padding(
                  //   padding: EdgeInsets.only(bottom: 20),
                  //   child: GeneralMessageContainerWidget(
                  //     message:
                  //         'J’ai dépassé la date de vaccination de Sima. Qu’est ce que je dois faire?',
                  //     avatar: '',
                  //     isme: true,
                  //     time: "10:00",
                  //     isReaded: true,
                  //   ),
                  // ),
                  // const GeneralMessageContainerWidget(
                  //   message:
                  //       "Lorem ipsum dolor sit amet consectetur adipiscing elit.",
                  //   avatar: '',
                  //   isme: false,
                  //   time: "10:00",
                  //   isReaded: false,
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: EmergencyAlertWidget(
                        color: kGreenColor,
                        title:
                            'Votre animal nécessite une prise en charge urgente',
                        buttonText: 'Contacter les urgences',
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.emergencyChatRoomScreen,
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            StatefulBuilder(
              builder: ((context, setState) {
                return Padding(
                  padding: const EdgeInsets.only(
                      bottom: 10, left: 16, right: 16, top: 20),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: TextField(
                              onChanged: (value) {
                                if (value.isEmpty) {
                                  setState(
                                    () {
                                      isTypingText = false;
                                    },
                                  );
                                } else {
                                  setState(
                                    () {
                                      isTypingText = true;
                                    },
                                  );
                                }
                              },
                              controller: message,
                              decoration: InputDecoration(
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                          backgroundColor: Colors.transparent,
                                          isScrollControlled: true,
                                          context: context,
                                          builder: ((context) {
                                            return Container(
                                              decoration: const BoxDecoration(
                                                color: kWhiteColor,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                ),
                                              ),
                                              width: SizeConfig().widht,
                                              height: 150,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 10,
                                                  right: 10,
                                                  top: 25,
                                                ),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        CustomFilePickerWidget(
                                                          title: 'Gallerie',
                                                          iconPath: AppAssets
                                                              .galleryIcon,
                                                          ontap: () {},
                                                        ),
                                                        CustomFilePickerWidget(
                                                          title: 'Fichier',
                                                          iconPath: AppAssets
                                                              .documentTextIcon,
                                                          ontap: () {},
                                                        ),
                                                        CustomFilePickerWidget(
                                                          title: 'Audio',
                                                          iconPath: AppAssets
                                                              .audioIcon,
                                                          ontap: () {},
                                                        ),
                                                        CustomFilePickerWidget(
                                                          title: 'Position',
                                                          iconPath: AppAssets
                                                              .positionIcon,
                                                          ontap: () {},
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                        );
                                      },
                                      child: SvgPicture.asset(
                                        AppAssets.attachmentIcon,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 10,
                                        left: 10,
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          // Add Take Phto From Camera
                                        },
                                        child: SvgPicture.asset(
                                          AppAssets.cameraIcon,
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                hintStyle: TextStyles.smallTextStyle.copyWith(
                                  color: kGreyCOlor,
                                  fontWeight: FontWeight.w300,
                                ),
                                contentPadding: const EdgeInsets.only(
                                  top: 0,
                                  bottom: 0,
                                  left: 20,
                                ),
                                isDense: true,
                                hintText: 'Messages',
                                fillColor:
                                    const Color.fromRGBO(239, 239, 240, 1),
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                enabled: true,
                              ),
                            ),
                          ),
                        ),
                        isTypingText
                            ? InkWell(
                                onTap: () {},
                                child: SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: Card(
                                    color: vetsGreen,
                                    shape: const CircleBorder(),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        AppAssets.sendIcon,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : InkWell(
                                onTap: () {},
                                child: const SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: Card(
                                    color: vetsGreen,
                                    shape: CircleBorder(),
                                    child: Center(
                                      child: Icon(
                                        Icons.mic_outlined,
                                        color: kWhiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

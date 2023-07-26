import 'package:bubble/bubble.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vets_project/core/theme/app_assets.dart';
import 'package:vets_project/core/theme/colors.dart';
import 'package:vets_project/core/theme/styles.dart';
import 'package:vets_project/features/chat/data/models/message_model.dart';

class EmergencyMessageContainerWidget extends StatelessWidget {
  final MessageModel messageModel;
  const EmergencyMessageContainerWidget({
    super.key,
    required this.messageModel,
  });

  @override
  Widget build(BuildContext context) {
    final bool isme =
        messageModel.senderID == FirebaseAuth.instance.currentUser!.uid;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        isme
            ? Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onLongPress: () async {},
                        child: Bubble(
                          elevation: 0,
                          color: const Color.fromRGBO(232, 68, 56, 0.9),
                          radius: const Radius.circular(10),
                          margin: const BubbleEdges.only(top: 10),
                          showNip: false,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              ConstrainedBox(
                                constraints: const BoxConstraints(
                                  minWidth: 50.0,
                                  maxWidth: 250,
                                ),
                                child: Text(
                                  messageModel.messageContentModel.value,
                                  style: TextStyles.baseTextStyle.copyWith(
                                    color: kWhiteColor,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 0,
                                  top: 5,
                                ),
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Row(
                                    children: [
                                      Text(
                                        '${messageModel.sendAt} PM',
                                        style:
                                            TextStyles.baseTextStyle.copyWith(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 10,
                                          color: kWhiteColor,
                                        ),
                                      ),

                                      /// Is the message read  //////
                                      // isReaded
                                      //     ? Padding(
                                      //         padding: const EdgeInsets.only(
                                      //             left: 10),
                                      //         child: SvgPicture.asset(
                                      //           AppAssets.seenIcon,
                                      //           fit: BoxFit.scaleDown,
                                      //         ),
                                      //       )
                                      //     : const SizedBox()
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: CircleAvatar(
                          radius: 9,
                          backgroundImage: AssetImage(
                            AppAssets.userIcon,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Align(
                alignment: Alignment.topLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 15, right: 10, left: 10),
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: kRedColor,
                        child: Image(
                          color: kWhiteColor,
                          height: 15,
                          width: 15,
                          image: AssetImage(
                            AppAssets.logoIcon3,
                          ),
                        ),
                      ),
                    ),
                    Bubble(
                      elevation: 0,
                      color: const Color.fromRGBO(245, 246, 247, 1),
                      radius: const Radius.circular(10),
                      margin: const BubbleEdges.only(top: 10),
                      showNip: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              minWidth: 50.0,
                              maxWidth: 250,
                            ),
                            child: Text(
                              messageModel.messageContentModel.value,
                              style: TextStyles.baseTextStyle.copyWith(
                                color: kDarkCOlor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 0, top: 5),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                '${messageModel.sendAt} PM',
                                style: TextStyles.baseTextStyle.copyWith(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}

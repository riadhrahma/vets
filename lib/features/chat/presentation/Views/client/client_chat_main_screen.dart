import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vets_project/core/global_use/size_config.dart';
import 'package:vets_project/core/theme/app_assets.dart';
import 'package:vets_project/core/theme/colors.dart';
import 'package:vets_project/core/theme/styles.dart';

class ClientChatMainScreen extends StatelessWidget {
  const ClientChatMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 246, 247, 1),
      appBar: AppBar(
        actions: [
          SvgPicture.asset(
            AppAssets.searchIcon,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 25, left: 15),
            child: SvgPicture.asset(
              AppAssets.unionIcon,
            ),
          ),
        ],
        centerTitle: true,
        title: Text(
          'Messagerie',
          style: TextStyles.baseTextStyle
              .copyWith(fontWeight: FontWeight.w600, fontSize: 16),
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
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SizedBox(
        width: SizeConfig().widht,
        height: SizeConfig().height,
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              SizedBox(
                height: 90,
                child: ListTile(
                  onTap: () {},
                  horizontalTitleGap: 3,
                  minVerticalPadding: 15,
                  tileColor: kWhiteColor,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Dr Vets',
                            style: TextStyles.baseTextStyle.copyWith(
                              color: kGreyCOlor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            '(urgentiste)',
                            style: TextStyles.baseTextStyle.copyWith(
                              color: kGreyCOlor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            AppAssets.seenIcon,
                            color: kBlueColor,
                            fit: BoxFit.scaleDown,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              '1:15 PM',
                              style: TextStyles.smallTextStyle.copyWith(
                                fontWeight: FontWeight.w400,
                                color: kGreyCOlor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  leading: SizedBox(
                    height: 50,
                    width: 52,
                    child: Stack(
                      children: const [
                        CircleAvatar(
                          radius: 23,
                          backgroundColor: kRedColor,
                          child: Image(
                            color: kWhiteColor,
                            height: 30,
                            width: 30,
                            image: AssetImage(
                              AppAssets.logoIcon3,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: SizedBox(
                            height: 22,
                            width: 22,
                            child: Card(
                              color: kBlueColor,
                              elevation: 0,
                              shape: CircleBorder(
                                side: BorderSide(
                                  width: 2,
                                  color: kWhiteColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  subtitle: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 180,
                              maxHeight: 100,
                            ),
                            child: Text(
                              'Votre animal nécessite un transport à la clinique.',
                              style: TextStyles.baseTextStyle.copyWith(
                                color: kGreyCOlor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: Card(
                          color: const Color.fromRGBO(77, 122, 188, 1),
                          shape: const CircleBorder(),
                          child: Center(
                            child: Text(
                              '1',
                              style: TextStyles.baseTextStyle.copyWith(
                                color: kWhiteColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 15.5,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

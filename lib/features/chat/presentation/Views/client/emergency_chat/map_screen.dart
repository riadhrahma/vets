import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:vets_project/core/global_use/size_config.dart';
import 'package:vets_project/core/theme/app_assets.dart';
import 'package:vets_project/core/theme/colors.dart';
import 'package:vets_project/core/theme/styles.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.keyboard_backspace,
            color: kDarkCOlor,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
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
                    AppAssets.mapImage,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, right: 30),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  color: Colors.transparent,
                  height: 200,
                  width: 150,
                  child: Stack(
                    fit: StackFit.loose,
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Positioned(
                        top: 20,
                        child: SizedBox(
                          height: 72,
                          width: 129,
                          child: Card(
                            color: kWhiteColor,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tagamuta',
                                    style: TextStyles.baseTextStyle.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: kGreyCOlor),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Ariena',
                                          style: TextStyles.smallTextStyle
                                              .copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: kGreyCOlor,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            right: 5,
                                            left: 5,
                                          ),
                                          child: Text(
                                            '<',
                                            style: TextStyles.smallTextStyle
                                                .copyWith(
                                              fontWeight: FontWeight.w400,
                                              color: kGreyCOlor,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '6km',
                                          style: TextStyles.smallTextStyle
                                              .copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: kGreyCOlor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 25),
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: Card(
                              shape: CircleBorder(
                                side: BorderSide(
                                  width: 2,
                                  color: kRedColor,
                                ),
                              ),
                              child: Center(
                                child: CircleAvatar(
                                  radius: 13,
                                  backgroundImage: NetworkImage(
                                    'https://expertphotography.b-cdn.net/wp-content/uploads/2020/08/profile-photos-4.jpg',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: const BoxDecoration(
                  color: kGreyCOlor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                width: SizeConfig().widht,
                height: 200,
                child: Stack(
                  children: [
                    Positioned(
                      top: 25,
                      left: 30,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Départ',
                                style: TextStyles.smallTextStyle.copyWith(
                                  color: kLightGreyColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                              ),
                              Text(
                                'Manar 2',
                                style: TextStyles.baseTextStyle.copyWith(
                                  color: kWhiteColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: SvgPicture.asset(
                              AppAssets.sendIcon,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Arrivé',
                                style: TextStyles.smallTextStyle.copyWith(
                                  color: kLightGreyColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                              ),
                              Text(
                                'Ariena',
                                style: TextStyles.baseTextStyle.copyWith(
                                  color: kWhiteColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: SizedBox(
                        height: 120,
                        width: SizeConfig().widht,
                        child: Card(
                          margin: const EdgeInsets.all(0),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Arrive dans',
                                  style: TextStyles.smallTextStyle.copyWith(
                                    color: kRedColor,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: SlideCountdown(
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, left: 10),
                                      child: Text(
                                        'Min',
                                        style:
                                            TextStyles.smallTextStyle.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: kRedColor.withOpacity(0.7),
                                        ),
                                      ),
                                    ),
                                    padding: const EdgeInsets.all(0),
                                    textStyle:
                                        TextStyles.largeTextStyle.copyWith(
                                      fontSize: 32,
                                      color: kRedColor,
                                    ),
                                    decoration: const BoxDecoration(
                                        color: Colors.transparent),
                                    duration: const Duration(minutes: 17),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      right: 0,
                      top: 50,
                      child: Image(
                        fit: BoxFit.scaleDown,
                        image: AssetImage(
                          AppAssets.ambulanceFullIcon,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 220,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  height: 80,
                  width: SizeConfig().widht,
                  child: Card(
                    elevation: 1,
                    shadowColor: kGreyCOlor.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 5, right: 20, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 60,
                            width: 60,
                            child: Card(
                              shape: CircleBorder(
                                side: BorderSide(
                                  width: 1,
                                  color: kRedColor,
                                ),
                              ),
                              child: Center(
                                child: CircleAvatar(
                                  radius: 23,
                                  backgroundColor: kRedColor,
                                  child: Image(
                                    color: kWhiteColor,
                                    height: 27,
                                    width: 27,
                                    image: AssetImage(
                                      AppAssets.logoIcon3,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dr Vets Urgentiste',
                                  style: TextStyles.baseTextStyle.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Vétérinaire senior',
                                  style: TextStyles.smallTextStyle.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: kGreyCOlor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: InkWell(
                              onTap: () {},
                              child: SizedBox(
                                height: 50,
                                width: 50,
                                child: Card(
                                  elevation: 0,
                                  shape: const CircleBorder(),
                                  color: kLightRedColor,
                                  child: Center(
                                    child: SvgPicture.asset(
                                      AppAssets.callIcon,
                                      fit: BoxFit.scaleDown,
                                      color: kRedColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 300,
              left: 70,
              child: Bubble(
                radius: const Radius.circular(10),
                elevation: 3,
                nip: BubbleNip.rightCenter,
                child: SizedBox(
                  height: 40,
                  width: 80,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Route X',
                          style: TextStyles.smallTextStyle.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Text(
                            'Reste 2,5km',
                            style: TextStyles.smallTextStyle.copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vets_project/core/global_use/size_config.dart';
import 'package:vets_project/core/routes/routes.dart';
import 'package:vets_project/core/theme/app_assets.dart';
import 'package:vets_project/core/theme/colors.dart';
import 'package:vets_project/core/theme/styles.dart';
import 'package:vets_project/core/values/constant_strings.dart';
import 'package:vets_project/features/home/presentation/widgets/home_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(51, 70, 94, 1),
        elevation: 0,
        leading: InkWell(
          onTap: () {},
          child: SvgPicture.asset(
            AppAssets.menuIcon,
            fit: BoxFit.scaleDown,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.chatMainScreenClient);
              },
              child: SvgPicture.asset(
                AppAssets.chatIcon,
              ),
            ),
          )
        ],
      ),
      backgroundColor: kScaffoldBackgroundCOlor,
      extendBody: false,
      extendBodyBehindAppBar: false,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: SizeConfig().widht,
              height: 200,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(51, 70, 94, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 40,
              child: Image.asset(
                AppAssets.petIcon,
                color: kDarkCOlor,
                height: 100,
                width: 100,
              ),
            ),
            Positioned(
              left: 10,
              bottom: 20,
              child: Image.asset(
                AppAssets.petIcon,
                color: kDarkCOlor,
                height: 70,
                width: 70,
              ),
            ),
            Positioned(
              top: 50,
              right: -50,
              child: Image.asset(AppAssets.petIcon),
            ),
            Positioned(
              top: 70,
              left: 40,
              child: Image.asset(
                AppAssets.petIcon,
                height: 65,
                width: 65,
              ),
            ),
            Positioned(
              top: 20,
              left: 0,
              right: 100,
              child: Image.asset(
                AppAssets.petIcon,
                height: 30,
                width: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Card(
                margin: const EdgeInsets.only(top: 0.0),
                elevation: 0,
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    children: [
                      const Image(
                        image: AssetImage(AppAssets.personIcon),
                        fit: BoxFit.fill,
                      ),
                      Text(
                        welcomeText,
                        style: TextStyles.smallTextStyle.copyWith(
                          height: 0,
                          color: kLightGreyColor.withOpacity(0.7),
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Text(
                        'Tagamuta',
                        style: TextStyles.largeWhiteTextStyle.copyWith(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: SvgPicture.asset(
                          AppAssets.whiteVipBadgeIcon,
                          fit: BoxFit.scaleDown,
                        ),
                      ),

                      HomeCardWidget(
                        icon: AppAssets.askIcon,
                        color: kLightGreen,
                        title: askAQuestionText,
                        sloaganTitile: questionsSloganText,
                        navigationFunction: () {
                          Navigator.pushNamed(
                            context,
                            Routes.selectPetChatGeneralScreen,
                          );
                        },
                      ),

                      ///////////////// Chat Emergency /////////////////
                      HomeCardWidget(
                        icon: AppAssets.emergencyIcon,
                        color: kLightRedColor,
                        title: emergencyContactText,
                        sloaganTitile: emergencySloganText,
                        navigationFunction: () {
                          Navigator.pushNamed(
                            context,
                            Routes.selectPetEmergencyScreen,
                          );
                        },
                      ),

                      ///////////////// Appointment /////////////////
                      HomeCardWidget(
                        icon: AppAssets.calendarIcon,
                        color: kLightBlueColor,
                        title: maekAnAppointmentText,
                        sloaganTitile: appointmentSloganText,
                        navigationFunction: () {},
                      ),

                      ///////////////// Pets Managment /////////////////
                      Padding(
                        padding: const EdgeInsets.only(bottom: 100),
                        child: HomeCardWidget(
                          icon: AppAssets.myPetsIcon,
                          color: const Color.fromRGBO(253, 243, 225, 1),
                          title: myPtesText,
                          sloaganTitile: myPetsSloganText,
                          navigationFunction: () {
                            Navigator.pushNamed(
                              context,
                              Routes.myPetScreen,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // const Positioned(
            //   left: 0,
            //   right: 0,
            //   child: Image(
            //     width: 150,
            //     height: 150,
            //     fit: BoxFit.contain,
            //     image: AssetImage(
            //       AppAssets.personIcon,
            //     ),
            //   ),
            // ),
            // Positioned(
            //   top: 100,
            //   right: 0,
            //   left: 100,
            //   child: TakePhotoWidget(
            //     ontap: () {},
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
// Stack(
//       fit: StackFit.expand,
//       children: [
//         Scaffold(
//           appBar: AppBar(
//             toolbarHeight: 250,
//             automaticallyImplyLeading: false,
//             elevation: 0,
//             backgroundColor: kGreyCOlor,
//             shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.vertical(
//                 bottom: Radius.circular(40),
//               ),
//             ),
//           ),
//           backgroundColor: kScaffoldBackgroundCOlor,
//           extendBody: false,
//           extendBodyBehindAppBar: true,
//           body: Column(
//             children: const [],
//           ),
//         ),
//         Positioned(
//           top: 100,
//           right: -50,
//           child: Image.asset(AppAssets.petIcon),
//         ),
//         Positioned(
//           top: 130,
//           left: 40,
//           child: Image.asset(
//             AppAssets.petIcon,
//             height: 65,
//             width: 65,
//           ),
//         ),
//         Positioned(
//           top: 50,
//           left: -80,
//           right: 0,
//           child: Image.asset(
//             AppAssets.petIcon,
//             height: 30,
//             width: 30,
//           ),
//         ),
//         Positioned(
//           top: 40,
//           left: 20,
//           right: 20,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               InkWell(
//                 onTap: () {
//                   print(DateTime.now());
//                 },
//                 child: SvgPicture.asset(
//                   AppAssets.menuIcon,
//                   fit: BoxFit.scaleDown,
//                 ),
//               ),
//               SvgPicture.asset(
//                 AppAssets.chatIcon,
//               )
//             ],
//           ),
//         ),
//         Positioned(
//           left: 0,
//           right: 0,
//           top: 50,
//           child: Padding(
//             padding: const EdgeInsets.only(left: 16, right: 16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Image(
//                   image: AssetImage(AppAssets.personIcon),
//                   fit: BoxFit.cover,
//                 ),
//                 Text(
//                   welcomeText,
//                   style: TextStyles.smallTextStyle.copyWith(
//                     color: kLightGreyColor.withOpacity(0.7),
//                     decoration: TextDecoration.none,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 20),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Tagamuta',
//                         style: TextStyles.largeWhiteTextStyle.copyWith(),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 5),
//                         child: SvgPicture.asset(
//                           AppAssets.badgeIcon,
//                           fit: BoxFit.scaleDown,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 ////////////////////////////////////// Cards //////////////////////////////////////////////
//                 SizedBox(
//                   height: height,
//                   child: SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         ///////////////// Chat Ask Questuions /////////////////
//                         HomeCardWidget(
//                           icon: AppAssets.askIcon,
//                           color: kLightGreen,
//                           title: askAQuestionText,
//                           sloaganTitile: questionsSloganText,
//                           navigationFunction: () {
//                             Navigator.pushNamed(
//                               context,
//                               Routes.selectPetChatGeneralScreen,
//                             );
//                           },
//                         ),

//                         ///////////////// Chat Emergency /////////////////
//                         HomeCardWidget(
//                           icon: AppAssets.emergencyIcon,
//                           color: kLightRedColor,
//                           title: emergencyContactText,
//                           sloaganTitile: emergencySloganText,
//                           navigationFunction: () {
//                             Navigator.pushNamed(
//                               context,
//                               Routes.selectPetEmergencyScreen,
//                             );
//                           },
//                         ),

//                         ///////////////// Appointment /////////////////
//                         HomeCardWidget(
//                           icon: AppAssets.calendarIcon,
//                           color: kLightBlueColor,
//                           title: maekAnAppointmentText,
//                           sloaganTitile: appointmentSloganText,
//                           navigationFunction: () {},
//                         ),

//                         ///////////////// Pets Managment /////////////////
//                         Padding(
//                           padding: const EdgeInsets.only(bottom: 100),
//                           child: HomeCardWidget(
//                             icon: AppAssets.myPetsIcon,
//                             color: const Color.fromRGBO(253, 243, 225, 1),
//                             title: myPtesText,
//                             sloaganTitile: myPetsSloganText,
//                             navigationFunction: () {
//                               Navigator.pushNamed(
//                                 context,
//                                 Routes.myPetScreen,
//                               );
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         )
//       ],

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vets_project/common_widgets/buttons/primary_button.dart';
import 'package:vets_project/common_widgets/dividers/custom_divider.dart';
import 'package:vets_project/common_widgets/pets/pet_card_widget.dart';
import 'package:vets_project/core/global_use/size_config.dart';
import 'package:vets_project/core/routes/routes.dart';
import 'package:vets_project/core/theme/app_assets.dart';
import 'package:vets_project/core/theme/colors.dart';
import 'package:vets_project/core/theme/styles.dart';
import 'package:vets_project/core/values/constant_strings.dart';
import 'package:vets_project/features/chat/presentation/Widgets/transport_manner_widget.dart';

class SelectTrasnportMannerScreen extends StatefulWidget {
  const SelectTrasnportMannerScreen({Key? key}) : super(key: key);

  @override
  State<SelectTrasnportMannerScreen> createState() =>
      _SelectTrasnportMannerScreenState();
}

class _SelectTrasnportMannerScreenState
    extends State<SelectTrasnportMannerScreen> {
  bool isClinicTransportSelected = false;
  bool isCLientTransportSelected = false;
  bool isHomeActSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackgroundCOlor,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset(
            AppAssets.arrowLeftIcon,
            fit: BoxFit.scaleDown,
          ),
        ),
        title: Text(
          emergencyConfirmedText,
          style: TextStyles.baseTextStyle.copyWith(fontWeight: FontWeight.w600),
        ),
        backgroundColor: kScaffoldBackgroundCOlor,
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  right: 20,
                  left: 20,
                  top: 20,
                ),
                child: PetCardPreviewWidget(
                  petName: 'Mizo',
                  petAge: '1',
                  petImageUrl: AppAssets.petImageFullWidth,
                  petSpecies: 'Chien',
                  petIcon: AppAssets.dogIcon,
                  petBreed: 'Race pure',
                  petGender: 'Male',
                  petWeight: 3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: SizedBox(
                  width: SizeConfig().widht,
                  height: 150,
                  child: Card(
                    elevation: 0,
                    color: const Color.fromRGBO(244, 228, 228, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20, right: 20, left: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 18,
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
                              Flexible(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 10),
                                  child: Text(
                                    yourPetNeedEmergencyTransportText,
                                    style: TextStyles.baseTextStyle.copyWith(
                                      color: kRedColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              SvgPicture.asset(
                                AppAssets.emergencyIcon,
                                height: 25,
                                width: 25,
                                fit: BoxFit.scaleDown,
                              ),
                            ],
                          ),
                          const Padding(
                            padding:
                                EdgeInsets.only(left: 60, top: 5, bottom: 5),
                            child: CustomDividerWidget(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 65),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Dr.Vets',
                                      style: TextStyles.smallTextStyle.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child:
                                          SvgPicture.asset(AppAssets.smsIcon),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Vétérinaire urgentiste',
                                    style: TextStyles.smallTextStyle
                                        .copyWith(fontSize: 10),
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
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                child: Text(
                  'Quel transport souhaitez-vous?   ',
                  style: TextStyles.meduimTextSTyle.copyWith(
                    fontWeight: FontWeight.w700,
                    color: kDarkCOlor,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Column(
                  children: [
                    TransportMannerCardWidget(
                      type: 'Clinic',
                      iselected: isClinicTransportSelected,
                      title: 'Transport animalier médicalisé',
                      subTitile:
                          'Au delà de 20km de la clinique, 2DT/km supplémentaire',
                      icon: AppAssets.ambulanceIcon,
                      ontap: () {
                        setState(() {
                          isClinicTransportSelected = true;
                          isCLientTransportSelected = false;
                          isHomeActSelected = false;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: TransportMannerCardWidget(
                        type: 'Home',
                        iselected: isCLientTransportSelected,
                        title:
                            'Déplacement équipe d’urgence à domicile (Transport + Consultation)',
                        subTitile:
                            'Au delà de 20km de la clinique, 3DT/km supplémentaire',
                        icon: AppAssets.homeIcon,
                        ontap: () {
                          setState(() {
                            isClinicTransportSelected = false;
                            isCLientTransportSelected = true;
                            isHomeActSelected = false;
                          });
                        },
                      ),
                    ),
                    TransportMannerCardWidget(
                      type: 'Car',
                      iselected: isHomeActSelected,
                      title:
                          "Transport animalier à la clinique par votre propre moyen",
                      subTitile:
                          'Integer malesuada tristique risus, eget commodo ante',
                      icon: AppAssets.carIcon,
                      ontap: () {
                        setState(() {
                          isClinicTransportSelected = false;
                          isCLientTransportSelected = false;
                          isHomeActSelected = true;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  right: 40,
                  left: 40,
                  bottom: 20,
                ),
                child: PrimaryButtonWidget(
                  text: continueText,
                  onPress: () {
                    Navigator.pushNamed(
                      context,
                      Routes.mapScreen,
                    );
                  },
                  color: kRedColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

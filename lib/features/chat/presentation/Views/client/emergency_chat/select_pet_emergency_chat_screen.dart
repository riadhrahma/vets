import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vets_project/common_widgets/buttons/primary_button.dart';
import 'package:vets_project/core/routes/routes.dart';
import 'package:vets_project/core/theme/app_assets.dart';
import 'package:vets_project/core/theme/colors.dart';
import 'package:vets_project/core/theme/styles.dart';
import 'package:vets_project/core/values/constant_strings.dart';
import 'package:vets_project/features/chat/presentation/Widgets/pets/chat_type_card_widget.dart';
import 'package:vets_project/features/chat/presentation/Widgets/pets/pet_card_emergency_widget.dart';
import 'package:vets_project/features/pets_management/data/models/pet_model.dart';

class SelectYourPetScreenEmergency extends StatefulWidget {
  const SelectYourPetScreenEmergency({Key? key}) : super(key: key);

  @override
  State<SelectYourPetScreenEmergency> createState() =>
      _SelectYourPetScreenEmergencyState();
}

class _SelectYourPetScreenEmergencyState
    extends State<SelectYourPetScreenEmergency> {
  String id = '';
  List<PetModel> myPets = [
    PetModel(
      id: '1',
      name: 'Mizo',
      age: DateTime.now(),
      species: 'Dog',
      breed: '',
      color: '',
      weight: 0,
      gender: 'gender',
      photoURL: AppAssets.petImage,
      ownerID: '',
      doctorsID: const ['', ''],
    ),
    PetModel(
      id: '2',
      name: 'Sima',
      age: DateTime.now(),
      species: 'Cat',
      breed: '',
      color: '',
      weight: 0,
      gender: 'gender',
      photoURL: AppAssets.catImage,
      ownerID: '',
      doctorsID: const ['', ''],
    ),
    PetModel(
      id: '3',
      name: 'Bouya',
      age: DateTime.now(),
      species: 'Camelon',
      breed: '',
      color: '',
      weight: 0,
      gender: 'gender',
      photoURL: AppAssets.camelonImage,
      ownerID: '',
      doctorsID: const ['', ''],
    ),
    PetModel(
      id: '4',
      name: 'ZiwZiw',
      age: DateTime.now(),
      species: 'Bird',
      breed: '',
      color: '',
      weight: 0,
      gender: 'gender',
      photoURL: AppAssets.birdImage,
      ownerID: '',
      doctorsID: const ['', ''],
    ),
    PetModel(
      id: '5',
      name: 'Autre animal',
      age: DateTime.now(),
      species: '',
      breed: '',
      color: '',
      weight: 0,
      gender: '',
      photoURL: AppAssets.birdImage,
      ownerID: '',
      doctorsID: const ['', ''],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          emergencyContactText,
          style: TextStyles.baseTextStyle.copyWith(
            fontWeight: FontWeight.w600,
            color: kDarkCOlor,
          ),
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
      ),
      extendBodyBehindAppBar: false,
      backgroundColor: kScaffoldBackgroundCOlor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ChatTypeCardWidget(
              color: kRedColor,
              icon: AppAssets.emergencyIcon,
              title: emergencyContactText,
              subTitle: emergencySloganText,
              iconCardColor: Color.fromRGBO(232, 84, 72, 1),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 40, bottom: 20, left: 16, right: 16),
              child: Text(
                whatYouPetQuestionText,
                style: TextStyles.meduimTextSTyle.copyWith(
                  fontWeight: FontWeight.w700,
                  color: kDarkCOlor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: GridView.builder(
                padding: const EdgeInsets.all(0),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemCount: myPets.length,
                itemBuilder: (BuildContext context, i) {
                  return PetEmergencyCardWidget(
                    ontap: () {
                      setState(() {
                        id = myPets[i].id;
                      });
                    },
                    petID: myPets[i].id,
                    petImage: myPets[i].photoURL,
                    petName: myPets[i].name,
                    petSpecies: myPets[i].species,
                    isSelected: id == myPets[i].id,
                    speciesIcon: myPets[i].species == 'Dog'
                        ? AppAssets.dogIcon
                        : myPets[i].species == 'Cat'
                            ? AppAssets.catIcon
                            : myPets[i].species == 'Camelon'
                                ? AppAssets.camelonIcon
                                : AppAssets.birdIcon,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    id = '';
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppAssets.closeIcon,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        cancelSelectText,
                        style: TextStyles.baseTextStyle.copyWith(
                          color: kDarkCOlor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 20, top: 20),
              child: PrimaryButtonWidget(
                text: continueText,
                onPress: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      title: const Text(
                        emergencyServiceText,
                        style: TextStyles.largeTextStyle,
                      ),
                      content: Text(
                        doYouWantToMakeAnEmergencyCallText,
                        style: TextStyles.baseTextStyle.copyWith(
                            color: kGreyCOlor, fontWeight: FontWeight.w400),
                      ),
                      actions: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: Text(
                                  cancelText,
                                  style: TextStyles.baseTextStyle.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: kDarkCOlor.withOpacity(0.5),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, Routes.emergencyChatRoomScreen);
                                },
                                child: Text(
                                  confirmText,
                                  style: TextStyles.baseTextStyle.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: kBlueColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

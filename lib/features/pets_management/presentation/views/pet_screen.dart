import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vets_project/common_widgets/buttons/primary_button.dart';
import 'package:vets_project/core/routes/routes.dart';
import 'package:vets_project/core/theme/app_assets.dart';
import 'package:vets_project/core/theme/colors.dart';
import 'package:vets_project/core/theme/styles.dart';
import 'package:vets_project/core/values/constant_strings.dart';
import 'package:vets_project/features/pets_management/data/models/pet_model.dart';
import 'package:vets_project/features/pets_management/presentation/widgets/my_pet_card_widget.dart';
import 'package:vets_project/features/pets_management/presentation/widgets/pet_icon_model.dart';
import 'package:vets_project/features/pets_management/presentation/widgets/pet_species_card.dart';

class MyPetsScreen extends StatelessWidget {
  const MyPetsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<PetIconModel> species = [
      PetIconModel(
        iconUrl: AppAssets.petsSmallIcon,
        species: 'Tous',
        isSelected: true,
      ),
      PetIconModel(
        iconUrl: AppAssets.dogIcon,
        species: 'Chien',
        isSelected: false,
      ),
      PetIconModel(
        iconUrl: AppAssets.catIcon,
        species: 'Chat',
        isSelected: false,
      ),
      PetIconModel(
        iconUrl: AppAssets.camelonIcon,
        species: 'Camelon',
        isSelected: false,
      ),
    ];
    List<PetModel> myPets = [
      PetModel(
        id: '1',
        name: 'Mizo',
        age: DateTime.parse('2020-09-06 23:39:16.138511'),
        species: 'Dog',
        breed: ' Race pure',
        color: '',
        weight: 3,
        gender: 'gender',
        photoURL: AppAssets.petImage,
        ownerID: '',
        doctorsID: const ['', ''],
      ),
      PetModel(
        id: '2',
        name: 'Sima',
        age: DateTime.parse('2020-09-06 23:39:16.138511'),
        species: 'Cat',
        breed: 'Ragdoll',
        color: '',
        weight: 3,
        gender: 'gender',
        photoURL: AppAssets.catImage,
        ownerID: '',
        doctorsID: const ['', ''],
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kScaffoldBackgroundCOlor,
        elevation: 0.5,
        centerTitle: true,
        title: Text(
          myPtesText,
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              child: SvgPicture.asset(AppAssets.unionIcon),
            ),
          )
        ],
      ),
      extendBodyBehindAppBar: false,
      backgroundColor: kScaffoldBackgroundCOlor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 20,
                bottom: 20,
              ),
              child: Text(
                myPtesText,
                style: TextStyles.meduimTextSTyle
                    .copyWith(color: kGreyCOlor, fontWeight: FontWeight.w700),
              ),
            ),
            StatefulBuilder(
              builder: ((context, setState) {
                return SizedBox(
                  height: 60,
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(left: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: species.length,
                    itemBuilder: (context, index) {
                      final myspecies = species[index];
                      return PetSpeciesCard(
                        onSelected: (value) {
                          setState(
                            () {
                              myspecies.isSelected = value;
                            },
                          );
                        },
                        isSelected: myspecies.isSelected,
                        title: myspecies.species,
                        icon: myspecies.iconUrl,
                      );
                    },
                  ),
                );
              }),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: myPets.length,
              itemBuilder: (context, index) {
                final pets = myPets[index];

                return Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: MyPetCardPreviewWidget(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.petDetailsScreen,
                      );
                    },
                    isArchived: false,
                    petName: pets.name,
                    petAge: (DateTime.now().year - pets.age.year).toString(),
                    petImageUrl: pets.photoURL,
                    petSpecies: pets.species == 'Cat' ? 'Chat' : 'Chien',
                    petIcon: pets.species == 'Cat'
                        ? AppAssets.catIcon
                        : AppAssets.dogIcon,
                    petBreed: pets.breed,
                    petGender: pets.gender,
                    petWeight: pets.weight,
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 40,
                bottom: 20,
                left: 40,
                right: 40,
              ),
              child: PrimaryButtonWidget(
                text: 'Ajouter un animal',
                onPress: () {
                  Navigator.pushNamed(
                    context,
                    Routes.addPetScreen,
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

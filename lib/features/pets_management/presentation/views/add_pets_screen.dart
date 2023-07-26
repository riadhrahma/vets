import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:intl/intl.dart';
import 'package:vets_project/common_widgets/buttons/custom_text_button.dart';
import 'package:vets_project/common_widgets/buttons/primary_button.dart';
import 'package:vets_project/common_widgets/cards/custom_file_picker_widget.dart';
import 'package:vets_project/core/global_use/size_config.dart';
import 'package:vets_project/core/theme/app_assets.dart';
import 'package:vets_project/core/theme/colors.dart';
import 'package:vets_project/core/theme/styles.dart';
import 'package:vets_project/core/values/constant_strings.dart';
import 'package:vets_project/features/pets_management/presentation/widgets/date_text_form_field.dart';
import 'package:vets_project/features/pets_management/presentation/widgets/pet_text_form_field.dart';
import 'package:vets_project/features/profile/presentation/widgets/custom_drop_down_button.dart';

class AddPetScreen extends StatefulWidget {
  const AddPetScreen({Key? key}) : super(key: key);

  @override
  State<AddPetScreen> createState() => _AddPetScreenState();
}

class _AddPetScreenState extends State<AddPetScreen> {
  final TextEditingController dateController = TextEditingController();
  final SingleValueDropDownController genderController =
      SingleValueDropDownController(
    data: const DropDownValueModel(name: maleText, value: 'Male'),
  );
  final SingleValueDropDownController speciesController =
      SingleValueDropDownController(
    data: const DropDownValueModel(name: 'Chien', value: 'Chien'),
  );

  final SingleValueDropDownController breedController =
      SingleValueDropDownController(
    data: const DropDownValueModel(name: 'Веrgеr Аllеmаnd', value: 'Berger'),
  );
  final SingleValueDropDownController colorController =
      SingleValueDropDownController(
    data: const DropDownValueModel(name: 'Noir', value: 'Noir'),
  );
  final SingleValueDropDownController particularSignController =
      SingleValueDropDownController(
    data: const DropDownValueModel(name: 'Autre', value: 'Autre'),
  );
  bool puce = false;
  bool sterility = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(51, 70, 94, 1),
        elevation: 0,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                AppAssets.closeIcon,
                fit: BoxFit.scaleDown,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                'Ajouter un animal',
                style: TextStyles.baseTextStyle.copyWith(
                  color: kWhiteColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 10),
            child: CustomTextButton(
              text: okText,
              onpressed: () {},
            ),
          ),
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
              top: 30,
              right: -50,
              child: Image.asset(AppAssets.petIcon),
            ),
            Positioned(
              top: 100,
              left: 40,
              child: Image.asset(
                AppAssets.petIcon,
                height: 65,
                width: 65,
              ),
            ),
            Positioned(
              top: 10,
              left: -80,
              right: 0,
              child: Image.asset(
                AppAssets.petIcon,
                height: 30,
                width: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Card(
                margin: const EdgeInsets.only(top: 4.0),
                elevation: 0,
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 730,
                        width: SizeConfig().widht,
                        child: Card(
                          elevation: 0.5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                              right: 15,
                              top: 20,
                            ),
                            child: Column(
                              children: [
                                CustomPetTextFormField(
                                  onChanged: (value) {},
                                  textInputType: TextInputType.name,
                                  labelText: nameText,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 20),
                                  child: DateTextFormField(
                                    textEditingController: dateController,
                                    onChanged: (value) {},
                                    textInputType: TextInputType.name,
                                    labelText: 'Date de naissance',
                                    suffixIcon: SvgPicture.asset(
                                      AppAssets.calendarDarkIcon,
                                      fit: BoxFit.scaleDown,
                                    ),
                                    onTap: () async {
                                      await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1900),
                                          lastDate: DateTime(2100),
                                          builder: (context, child) {
                                            return Theme(
                                              data: ThemeData.dark().copyWith(
                                                colorScheme:
                                                    const ColorScheme.light(
                                                  primary: kGreyCOlor,
                                                  onPrimary: Colors.white,
                                                  surface: Colors.pink,
                                                  onSurface: Colors.black,
                                                ),
                                                dialogBackgroundColor:
                                                    Colors.white,
                                              ),
                                              child: child!,
                                            );
                                          }).then((value) {
                                        final DateFormat formatter =
                                            DateFormat('yyyy-MM-dd');
                                        if (value != null) {
                                          final String formatted =
                                              formatter.format(value);

                                          dateController.text = formatted;
                                        }
                                      });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 20),
                                  child: CustomDropDowButton(
                                    label: 'Sexe',
                                    dropDownList: const [
                                      DropDownValueModel(
                                        name: maleText,
                                        value: 'Male',
                                      ),
                                      DropDownValueModel(
                                        name: femaleText,
                                        value: 'Femelle',
                                      ),
                                    ],
                                    singleValueDropDownController:
                                        genderController,
                                  ),
                                ),
                                CustomDropDowButton(
                                  label: 'Espèce',
                                  dropDownList: const [
                                    DropDownValueModel(
                                      name: 'Chien',
                                      value: 'Chien',
                                    ),
                                    DropDownValueModel(
                                      name: 'Chat',
                                      value: 'Cat',
                                    ),
                                  ],
                                  singleValueDropDownController:
                                      speciesController,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 20),
                                  child: CustomDropDowButton(
                                    label: 'Race',
                                    dropDownList: const [
                                      DropDownValueModel(
                                        name: 'Веrgеr Аllеmаnd',
                                        value: 'Berger',
                                      ),
                                      DropDownValueModel(
                                        name: 'Malinois',
                                        value: 'malinois',
                                      ),
                                    ],
                                    singleValueDropDownController:
                                        breedController,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Flexible(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: CustomDropDowButton(
                                          label: 'Couleur',
                                          dropDownList: const [
                                            DropDownValueModel(
                                              name: 'Marron',
                                              value: 'Marron',
                                            ),
                                            DropDownValueModel(
                                              name: 'Blue',
                                              value: 'Blue',
                                            ),
                                          ],
                                          singleValueDropDownController:
                                              colorController,
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 0,
                                        ),
                                        child: CustomPetTextFormField(
                                          onChanged: (value) {},
                                          textInputType: TextInputType.number,
                                          labelText: 'Poids',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                StatefulBuilder(
                                  builder: ((context, setState) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                        top: 20,
                                        bottom: 10,
                                        left: 10,
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Puce électronique',
                                                  style: TextStyles
                                                      .smallTextStyle
                                                      .copyWith(
                                                    color: kGreyCOlor
                                                        .withOpacity(0.5),
                                                  ),
                                                ),
                                                FlutterSwitch(
                                                  activeToggleColor:
                                                      const Color.fromRGBO(
                                                          77, 122, 188, 1),
                                                  inactiveToggleColor:
                                                      kGreyCOlor,
                                                  padding: 0,
                                                  height: 15,
                                                  width: 35,
                                                  toggleSize: 25,
                                                  value: puce,
                                                  activeColor:
                                                      const Color.fromRGBO(
                                                          113, 149, 201, 1),
                                                  inactiveColor:
                                                      const Color.fromRGBO(
                                                          93, 109, 129, 1),
                                                  onToggle: (value) {
                                                    setState(
                                                      () {
                                                        puce = value;
                                                      },
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Stérilisé',
                                                  style: TextStyles
                                                      .smallTextStyle
                                                      .copyWith(
                                                    color: kGreyCOlor
                                                        .withOpacity(0.5),
                                                  ),
                                                ),
                                                FlutterSwitch(
                                                  activeToggleColor:
                                                      const Color.fromRGBO(
                                                          77, 122, 188, 1),
                                                  inactiveToggleColor:
                                                      kGreyCOlor,
                                                  padding: 0,
                                                  height: 15,
                                                  width: 35,
                                                  toggleSize: 25,
                                                  value: sterility,
                                                  activeColor:
                                                      const Color.fromRGBO(
                                                          113, 149, 201, 1),
                                                  inactiveColor:
                                                      const Color.fromRGBO(
                                                          93, 109, 129, 1),
                                                  onToggle: (value) {
                                                    setState(
                                                      () {
                                                        sterility = value;
                                                      },
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                ),
                                CustomDropDowButton(
                                  label: 'Signe particulier',
                                  dropDownList: const [
                                    DropDownValueModel(
                                      name: 'Autre',
                                      value: 'Autre',
                                    ),
                                  ],
                                  singleValueDropDownController:
                                      particularSignController,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 20,
                                  ),
                                  child: CustomPetTextFormField(
                                    onChanged: (value) {},
                                    textInputType: TextInputType.name,
                                    labelText: 'Vétérinaire traitant',
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          right: 20,
                          left: 20,
                          bottom: 20,
                        ),
                        child: PrimaryButtonWidget(
                          text: 'Ajouter à ma liste',
                          onPress: () {},
                        ),
                      ),
                      ////////////////////// Active Client ///////////////////////
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
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
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomFilePickerWidget(
                                          title: 'Gallerie',
                                          iconPath: AppAssets.galleryIcon,
                                          ontap: () {},
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 40),
                                          child: CustomFilePickerWidget(
                                            title: 'Camera',
                                            iconPath: AppAssets.cameraIcon,
                                            ontap: () {},
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                        );
                        // Impelement Function here to take photo
                      },
                      child: CircleAvatar(
                        backgroundColor: kWhiteColor,
                        radius: 30,
                        child: Center(
                          child: SvgPicture.asset(
                            AppAssets.cameraBlueIcon,
                            height: 30,
                            width: 30,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 10),
                      child: Text(
                        'Ajouter une photo de votre animal',
                        style: TextStyles.smallTextStyle.copyWith(
                          color: kWhiteColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(
                      'Cliquez ici',
                      style: TextStyles.baseTextStyle.copyWith(
                        color: kWhiteColor,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

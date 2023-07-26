import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:vets_project/common_widgets/buttons/custom_text_button.dart';
import 'package:vets_project/common_widgets/buttons/primary_button.dart';

import 'package:vets_project/core/global_use/size_config.dart';
import 'package:vets_project/core/theme/app_assets.dart';
import 'package:vets_project/core/theme/colors.dart';
import 'package:vets_project/core/theme/styles.dart';
import 'package:vets_project/core/values/constant_strings.dart';
import 'package:vets_project/features/profile/presentation/widgets/custom_profile_phone_form_field.dart';
import 'package:vets_project/features/profile/presentation/widgets/custom_profile_text_form_field.dart';
import 'package:vets_project/features/profile/presentation/widgets/take_photo_widget.dart';

class VeterinaryProfileScreen extends StatelessWidget {
  const VeterinaryProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(51, 70, 94, 1),
        elevation: 0,
        title: Row(
          children: [
            InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                AppAssets.closeIcon,
                fit: BoxFit.scaleDown,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                myProfileText,
                style: TextStyles.baseTextStyle.copyWith(
                  color: kWhiteColor,
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
              top: 100,
              right: -50,
              child: Image.asset(AppAssets.petIcon),
            ),
            Positioned(
              top: 130,
              left: 40,
              child: Image.asset(
                AppAssets.petIcon,
                height: 65,
                width: 65,
              ),
            ),
            Positioned(
              top: 50,
              left: -80,
              right: 0,
              child: Image.asset(
                AppAssets.petIcon,
                height: 30,
                width: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Card(
                margin: const EdgeInsets.only(top: 4.0),
                elevation: 0,
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    children: [
                      SizedBox(
                        width: SizeConfig().widht,
                        height: 460,
                        child: Card(
                          margin: const EdgeInsets.only(top: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          elevation: 0.5,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 50, left: 16, right: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  personalInformationText,
                                  style: TextStyles.smallTextStyle.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Form(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5, top: 20),
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 130,
                                              child: CustomPofileTextFormField(
                                                onchanged: (value) {},
                                                labelText: nameText,
                                                textInputType:
                                                    TextInputType.name,
                                                obsecureText: false,
                                                initialValue: 'Tagamuta',
                                              ),
                                            ),
                                            SizedBox(
                                              width: 130,
                                              child: CustomPofileTextFormField(
                                                onchanged: (value) {},
                                                labelText: lastNameText,
                                                textInputType:
                                                    TextInputType.name,
                                                obsecureText: false,
                                                initialValue: 'Valley',
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Text(
                                                  genderText,
                                                  style: TextStyles
                                                      .smallTextStyle
                                                      .copyWith(
                                                    color:
                                                        kGreyCOlor.withOpacity(
                                                      0.7,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 10,
                                                ),
                                                child: DropDownTextField(
                                                  clearOption: false,
                                                  textStyle: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  listTextStyle: TextStyles
                                                      .meduimTextSTyle
                                                      .copyWith(
                                                    color: kDarkCOlor,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  initialValue: maleText,
                                                  dropDownList: const [
                                                    DropDownValueModel(
                                                        name: maleText,
                                                        value: 'male'),
                                                    DropDownValueModel(
                                                      name: femaleText,
                                                      value: 'female',
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 20, bottom: 20),
                                          child: CustomProfilePhoneFormField(
                                            onchanged: (value) {},
                                            labelTxt: phoneNumberText,
                                            initialValue: '12345678',
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 20),
                                          child: CustomPofileTextFormField(
                                            onchanged: (value) {},
                                            labelText: addressText,
                                            textInputType:
                                                TextInputType.streetAddress,
                                            obsecureText: false,
                                            initialValue: yourAddressHereText,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(
                                                assuranceText,
                                                style: TextStyles.smallTextStyle
                                                    .copyWith(
                                                  color: kGreyCOlor.withOpacity(
                                                    0.7,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            FlutterSwitch(
                                              activeToggleColor: kBlueColor,
                                              toggleSize: 15,
                                              padding: 0,
                                              height: 15,
                                              width: 35,
                                              value: true,
                                              onToggle: (value) {},
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: SizedBox(
                          width: SizeConfig().widht,
                          height: 230,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            elevation: 0.5,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 16, right: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    accountAccessText,
                                    style: TextStyles.smallTextStyle.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Form(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5, top: 20),
                                      child: Column(
                                        children: [
                                          CustomPofileTextFormField(
                                            onchanged: (value) {},
                                            labelText: addressEmailText,
                                            textInputType:
                                                TextInputType.emailAddress,
                                            obsecureText: false,
                                            initialValue:
                                                'contact@tagamuta-valley.com',
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 20),
                                            child: CustomPofileTextFormField(
                                              suffixIcon: SvgPicture.asset(
                                                AppAssets.eyeIcon,
                                              ),
                                              onchanged: (value) {},
                                              labelText: passwordText,
                                              textInputType: TextInputType.text,
                                              obsecureText: true,
                                              initialValue: '********',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          bottom: 20,
                          left: 20,
                          right: 20,
                        ),
                        child: PrimaryButtonWidget(
                          text: saveText,
                          onPress: () async {},
                        ),
                      ),
                      ////////////////////// Active Client ///////////////////////
                    ],
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 0,
              right: 0,
              child: Image(
                width: 150,
                height: 150,
                fit: BoxFit.contain,
                image: AssetImage(
                  AppAssets.personIcon,
                ),
              ),
            ),
            Positioned(
              top: 100,
              right: 0,
              left: 100,
              child: TakePhotoWidget(
                ontap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

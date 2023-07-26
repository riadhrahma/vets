import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:vets_project/common_widgets/buttons/custom_text_button.dart';
import 'package:vets_project/common_widgets/buttons/primary_button.dart';
import 'package:vets_project/common_widgets/buttons/small_button_widget.dart';
import 'package:vets_project/common_widgets/cards/custom_client_status_card.dart';
import 'package:vets_project/common_widgets/dividers/custom_divider.dart';
import 'package:vets_project/core/global_use/size_config.dart';
import 'package:vets_project/core/routes/routes.dart';
import 'package:vets_project/core/theme/app_assets.dart';
import 'package:vets_project/core/theme/colors.dart';
import 'package:vets_project/core/theme/styles.dart';
import 'package:vets_project/core/values/constant_strings.dart';
import 'package:vets_project/features/authentication/presentation/bloc/client_signup_bloc/client_signup_bloc.dart';
import 'package:vets_project/features/authentication/presentation/bloc/client_signup_bloc/client_signup_state.dart';
import 'package:vets_project/features/authentication/presentation/cubit/client_signup_cubit/client_signup_cubit.dart'
    as cubit;
import 'package:vets_project/features/profile/presentation/widgets/custom_profile_phone_form_field.dart';
import 'package:vets_project/features/profile/presentation/widgets/custom_profile_text_form_field.dart';
import 'package:vets_project/features/profile/presentation/widgets/take_photo_widget.dart';
import 'package:vets_project/injection_container.dart';

import '../../widgets/vip_badges/inactive_vip_badge.dart';
import 'package:vets_project/features/authentication/presentation/cubit/client_signup_cubit/client_signup_state.dart'
    as cubit_state;

class ClientProfileScreen extends StatelessWidget {
  const ClientProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ClientSignupBloc>(
          create: (BuildContext context) => sl<ClientSignupBloc>(),
        ),
        BlocProvider<cubit.ClientSignupCubit>(
          create: (BuildContext context) => cubit.ClientSignupCubit(),
        ),
      ],
      child: BlocListener<ClientSignupBloc, ClientSignupState>(
        listener: (context, state) {
          if (state is UpdateClientSuccess) {
            Navigator.pushNamed(context, Routes.loaderScreen);
          } else if (state is SignupSuccess) {
            Navigator.pushReplacementNamed(context, Routes.homeScreen);
          } else {
            Navigator.pop(context);
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.toString())));
          }
        },
        child: Scaffold(
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: 130,
                                                  child: BlocBuilder<
                                                      cubit.ClientSignupCubit,
                                                      cubit_state
                                                          .ClientSignupState>(
                                                    builder: (context, state) {
                                                      return CustomPofileTextFormField(
                                                        onchanged: (value) => context
                                                            .read<
                                                                cubit
                                                                    .ClientSignupCubit>()
                                                            .firstNameChanged(
                                                                value),
                                                        errorText: (state
                                                                is cubit_state
                                                                    .ClientWrongFirstNameState)
                                                            ? 'invalid first name'
                                                            : null,
                                                        labelText: nameText,
                                                        textInputType:
                                                            TextInputType.name,
                                                        obsecureText: false,
                                                        initialValue:
                                                            'Tagamuta',
                                                      );
                                                    },
                                                    buildWhen:
                                                        (oldSate, latestState) {
                                                      return oldSate !=
                                                          latestState;
                                                    },
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 130,
                                                  child: BlocBuilder<
                                                      cubit.ClientSignupCubit,
                                                      cubit_state
                                                          .ClientSignupState>(
                                                    builder: (context, state) {
                                                      return CustomPofileTextFormField(
                                                        onchanged: (value) => context
                                                            .read<
                                                                cubit
                                                                    .ClientSignupCubit>()
                                                            .lastNameChanged(
                                                                value),
                                                        initialValue: '',
                                                        textInputType:
                                                            TextInputType.text,
                                                        labelText: lastNameText,
                                                        obsecureText: false,
                                                        errorText:
                                                            //todo add translate
                                                            (state is cubit_state
                                                                    .ClientWrongLastNameState)
                                                                ? 'invalid last name'
                                                                : null,
                                                      );
                                                    },
                                                    buildWhen:
                                                        (oldSate, latestState) {
                                                      return oldSate !=
                                                          latestState;
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: Text(
                                                      genderText,
                                                      style: TextStyles
                                                          .smallTextStyle
                                                          .copyWith(
                                                        color: kGreyCOlor
                                                            .withOpacity(
                                                          0.7,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 10,
                                                    ),
                                                    child: BlocBuilder<
                                                        cubit.ClientSignupCubit,
                                                        cubit_state
                                                            .ClientSignupState>(
                                                      builder:
                                                          (context, state) {
                                                        return DropDownTextField(
                                                          clearOption: false,
                                                          textStyle:
                                                              const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                          listTextStyle:
                                                              TextStyles
                                                                  .meduimTextSTyle
                                                                  .copyWith(
                                                            color: kDarkCOlor,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                          initialValue:
                                                              maleText,
                                                          onChanged: (value) =>
                                                              context
                                                                  .read<
                                                                      cubit
                                                                          .ClientSignupCubit>()
                                                                  .genderChanged(
                                                                      value),
                                                          dropDownList: const [
                                                            DropDownValueModel(
                                                                name: maleText,
                                                                value: 'male'),
                                                            DropDownValueModel(
                                                              name: femaleText,
                                                              value: 'female',
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20, bottom: 20),
                                              child: BlocBuilder<
                                                  cubit.ClientSignupCubit,
                                                  cubit_state
                                                      .ClientSignupState>(
                                                builder: (context, state) {
                                                  return CustomProfilePhoneFormField(
                                                    onchanged: (value) => context
                                                        .read<
                                                            cubit
                                                                .ClientSignupCubit>()
                                                        .phoneNumberChanged(
                                                            value),
                                                    initialValue: '',
                                                    errorText:
                                                        //todo add translate
                                                        (state is cubit_state
                                                                .ClientWrongPhoneNumberState)
                                                            ? 'invalid phone number'
                                                            : null,
                                                    labelTxt: 'phone number',
                                                  );
                                                },
                                                buildWhen:
                                                    (oldSate, latestState) {
                                                  return oldSate != latestState;
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 20),
                                              child: BlocBuilder<
                                                  cubit.ClientSignupCubit,
                                                  cubit_state
                                                      .ClientSignupState>(
                                                builder: (context, state) {
                                                  return CustomPofileTextFormField(
                                                    onchanged: (value) => context
                                                        .read<
                                                            cubit
                                                                .ClientSignupCubit>()
                                                        .addressChanged(value),
                                                    errorText: (state is cubit_state
                                                            .ClientWrongAddressState)
                                                        ? 'invalid address'
                                                        : null,
                                                    labelText: addressText,
                                                    textInputType: TextInputType
                                                        .streetAddress,
                                                    obsecureText: false,
                                                    initialValue: '',
                                                  );
                                                },
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: Text(
                                                    assuranceText,
                                                    style: TextStyles
                                                        .smallTextStyle
                                                        .copyWith(
                                                      color: kGreyCOlor
                                                          .withOpacity(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        accountAccessText,
                                        style:
                                            TextStyles.smallTextStyle.copyWith(
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
                                                padding: const EdgeInsets.only(
                                                    top: 20),
                                                child:
                                                    CustomPofileTextFormField(
                                                  suffixIcon: SvgPicture.asset(
                                                    AppAssets.eyeIcon,
                                                  ),
                                                  onchanged: (value) {},
                                                  labelText: passwordText,
                                                  textInputType:
                                                      TextInputType.text,
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
                          ////////// Inactive Client ////////////////////
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: InactiveVipBadge(
                              ontap: () async {
                                await showModalBottomSheet<void>(
                                  backgroundColor: Colors.transparent,
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SingleChildScrollView(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom,
                                        ),
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: kWhiteColor,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                            ),
                                          ),
                                          height: 300,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              top: 20,
                                              right: 16,
                                              left: 16,
                                            ),
                                            child: Column(
                                              children: [
                                                ListTile(
                                                  horizontalTitleGap: 22,
                                                  title: Row(
                                                    children: [
                                                      Text(
                                                        'Tagamuta Valley',
                                                        style: TextStyles
                                                            .baseTextStyle
                                                            .copyWith(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      const CustomCLientStatusCard()
                                                    ],
                                                  ),
                                                  subtitle: Text(
                                                    'contact@tagamuta-valley.com',
                                                    style: TextStyles
                                                        .baseTextStyle
                                                        .copyWith(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                                  leading: const CircleAvatar(
                                                    radius: 30,
                                                    backgroundImage:
                                                        NetworkImage(
                                                      'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg',
                                                    ),
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                    bottom: 30,
                                                  ),
                                                  child: CustomDividerWidget(),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 40),
                                                  child: Text(
                                                    youHaveACLientCodeText,
                                                    style: TextStyles
                                                        .meduimTextSTyle
                                                        .copyWith(
                                                      color: kDarkCOlor,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 20),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Flexible(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 10),
                                                          child:
                                                              CustomPofileTextFormField(
                                                            onchanged:
                                                                (value) {},
                                                            labelText:
                                                                clientCodeText,
                                                            textInputType:
                                                                TextInputType
                                                                    .number,
                                                            obsecureText: false,
                                                            initialValue: '',
                                                          ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                            left: 20,
                                                            top: 25,
                                                          ),
                                                          child:
                                                              CustomSmallButton(
                                                            text: verifyText,
                                                            onPress: () {},
                                                          ),
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
                                    );
                                  },
                                );
                              },
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
                  child: BlocBuilder<ClientSignupBloc, ClientSignupState>(
                    builder: (context, state) {
                      return TakePhotoWidget(
                        ontap: () {
                          //BlocProvider.of<ClientSignupBloc>(context).add(
                          //  SendVideoMessageEvent(
                          //    channelId,
                          //  ),
                          //);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

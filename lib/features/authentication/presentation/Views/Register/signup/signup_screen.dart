import 'package:checkbox_formfield/checkbox_formfield.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vets_project/common_widgets/buttons/primary_button.dart';
import 'package:vets_project/common_widgets/buttons/social_media_button.dart';
import 'package:vets_project/core/routes/routes.dart';
import 'package:vets_project/core/theme/app_assets.dart';
import 'package:vets_project/core/theme/colors.dart';
import 'package:vets_project/core/theme/styles.dart';
import 'package:vets_project/core/values/constant_strings.dart';
import 'package:vets_project/features/authentication/domain/entities/client_entity.dart';
import 'package:vets_project/features/authentication/presentation/Widgets/custom_login_text_form_field.dart';
import 'package:vets_project/features/authentication/presentation/Widgets/phone_text_form_field.dart';
import 'package:vets_project/features/authentication/presentation/bloc/client_signup_bloc/client_signup_bloc.dart';
import 'package:vets_project/features/authentication/presentation/bloc/client_signup_bloc/client_signup_event.dart';
import 'package:vets_project/features/authentication/presentation/bloc/client_signup_bloc/client_signup_state.dart'
    as bloc_state;
import 'package:vets_project/features/authentication/presentation/cubit/client_signup_cubit/client_signup_cubit.dart';
import 'package:vets_project/features/authentication/presentation/cubit/client_signup_cubit/client_signup_state.dart';
import 'package:vets_project/injection_container.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool? checkboxIconFormFieldValue = false;

    return SingleChildScrollView(
      child: BlocProvider(
        create: (context) => sl<ClientSignupBloc>(),
        child: BlocListener<ClientSignupBloc, bloc_state.ClientSignupState>(
          listener: (context, state) {
            if (state is bloc_state.ClientSignupLoading) {
              Navigator.pushNamed(context, Routes.loaderScreen);
            } else if (state is bloc_state.SignupSuccess) {
              Navigator.pushReplacementNamed(context, Routes.homeScreen);
            } else {
              Navigator.pop(context);
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.toString())));
            }
          },
          child: BlocProvider(
            create: (BuildContext context) => ClientSignupCubit(),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        'Étape 2/2',
                        style: TextStyles.smallTextStyle.copyWith(
                          color: const Color.fromRGBO(245, 246, 247, 0.5),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Center(
                      child: Text(
                        createAnewAccountText,
                        style: TextStyles.largeTextStyle
                            .copyWith(color: kWhiteColor),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 40),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: BlocBuilder<ClientSignupCubit,
                                    ClientSignupState>(
                                  builder: (context, state) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: CustomLoginFormField(
                                        onChanged: (value) => context
                                            .read<ClientSignupCubit>()
                                            .firstNameChanged(value),
                                        textInputType: TextInputType.text,
                                        labelText: nameText,
                                        errorText:
                                            state is ClientWrongFirstNameState
                                                ? 'invalid first name'
                                                : '',
                                      ),
                                    );
                                  },
                                  buildWhen: (oldSate, latestState) {
                                    return oldSate != latestState;
                                  },
                                ),
                              ),
                              Flexible(
                                child: BlocBuilder<ClientSignupCubit,
                                    ClientSignupState>(
                                  builder: (context, state) {
                                    return CustomLoginFormField(
                                      onChanged: (value) => context
                                          .read<ClientSignupCubit>()
                                          .lastNameChanged(value),
                                      textInputType: TextInputType.text,
                                      labelText: lastNameText,
                                      errorText:
                                          //todo add translate
                                          state is ClientWrongLastNameState
                                              ? 'invalid last name'
                                              : '',
                                    );
                                  },
                                  buildWhen: (oldSate, latestState) {
                                    return oldSate != latestState;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        BlocBuilder<ClientSignupCubit, ClientSignupState>(
                          builder: (context, state) {
                            return CustomLoginFormField(
                              onChanged: (value) => context
                                  .read<ClientSignupCubit>()
                                  .emailChanged(value),
                              textInputType: TextInputType.emailAddress,
                              labelText: addressEmailText,
                              errorText:
                                  //todo add translate
                                  state is ClientInvalidEmailSignInState
                                      ? 'invalid email'
                                      : '',
                            );
                          },
                          buildWhen: (oldSate, latestState) {
                            return oldSate != latestState;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child:
                              BlocBuilder<ClientSignupCubit, ClientSignupState>(
                            builder: (context, state) {
                              return CustomPhoneFormField(
                                onChanged: (value) => context
                                    .read<ClientSignupCubit>()
                                    .phoneNumberChanged(value),
                                labelText: phoneNumberText,
                                errorText:
                                    //todo add translate
                                    state is ClientWrongPhoneNumberState
                                        ? 'invalid phone number'
                                        : '',
                              );
                            },
                            buildWhen: (oldSate, latestState) {
                              return oldSate != latestState;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 10),
                          child:
                              BlocBuilder<ClientSignupCubit, ClientSignupState>(
                            builder: (context, state) {
                              return CustomLoginFormField(
                                onChanged: (value) => context
                                    .read<ClientSignupCubit>()
                                    .passwordChanged(value),
                                textInputType: TextInputType.text,
                                labelText: passwordText,
                                obscureText: true,
                                suffixIcon: SvgPicture.asset(
                                  AppAssets.eyeIcon,
                                  fit: BoxFit.scaleDown,
                                ),
                                errorText: state is ClientWrongPasswordState
                                    ? 'invalid password'
                                    : '',
                              );
                            },
                            buildWhen: (oldSate, latestState) {
                              return oldSate != latestState;
                            },
                          ),
                        ),
                        Row(
                          children: [
                            CheckboxIconFormField(
                              disabledColor: kWhiteColor,
                              padding: 0,
                              context: context,
                              trueIconColor: kWhiteColor,
                              trueIcon: Icons.check_box,
                              falseIconColor: kWhiteColor.withOpacity(0.5),
                              initialValue: checkboxIconFormFieldValue,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: InkWell(
                                  onTap: () {},
                                  child: EasyRichText(
                                    conditionAndTermsText,
                                    defaultStyle:
                                        TextStyles.smallTextStyle.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: kWhiteColor,
                                    ),
                                    patternList: [
                                      EasyRichTextPattern(
                                        targetString: 'J’accepte les',
                                        style: TextStyles.smallTextStyle
                                            .copyWith(
                                                fontWeight: FontWeight.w400,
                                                color: kLightWhite),
                                      ),
                                      EasyRichTextPattern(
                                        targetString: 'et la',
                                        style: TextStyles.smallTextStyle
                                            .copyWith(
                                                fontWeight: FontWeight.w400,
                                                color: kLightWhite),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child:
                              BlocBuilder<ClientSignupCubit, ClientSignupState>(
                            builder: (context, state) {
                              return PrimaryButtonWidget(
                                text: signupText,
                                onPress: () {
                                  final String password = context
                                      .read<ClientSignupCubit>()
                                      .password!;
                                  ClientEntity clientEntity = ClientEntity(
                                    gender: 'male',
                                    id: 'empty',
                                    photoUrl: 'profilePicture',
                                    name: context
                                        .read<ClientSignupCubit>()
                                        .firstName!,
                                    lastName: context
                                        .read<ClientSignupCubit>()
                                        .lastName!,
                                    phoneNumber: int.parse(context
                                        .read<ClientSignupCubit>()
                                        .phoneNumber!),
                                    email: context
                                        .read<ClientSignupCubit>()
                                        .email!,
                                    isEmergencyAgent: false,
                                    fcmToken: 'empty',
                                    role: '',
                                    isVip: false,
                                    address: '',
                                  );
                                  BlocProvider.of<ClientSignupBloc>(context)
                                      .add(Signup(clientEntity, password));
                                },
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const Flexible(
                                child: Divider(
                                  endIndent: 4,
                                  indent: 0,
                                  color: kLightWhite,
                                  thickness: 0.4,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text(
                                  orSignupWithText,
                                  style: TextStyles.baseTextStyle.copyWith(
                                    color: kLightWhite.withOpacity(0.5),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              const Flexible(
                                child: Divider(
                                  indent: 4,
                                  color: kLightWhite,
                                  thickness: 0.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10, left: 10),
                                  child: SocialMediaButton(
                                    isesmall: true,
                                    text: 'Facebook',
                                    onPress: () {},
                                    icon: AppAssets.facebookIcon,
                                    color: Colors.transparent,
                                    textColor: kWhiteColor,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: SocialMediaButton(
                                    isesmall: true,
                                    text: 'Google',
                                    onPress: () {},
                                    icon: AppAssets.googleIcon,
                                    color: Colors.transparent,
                                    textColor: kWhiteColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30.h),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                youHaveAnAccountText,
                                style: TextStyles.baseTextStyle.copyWith(
                                  fontWeight: FontWeight.w300,
                                  color: kLightWhite.withOpacity(0.5),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: InkWell(
                                  onTap: () {},
                                  child: Text(
                                    connectedText,
                                    style: TextStyles.baseTextStyle.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: kWhiteColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
    );
  }
}

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
import 'package:vets_project/features/authentication/presentation/Widgets/custom_login_text_form_field.dart';
import 'package:vets_project/features/authentication/presentation/cubit/sign_in_cubit.dart';
import 'package:vets_project/features/authentication/presentation/cubit/sign_in_state.dart';

import 'package:vets_project/injection_container.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  bool loadingIsShown = false;
  bool iselected = false;
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<SignInBloc>(),
      child: BlocListener<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            loadingIsShown = true;
            Navigator.pushNamed(context, Routes.loaderScreen).then((value) {
              loadingIsShown = false;
            });
          } else if (state is IsClient) {
            Navigator.pushReplacementNamed(context, Routes.homeScreen);
          } else {
            if (loadingIsShown) {
              Navigator.pop(context);
            }
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: Text(
                    loginText,
                    style:
                        TextStyles.largeTextStyle.copyWith(color: kWhiteColor),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
                child: Column(
                  children: [
                    BlocBuilder<SignInBloc, SignInState>(
                      builder: (context, state) {
                        return CustomLoginFormField(
                          onChanged: (email) =>
                              context.read<SignInBloc>().emailChanged(email),
                          textInputType: TextInputType.emailAddress,
                          labelText: addressEmailText,
                          obscureText: false,
                          errorText: state is AuthErrorInvalidEmailSignInState
                              ? 'Email invalide'
                              : '',
                        );
                      },
                      buildWhen: (oldSate, latestState) {
                        return oldSate != latestState;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: BlocBuilder<SignInBloc, SignInState>(
                        builder: (context, state) {
                          return CustomLoginFormField(
                            onChanged: (password) => context
                                .read<SignInBloc>()
                                .passwordChanged(password),
                            textInputType: TextInputType.text,
                            labelText: passwordText,
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              child: SvgPicture.asset(
                                AppAssets.eyeIcon,
                                color: kWhiteColor,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            obscureText: hidePassword,
                            errorText: state is AuthErrorWrongPasswordState
                                ? 'Mot de passe incorrect'
                                : '',
                          );
                        },
                        buildWhen: (oldSate, latestState) {
                          return oldSate != latestState;
                        },
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          child: CheckboxListTile(
                            checkColor: kDarkCOlor,
                            activeColor: kWhiteColor,
                            contentPadding: const EdgeInsets.all(0),
                            visualDensity: const VisualDensity(horizontal: -4),
                            dense: true,
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text(
                              'Se rappeler de moi',
                              style: TextStyles.smallTextStyle.copyWith(
                                color: kLightWhite.withOpacity(0.5),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            side: const BorderSide(
                              width: 0.4,
                              color: kWhiteColor,
                            ),
                            value: iselected,
                            onChanged: (value) {
                              setState(() {
                                iselected = value!;
                              });
                            },
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, Routes.forgotPasswordScreen);
                          },
                          child: Text(
                            '$forgotPasswordText?',
                            style: TextStyles.smallTextStyle.copyWith(
                              color: kWhiteColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: BlocBuilder<SignInBloc, SignInState>(
                        builder: (context, state) {
                          return PrimaryButtonWidget(
                            text: loginText,
                            onPress: () => context
                                .read<SignInBloc>()
                                .veterinaryLoginEvent(),
                            //  Navigator.pushNamed(context, Routes.homeScreen),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
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
                              orLoginWithText,
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
                      padding: const EdgeInsets.only(top: 40),
                      child: Column(
                        children: [
                          SocialMediaButton(
                            isesmall: false,
                            text: 'Facebook',
                            onPress: () {},
                            icon: AppAssets.facebookIcon,
                            color: Colors.transparent,
                            textColor: kWhiteColor,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: SocialMediaButton(
                              text: 'Google',
                              isesmall: false,
                              onPress: () {},
                              icon: AppAssets.googleIcon,
                              color: Colors.transparent,
                              textColor: kWhiteColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 60.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            youAreANewUserText,
                            style: TextStyles.baseTextStyle.copyWith(
                              fontWeight: FontWeight.w300,
                              color: kLightWhite.withOpacity(0.7),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: InkWell(
                              onTap: () {},
                              child: Text(
                                createAnewAccountText,
                                style: TextStyles.baseTextStyle.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: kWhiteColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

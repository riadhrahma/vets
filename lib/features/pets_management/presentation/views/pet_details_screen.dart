import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vets_project/common_widgets/buttons/custom_text_button.dart';
import 'package:vets_project/common_widgets/buttons/primary_button.dart';
import 'package:vets_project/common_widgets/dividers/custom_divider.dart';
import 'package:vets_project/core/global_use/size_config.dart';
import 'package:vets_project/core/theme/app_assets.dart';
import 'package:vets_project/core/theme/colors.dart';
import 'package:vets_project/core/theme/styles.dart';
import 'package:vets_project/core/values/constant_strings.dart';
import 'package:vets_project/features/pets_management/presentation/widgets/archive_reason_widget.dart';

class PetDetailsScreen extends StatelessWidget {
  const PetDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 57,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: SizedBox(
              child: Card(
                elevation: 0,
                color: kDarkCOlor,
                shape: const CircleBorder(),
                child: Center(
                    child: SvgPicture.asset(
                  AppAssets.arrowLeftWhiteIcon,
                  color: kWhiteColor,
                  fit: BoxFit.scaleDown,
                  height: 15,
                  width: 15,
                )),
              ),
            ),
          ),
        ),
        actions: [
          PopupMenuButton(
            iconSize: 40,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            position: PopupMenuPosition.under,
            onSelected: ((value) async {
              if (value == 2) {
                await showModalBottomSheet<void>(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                  ),
                  builder: (BuildContext context) {
                    return Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        ),
                      ),
                      height: 600,
                      width: SizeConfig().widht,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 20),
                                child: SizedBox(
                                  width: 60,
                                  child: CustomDividerWidget(),
                                ),
                              ),
                              SizedBox(
                                height: 90,
                                width: SizeConfig().widht,
                                child: Card(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 0.5,
                                      color: kGreyCOlor.withOpacity(0.5),
                                    ),
                                  ),
                                  child: Center(
                                    child: ListTile(
                                      trailing: SvgPicture.asset(
                                        AppAssets.dropIcon,
                                      ),
                                      dense: true,
                                      leading: const CircleAvatar(
                                        backgroundImage: AssetImage(
                                          AppAssets.petImage,
                                        ),
                                      ),
                                      title: Text(
                                        'Mizo',
                                        style:
                                            TextStyles.meduimTextSTyle.copyWith(
                                          fontSize: 18,
                                          color: kGreyCOlor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      subtitle: const Text(
                                        'Веrgеr Аllеmаnd',
                                        style: TextStyles.smallTextStyle,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                child: Text(
                                  'Voulez-vous vraiment ajouter Mizo à la liste de vos animaux archivés?',
                                  style: TextStyles.meduimTextSTyle.copyWith(
                                    color: kGreyCOlor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              ArchiveReasonWWidget(
                                title: 'Animal décédé',
                                onTap: () {},
                                isselected: false,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 5),
                                child: ArchiveReasonWWidget(
                                  title: 'Animal perdu',
                                  onTap: () {},
                                  isselected: true,
                                ),
                              ),
                              ArchiveReasonWWidget(
                                title: 'Animal cédé ou vendu',
                                onTap: () {},
                                isselected: false,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 15,
                                  top: 20,
                                  bottom: 20,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomTextButton(
                                      text: cancelText,
                                      onpressed: () {},
                                      color: kGreyCOlor.withOpacity(0.5),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    SizedBox(
                                      width: 160,
                                      height: 45,
                                      child: PrimaryButtonWidget(
                                        text: confirmText,
                                        onPress: () {},
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
                  },
                );
              }
            }),
            icon: SizedBox(
              height: 40,
              width: 40,
              child: Card(
                elevation: 0,
                color: kDarkCOlor,
                shape: const CircleBorder(),
                child: Center(
                  child: SvgPicture.asset(
                    AppAssets.unionIcon,
                    color: kWhiteColor,
                    fit: BoxFit.scaleDown,
                    height: 15,
                    width: 15,
                  ),
                ),
              ),
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: SvgPicture.asset(
                        AppAssets.editPenIcon,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    Text(
                      'Modifier',
                      style: TextStyles.smallTextStyle.copyWith(
                        color: kDarkCOlor,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: SvgPicture.asset(
                        AppAssets.archiveIcon,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    Text(
                      'Archiver',
                      style: TextStyles.smallTextStyle.copyWith(
                        color: kDarkCOlor,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromRGBO(245, 246, 247, 1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: SizeConfig().widht,
              height: 315,
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        'https://www.princeton.edu/sites/default/files/styles/half_2x/public/images/2022/02/KOA_Nassau_2697x1517.jpg',
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        height: 300,
                        width: SizeConfig().widht,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: imageProvider,
                          ),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 0,
                    right: 20,
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Card(
                        elevation: 0.5,
                        shape: const CircleBorder(),
                        color: kWhiteColor,
                        child: Center(
                          child: SvgPicture.asset(
                            AppAssets.dogIcon,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Mizo',
                        style: TextStyles.largeTextStyle.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 32,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: SizedBox(
                          height: 32,
                          width: 32,
                          child: Card(
                            elevation: 0,
                            color: kWhiteColor,
                            shape: CircleBorder(),
                            child: Center(
                              child: SizedBox(
                                height: 28,
                                width: 28,
                                child: Card(
                                  shape: CircleBorder(),
                                  elevation: 0,
                                  color: kRedColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Text(
                    'Веrgеr Аllеmаnd',
                    style: TextStyles.smallTextStyle.copyWith(
                      fontSize: 10,
                      color: kGreyCOlor,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: SizedBox(
                height: 80,
                width: SizeConfig().widht,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      left: 25,
                      right: 25,
                      bottom: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Age',
                              style: TextStyles.smallTextStyle.copyWith(
                                color: kGreyCOlor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                '1 an',
                                style: TextStyles.baseTextStyle.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 70,
                          child: VerticalDivider(
                            width: 10,
                            color: kGreyCOlor.withOpacity(0.7),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sex',
                              style: TextStyles.smallTextStyle.copyWith(
                                color: kGreyCOlor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                'Male',
                                style: TextStyles.baseTextStyle.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 70,
                          child: VerticalDivider(
                            width: 10,
                            color: kGreyCOlor.withOpacity(0.7),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Poids',
                              style: TextStyles.smallTextStyle.copyWith(
                                color: kGreyCOlor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                '3 kg',
                                style: TextStyles.baseTextStyle.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                bottom: 20,
              ),
              child: Text(
                'À propos de la race',
                style: TextStyles.largeTextStyle.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Text(
                'Lе Веrgеr Аllеmаnd еѕt іѕѕu du сrоіѕеmеnt еntrе lеѕ Веrgеrѕ dе Тhurіngе еt сеuх dе Wurtеmbеrg. Іl а été соnçu à lа fіn du ХІХе ѕіèсlе раr lеѕ Аllеmаndѕ, lеѕquеlѕ étаіеnt ѕоuсіеuх dе рréѕеrvеr lа rасе dеѕ bеrgеrѕ fасе à unе іnduѕtrіаlіѕаtіоn quі еntrаînаіt реu à реu lа dіѕраrіtіоn dе l’élеvаgе.',
                style: TextStyles.baseTextStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}

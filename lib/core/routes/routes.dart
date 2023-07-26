import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:vets_project/common_widgets/loader/loader_widget.dart';
import 'package:vets_project/common_widgets/splash_screen.dart/splash_screen.dart';
import 'package:vets_project/features/authentication/presentation/Views/Register/forgot_password_screen.dart';
import 'package:vets_project/features/authentication/presentation/Views/Register/register_main_screen.dart';
import 'package:vets_project/features/authentication/presentation/Views/get_started_screen.dart';
import 'package:vets_project/features/chat/presentation/Views/client/client_chat_main_screen.dart';
import 'package:vets_project/features/chat/presentation/Views/client/emergency_chat/emergency_chat_room.dart';
import 'package:vets_project/features/chat/presentation/Views/client/emergency_chat/map_screen.dart';
import 'package:vets_project/features/chat/presentation/Views/client/emergency_chat/select_pet_emergency_chat_screen.dart';
import 'package:vets_project/features/chat/presentation/Views/client/emergency_chat/select_transport_manner_screen.dart';
import 'package:vets_project/features/chat/presentation/Views/client/general_chat/general_chat_room_screen.dart';
import 'package:vets_project/features/chat/presentation/Views/client/general_chat/select_pet_general_chat_screen.dart';
import 'package:vets_project/features/chat/presentation/Widgets/view_image_chat.dart';
import 'package:vets_project/features/home/presentation/views/home_screen.dart';
import 'package:vets_project/features/pets_management/presentation/views/add_pets_screen.dart';
import 'package:vets_project/features/pets_management/presentation/views/pet_details_screen.dart';
import 'package:vets_project/features/pets_management/presentation/views/pet_screen.dart';
import 'package:vets_project/features/profile/presentation/views/client/client_profile_screen.dart';

class Routes {
  static const String getstarted = "getStasrtedScreen";
  static const String homeScreen = "homeScreen";
  static const String registerMainScreen = 'registerMainScreen';
  static const String clientprofileScreen = 'profileScreen';
  static const String selectPetChatGeneralScreen = 'selectPetScreen';
  static const String forgotPasswordScreen = 'forgotPasswordScreen';
  static const String selectPetEmergencyScreen = 'selectPetEmergencyScreen';
  static const String myPetScreen = 'myPetsScreen';
  static const String splashScreen = 'splashScreen';
  static const String loaderScreen = 'loaderScreen';
  static const String addPetScreen = 'addPetScreen';
  static const String emergencyChatRoomScreen = 'emergencyChatRoomScreen';
  static const String viewChatImage = 'ViewChatImage';
  static const String selectTransportMannerScreen =
      'SelectTransportMannerScreen';
  static const String generalChatRoomScreen = 'generalChatRoom';
  static const String mapScreen = 'mapScreen';
  static const String petDetailsScreen = 'PetDetailsScreen';
  static const String chatMainScreenClient = 'ChatMainScreenClient';
  static Map<String, Widget Function(BuildContext)> routes() => {
        getstarted: (context) => const GetStartedScreen(),
        generalChatRoomScreen: (context) => const GeneralChatRoomScreen(),
        registerMainScreen: (context) => const RegisterMainScreen(),
        clientprofileScreen: (context) => const ClientProfileScreen(),
        forgotPasswordScreen: (context) => const ForgotPasswordScreen(),
        selectPetChatGeneralScreen: (context) => const SelectYourPetScreen(),
        selectPetEmergencyScreen: (context) =>
            const SelectYourPetScreenEmergency(),
        splashScreen: (context) => const SplashScreen(),
        loaderScreen: (context) => const OverlayWidget(),
        myPetScreen: (context) => const MyPetsScreen(),
        addPetScreen: (context) => const AddPetScreen(),
        homeScreen: (context) => const HomeScreen(),
        emergencyChatRoomScreen: (context) => const EmergencyChatRoom(),
        viewChatImage: (context) => const ViewChatImageWidget(),
        selectTransportMannerScreen: (context) =>
            const SelectTrasnportMannerScreen(),
        petDetailsScreen: (context) => const PetDetailsScreen(),
        mapScreen: (context) => const MapScreen(),
        chatMainScreenClient: (context) => const ClientChatMainScreen(),
      };
}

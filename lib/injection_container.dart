import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:vets_project/features/authentication/data/data_sources/cached_data_source.dart';
import 'package:vets_project/features/authentication/domain/use_cases/client_use_cases/get_cached_client_info_use_case.dart';
import 'package:vets_project/features/authentication/domain/use_cases/veterinary_use_cases/veterinary_is_exist_info_use_case.dart';
import 'package:vets_project/features/authentication/domain/use_cases/veterinary_use_cases/veterinary_signup_process_use_case.dart';
import 'package:vets_project/features/authentication/presentation/bloc/veterinary_signup_bloc/veterinary_signup_bloc.dart';
import 'package:vets_project/features/authentication/presentation/cubit/veterinary_signup_cubit/veterinary_signup_cubit.dart';
import 'package:vets_project/features/chat/domain/repositories/chat_repository.dart';
import 'package:vets_project/features/chat/domain/use_cases/create_channel_usecasse.dart';
import 'package:vets_project/features/chat/domain/use_cases/create_emergency_request_usecase.dart';
import 'package:vets_project/features/chat/domain/use_cases/create_new_emergency_request_process_use_case.dart';
import 'package:vets_project/features/chat/domain/use_cases/delete_message_usecase.dart';
import 'package:vets_project/features/chat/domain/use_cases/fetch_user_location_use_case.dart';
import 'package:vets_project/features/chat/domain/use_cases/get_my_pets_usecase.dart';
import 'package:vets_project/features/chat/domain/use_cases/pick_file_use_case.dart';
import 'package:vets_project/features/chat/domain/use_cases/send_message_usecase.dart';
import 'package:vets_project/features/chat/domain/use_cases/upload_flle_use_case.dart';
import 'package:vets_project/features/chat/presentation/bloc/emergency_request_bloc/emergency_request_bloc.dart';
import 'package:vets_project/features/pets_management/domain/use_cases/get_pet_list_usecase.dart';
import 'package:vets_project/features/pets_management/domain/use_cases/pick_image_usecase.dart';
import 'package:vets_project/features/pets_management/domain/use_cases/upload_image_usecase.dart';
import 'package:vets_project/features/pets_management/presentation/bloc/add_pets/add_pets_bloc.dart';
import 'package:vets_project/features/pets_management/presentation/bloc/get_pets/get_my_pets_bloc.dart';
import 'package:vets_project/features/profile/domain/repositories/profile_repository.dart';
import 'package:vets_project/features/profile/domain/use_cases/update_profile_use_case.dart';
import 'package:vets_project/features/profile/presentation/bloc/update_profile_bloc.dart';

import 'core/common_used/network_Info/network_info.dart';
import 'features/authentication/data/data_sources/remote_data_source.dart';
import 'features/authentication/data/repositories/auth_repository_impl.dart';
import 'features/authentication/domain/repositories/auth_repository.dart';
import 'features/authentication/domain/use_cases/client_use_cases/client_signup_process_use_case.dart';
import 'features/authentication/domain/use_cases/client_use_cases/save_cached_client_info_use_case.dart';
import 'features/authentication/domain/use_cases/common_use_cases/signIn_proccess_use_case.dart';
import 'features/authentication/domain/use_cases/common_use_cases/signIn_with_email_password_use_case.dart';
import 'features/authentication/domain/use_cases/veterinary_use_cases/fetch_veterinary_info_use_case.dart';
import 'features/authentication/domain/use_cases/veterinary_use_cases/get_cached_veterinary_info_use_case.dart';
import 'features/authentication/domain/use_cases/veterinary_use_cases/save_cached_veterinary_info_use_case.dart';
import 'features/authentication/presentation/bloc/client_signup_bloc/client_signup_bloc.dart';
import 'features/authentication/presentation/cubit/sign_in_cubit.dart';
import 'features/chat/data/data_sources/online_data_source.dart';
import 'features/chat/data/repositories/chat_repository_impl.dart';
import 'features/chat/domain/use_cases/get_channel_messages_use_case.dart';
import 'features/chat/domain/use_cases/send_file_message_process_use_case.dart';
import 'features/chat/presentation/bloc/emergency_chat_bloc/emergency_chat_bloc.dart';
import 'features/pets_management/data/data_sources/cached_data_sources.dart';
import 'features/pets_management/data/data_sources/remote_data_source.dart';
import 'features/pets_management/data/repositories/pet_mangement_repository_impl.dart';
import 'features/pets_management/domain/repositories/pet_management_repository.dart';
import 'features/pets_management/domain/use_cases/add_new_pet_usecase.dart';
import 'features/pets_management/presentation/cubit/add_pet/add_pet_cubit.dart';
import 'features/profile/data/data_sources/remote_data_source.dart';
import 'features/profile/data/repositories/profile_repository_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //sign in bloc
  sl.registerFactory(
        () => SignInBloc(
      //inputConverter: sl(),
      //signIn: sl(),
      //fetchVeterinaryInfoUseCase: sl(),
      //veterinaryIsExistUseCase: sl(),
      signInProcessUseCase: sl(),
      saveCachedClientInfoUseCase: sl(),
      getCachedClientInfoUseCase: sl(),
      saveCachedVeterinaryInfoUseCase: sl(),
      getCachedVeterinaryInfoUseCase: sl(),
    ),
  );

  sl.registerLazySingleton(() => SignInProcessUseCase(sl()));
  sl.registerLazySingleton(() => SaveCachedClientInfoUseCase(sl()));
  sl.registerLazySingleton(() => GetCachedClientInfoUseCase(sl()));
  sl.registerLazySingleton(() => SaveCachedVeterinaryInfoUseCase(sl()));
  sl.registerLazySingleton(() => GetCachedVeterinaryInfoUseCase(sl()));

  //! Features - authentication
  // Bloc

  sl.registerFactory(() => AddPetsBloc(
    addNewPetUseCase: sl(),
  ));

  sl.registerFactory(
        () => AddPetCubit(uploadImageUseCase: sl(), pickImageUseCase: sl()),
  );

  sl.registerFactory(
        () => GetMyPetsBloc(getPetsUseCase: sl()),
  );

  sl.registerFactory(
        () => VeterinarySignupCubit(
      //inputConverter: sl(),
      //signIn: sl(),
      //fetchVeterinaryInfoUseCase: sl(),
      //veterinaryIsExistUseCase: sl(),
      //signInProcessUseCase: sl(),
    ),
  );
  sl.registerFactory(
        () => VeterinarySignupBloc(
      //inputConverter: sl(),
      //signIn: sl(),
      //fetchVeterinaryInfoUseCase: sl(),
      //veterinaryIsExistUseCase: sl(),
      // signInProcessUseCase: sl(),
        veterinarySignupProcessUseCase: sl(),
        saveCachedVeterinaryInfoUseCase: sl()),
  );

  sl.registerFactory(
        () => UpdateProfileBloc(updateProfileUseCase: sl()),
  );
  sl.registerFactory(
        () => ClientSignupBloc(
      //inputConverter: sl(),
      //signIn: sl(),
      //fetchVeterinaryInfoUseCase: sl(),
      //veterinaryIsExistUseCase: sl(),
      // signInProcessUseCase: sl(),
        clientSignupProcessUseCase: sl(),
        saveCachedClientInfoUseCase: sl()),
  );

  sl.registerFactory(() => EmergencyRequestBloc(
    getMyPetsUseCase: sl(),
    createNewEmergencyRequestProcessUseCase: sl(),
  ));

  sl.registerFactory(
        () => EmergencyChatBloc(
      getChannelMessagesUseCase: sl(),
      sendMessageUseCase: sl(),
      uploadFileUseCase: sl(),
      pickFilesUseCase: sl(),
      sendFileMessageUseCase: sl(), deleteMessageUseCase: sl(),
    ),
  );

  sl.registerLazySingleton<ChatRepository>(
          () => ChatRepositoryImpl(chatOnlineDataSourceImpl: sl()));
  // Use cases
  sl.registerLazySingleton(() => SignInWithEmailAndPasswordUseCase(sl()));
  sl.registerLazySingleton(() => FetchVeterinaryInfoUseCase(sl()));
  sl.registerLazySingleton(() => VeterinaryIsExistUseCase(sl()));
  sl.registerLazySingleton(() => DeleteMessageUseCase(sl()));
  sl.registerLazySingleton(() => PickFilesUseCase(sl()));

  sl.registerLazySingleton(() => VeterinarySignupProcessUseCase(sl()));
  sl.registerLazySingleton(() => ClientSignupProcessUseCase(sl()));

  sl.registerLazySingleton(() => AddNewPetUseCase(sl()));
  sl.registerLazySingleton(() => UploadImageUseCase(sl()));
  sl.registerLazySingleton(() => PickImageUseCase(sl()));

  sl.registerLazySingleton(() => CreateEmergencyRequestUseCase(sl()));
  sl.registerLazySingleton(() => GetMyPetsUseCase(sl()));
  sl.registerLazySingleton(() => CreateNewEmergencyRequestProcessUseCase(sl()));
  sl.registerLazySingleton(() => FetchUserLocationUseCase(sl()));
  sl.registerLazySingleton(() => CreateChannelUseCase(sl()));

  sl.registerLazySingleton(() => SendFileMessageProcessUseCase(sl()));

  sl.registerLazySingleton(() => UpdateProfileUseCase(profileRepository: sl()));

  sl.registerLazySingleton(() => GetChannelMessagesUseCase(sl()));

  sl.registerLazySingleton(() => SendMessageUseCase(sl()));
  sl.registerLazySingleton(() => UploadFileUseCase(sl()));

  // Repository
  sl.registerLazySingleton<PetsMangementRepository>(
        () => PetsMangementRepositoryImpl(
      networkInfo: sl(),
      // petsCachedDataSource: sl(),
      petManagmentRemoteDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(
      networkInfo: sl(),
      authOnlineDataSource: sl(),
      cachedDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<ProfileRepository>(
        () => ProfileRepositoryImpl(profileOnlineDataSource: sl()),
  );

  // Data sources
  FirebaseAuth auth = FirebaseAuth.instance;
  sl.registerLazySingleton<AuthOnlineDataSource>(
        () => FirebaseDataSourceImpl(FirebaseFirestore.instance, auth),
  );
  sl.registerLazySingleton<CachedDataSource>(
        () => CachedDataSourceImpl(),
  );

  //new
  sl.registerLazySingleton<PetsCachedDataSource>(
        () => HiveCachedDataSource(),
  );

  sl.registerLazySingleton<PetManagmentRemoteDataSource>(
        () => FirebasePetMangementDataSource(),
  );

  sl.registerLazySingleton(
        () => ChatOnlineDataSourceImpl(
      FirebaseFirestore.instance,
      auth,
    ),
  );

  sl.registerLazySingleton<ProfileOnlineDataSource>(
        () => ProfileDataSourceImpl(
      FirebaseFirestore.instance,
      auth,
    ),
  );

  sl.registerLazySingleton(() => GetPetsUseCase(sl()));

  //! Core

  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
}

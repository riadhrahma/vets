import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uuid/uuid.dart';
import 'package:vets_project/core/errors/exceptions.dart';
import 'package:vets_project/core/values/constant_strings.dart';
import 'package:vets_project/features/authentication/data/data_sources/remote_data_source.dart';
import 'package:vets_project/features/authentication/data/models/client_model.dart';
import 'package:vets_project/features/authentication/data/models/veterinary_model.dart';

main() async {
  final MockFirebaseAuth auth = MockFirebaseAuth();
  final FakeFirebaseFirestore firebaseFirestore = FakeFirebaseFirestore();
  FirebaseDataSourceImpl firebaseDataSourceImpl =
      FirebaseDataSourceImpl(firebaseFirestore, auth);

  final String veterinaryId = const Uuid().v4();
  final String clientId = const Uuid().v4();

  group('AuthOnlineDataSourceVeterinary', () {
    test(
      'isExist/create Veterinaire method test',
      () async {
        bool result =
            await firebaseDataSourceImpl.veterinaryIsExist(veterinaryId);
        expect(
          result,
          false,
          reason: 'no veterinary in db with id equal to $veterinaryId',
        );
        final VeterinaryModel veterinaryModel = VeterinaryModel(
          id: veterinaryId,
          profilePicture: "profilePicture",
          firstName: "firstName",
          lastName: "lastName",
          phoneNumber: "phoneNumber",
          email: "email",
          isEmergencyAgent: true,
          isConfirmed: true,
          fcmToken: "fcmToken",
        );
        await firebaseDataSourceImpl
            .createVeterinaryInDataBase(veterinaryModel);
        result = await firebaseDataSourceImpl.veterinaryIsExist(veterinaryId);
        expect(
          result,
          true,
          reason:
              'after the executing [createVeterinaryInDataBase] method, the [veterinaryIsExist] must find a veterinary with id equal to $veterinaryId',
        );
      },
      timeout: const Timeout(
        Duration(
          milliseconds: 1000,
        ),
      ),
    );

    test(
      'update/fetch Veterinaire method test',
      () async {
        const String newFirstName = 'John';
        final VeterinaryModel veterinaryModel = VeterinaryModel(
          id: veterinaryId,
          profilePicture: "profilePicture",
          firstName: newFirstName,
          lastName: "lastName",
          phoneNumber: "phoneNumber",
          email: "email",
          isEmergencyAgent: true,
          isConfirmed: true,
          fcmToken: "fcmToken",
        );
        await firebaseDataSourceImpl.updateVeterinaryInfo(
          veterinaryModel,
        );
        final VeterinaryModel veterinaryModelFromDb =
            await firebaseDataSourceImpl.getVeterinaryInfo(
          veterinaryId,
        );
        expect(
          veterinaryModelFromDb,
          veterinaryModel,
          reason:
              'after the executing [updateVeterinaryInfo] method, the [getVeterinaryInfo] must find a veterinary equal to $veterinaryModel',
        );
      },
      timeout: const Timeout(
        Duration(
          milliseconds: 1000,
        ),
      ),
    );

    test(
      'sign up method test',
      () async {
        const String email = 'test@test.com';
        const String password = 'test@1234';
        expect(
          firebaseDataSourceImpl.auth.currentUser,
          null,
          reason: 'initially no user logged in',
        );
        firebaseDataSourceImpl.signupWithEmailAndPassword(
          email,
          password,
        );

        expect(firebaseDataSourceImpl.auth.currentUser, isNotNull,
            reason: 'the user already signed in');
      },
      timeout: const Timeout(
        Duration(
          milliseconds: 1000,
        ),
      ),
    );

    test(
      'logout method test',
      () async {
        await firebaseDataSourceImpl.logOut();

        expect(
          auth.currentUser,
          null,
          reason: 'the user logged out',
        );

        expect(
          () async => await firebaseDataSourceImpl.logOut(),
          throwsA(isA<UserNotExistException>()),
        );
      },
      timeout: const Timeout(
        Duration(
          milliseconds: 1000,
        ),
      ),
    );

    test(
      'sign in method test',
      () async {
        const String email = 'test@test.com';
        const String password = 'test@1234';

        expect(auth.currentUser, null,
            reason: 'assert that no user is already logged in');

        await firebaseDataSourceImpl.signInWithEmailAndPassword(
          email,
          password,
        );

        expect(
          auth.currentUser,
          isNotNull,
          reason: 'the use already signed in',
        );
      },
      timeout: const Timeout(
        Duration(
          milliseconds: 1000,
        ),
      ),
    );
  });

  group('AuthOnlineDataSourceClient', () {
    test(
      'isExist/create client method test',
      () async {
        bool result = await firebaseDataSourceImpl.clientIsExist(veterinaryId);
        expect(
          result,
          false,
          reason: 'no veterinary in db with id equal to $veterinaryId',
        );
        final ClientModel clientModel = ClientModel(
          id: clientId,
          address: 'address',
          email: 'email',
          lastName: 'lastName',
          name: 'name',
          phoneNumber: 29670128,
          photoUrl: 'photoUrl',
          isVip: false,
          role: 'role',
          clientCode: 'clientCode',
          fcmToken: 'fcmToken',
          isEmergencyAgent: false,
        );
        await firebaseDataSourceImpl.createClientInDataBase(clientModel);
        result = await firebaseDataSourceImpl.clientIsExist(clientId);
        expect(
          result,
          true,
          reason:
              'after the executing [createVeterinaryInDataBase] method, the [veterinaryIsExist] must find a client with id equal to $veterinaryId',
        );
      },
      timeout: const Timeout(
        Duration(
          milliseconds: 1000,
        ),
      ),
    );

    test(
      'update/fetch client method test',
      () async {
        const String newFirstName = 'John';
        final ClientModel clientModel = ClientModel(
          isEmergencyAgent: false,
          id: clientId,
          address: 'address',
          email: 'email',
          lastName: 'lastName',
          name: newFirstName,
          phoneNumber: 29670128,
          photoUrl: 'photoUrl',
          isVip: false,
          role: 'role',
          clientCode: 'clientCode',
          fcmToken: 'fcmToken',
        );
        await firebaseDataSourceImpl.updateClientInfo(
          clientModel,
        );
        final ClientModel clientModelFromDb =
            await firebaseDataSourceImpl.getClientInfo(
          clientId,
        );
        expect(
          clientModelFromDb,
          clientModel,
          reason:
              'after the executing [updateClientInfo] method, the [getClientInfo] must find a veterinary equal to $clientId',
        );
      },
      timeout: const Timeout(
        Duration(
          milliseconds: 1000,
        ),
      ),
    );

    test(
      'sign up method test',
      () async {
        await firebaseDataSourceImpl.auth.signOut();
        const String email = 'test@test.com';
        const String password = 'test@1234';
        expect(
          firebaseDataSourceImpl.auth.currentUser,
          null,
          reason: 'initially no user logged in',
        );
        firebaseDataSourceImpl.signupWithEmailAndPassword(
          email,
          password,
        );

        expect(firebaseDataSourceImpl.auth.currentUser, isNotNull,
            reason: 'the user already signed in');
      },
      timeout: const Timeout(
        Duration(
          milliseconds: 1000,
        ),
      ),
    );

    test(
      'logout method test',
      () async {
        await firebaseDataSourceImpl.logOut();

        expect(
          auth.currentUser,
          null,
          reason: 'the user logged out',
        );
      },
      timeout: const Timeout(
        Duration(
          milliseconds: 1000,
        ),
      ),
    );

    test(
      'sign in method test',
      () async {
        await auth.signOut();
        const String email = 'test@test.com';
        const String password = 'test@1234';

        expect(auth.currentUser, null,
            reason: 'assert that no user is already logged in');
        firebaseDataSourceImpl.signInWithEmailAndPassword(
          email,
          password,
        );

        expect(
          auth.currentUser,
          isNotNull,
          reason: 'the use already signed in',
        );
      },
      timeout: const Timeout(
        Duration(
          milliseconds: 1000,
        ),
      ),
    );
  });

  group('fetch client info exception', () {
    test('fetch client info exception', () {});
  });

  group('exist test ', () {
    test('updateVeterinaryInfo', () {
      final VeterinaryModel veterinaryModel = VeterinaryModel(
        id: '',
        profilePicture: "profilePicture",
        firstName: 'firstName',
        lastName: "lastName",
        phoneNumber: "phoneNumber",
        email: "email",
        isEmergencyAgent: true,
        isConfirmed: true,
        fcmToken: "fcmToken",
      );
      expect(
        () async => await firebaseDataSourceImpl.updateVeterinaryInfo(
          veterinaryModel,
        ),
        throwsA(isA<AuthUserNotExistException>()),
      );
    });

    test('updateClientInfo', () {
      final ClientModel clientModel = ClientModel(
        isEmergencyAgent: false,
        id: '',
        address: 'address',
        email: 'email',
        lastName: 'lastName',
        name: 'name',
        phoneNumber: 29670128,
        photoUrl: 'photoUrl',
        isVip: false,
        role: 'role',
        clientCode: 'clientCode',
        fcmToken: 'fcmToken',
      );
      expect(
        () async => await firebaseDataSourceImpl.updateClientInfo(
          clientModel,
        ),
        throwsA(isA<AuthUserNotExistException>()),
      );
    });

    test('createClientInDataBase ', () {
      final ClientModel clientModel = ClientModel(
        isEmergencyAgent: false,
        id: clientId,
        address: 'address',
        email: 'email',
        lastName: 'lastName',
        name: 'name',
        phoneNumber: 29670128,
        photoUrl: 'photoUrl',
        isVip: false,
        role: 'role',
        clientCode: 'clientCode',
        fcmToken: 'fcmToken',
      );
      expect(
        () async => await firebaseDataSourceImpl.createClientInDataBase(
          clientModel,
        ),
        throwsA(isA<AuthUserExistException>()),
      );
    });

    test('createClientInDataBase ', () {
      final VeterinaryModel veterinaryModel = VeterinaryModel(
        id: veterinaryId,
        profilePicture: "profilePicture",
        firstName: 'firstName',
        lastName: "lastName",
        phoneNumber: "phoneNumber",
        email: "email",
        isEmergencyAgent: true,
        isConfirmed: true,
        fcmToken: "fcmToken",
      );
      expect(
        () async => await firebaseDataSourceImpl.createVeterinaryInDataBase(
          veterinaryModel,
        ),
        throwsA(isA<AuthUserExistException>()),
      );
    });

    test('getVeterinaryInfo ', () {
      expect(
        () async => await firebaseDataSourceImpl.getVeterinaryInfo(
          'randomId',
        ),
        throwsA(isA<UserNotExistException>()),
      );
    });

    test('getClientInfo ', () {
      expect(
        () async => await firebaseDataSourceImpl.getClientInfo(
          'randomId',
        ),
        throwsA(isA<UserNotExistException>()),
      );
    });

    group('signInWithEmailAndPassword auth exception ', () {
      test('errorInvalidEmailSignIn', () async {
        MockFirebaseAuth auth = MockFirebaseAuth(
          authExceptions: AuthExceptions(
            signInWithEmailAndPassword:
                FirebaseAuthException(code: errorInvalidEmailSignIn),
          ),
        );

        FirebaseDataSourceImpl firebaseDataSourceImpl =
            FirebaseDataSourceImpl(firebaseFirestore, auth);
        expect(
          () async =>
              await firebaseDataSourceImpl.signInWithEmailAndPassword('', ''),
          throwsA(isA<AuthErrorInvalidEmailSignIn>()),
        );
      });

      test('errorWrongPassword', () async {
        MockFirebaseAuth auth = MockFirebaseAuth(
          authExceptions: AuthExceptions(
            signInWithEmailAndPassword:
                FirebaseAuthException(code: errorWrongPassword),
          ),
        );

        FirebaseDataSourceImpl firebaseDataSourceImpl =
            FirebaseDataSourceImpl(firebaseFirestore, auth);
        expect(
          () async =>
              await firebaseDataSourceImpl.signInWithEmailAndPassword('', ''),
          throwsA(isA<AuthErrorWrongPassword>()),
        );
      });

      test('prodUserNotFound', () async {
        MockFirebaseAuth auth = MockFirebaseAuth(
          authExceptions: AuthExceptions(
            signInWithEmailAndPassword:
                FirebaseAuthException(code: prodUserNotFound),
          ),
        );

        FirebaseDataSourceImpl firebaseDataSourceImpl =
            FirebaseDataSourceImpl(firebaseFirestore, auth);
        expect(
          () async =>
              await firebaseDataSourceImpl.signInWithEmailAndPassword('', ''),
          throwsA(isA<AuthErrorUserNotFound>()),
        );
      });

      test('errorUserDisabled', () async {
        MockFirebaseAuth auth = MockFirebaseAuth(
          authExceptions: AuthExceptions(
            signInWithEmailAndPassword:
                FirebaseAuthException(code: errorUserDisabled),
          ),
        );

        FirebaseDataSourceImpl firebaseDataSourceImpl =
            FirebaseDataSourceImpl(firebaseFirestore, auth);
        expect(
          () async =>
              await firebaseDataSourceImpl.signInWithEmailAndPassword('', ''),
          throwsA(isA<AuthErrorUserDisabled>()),
        );
      });

      test('errorTooManyRequests', () async {
        MockFirebaseAuth auth = MockFirebaseAuth(
          authExceptions: AuthExceptions(
              signInWithEmailAndPassword:
                  FirebaseAuthException(code: errorTooManyRequests),
              fetchSignInMethodsForEmail:
                  FirebaseAuthException(code: errorTooManyRequests)),
        );

        FirebaseDataSourceImpl firebaseDataSourceImpl =
            FirebaseDataSourceImpl(firebaseFirestore, auth);
        expect(
          () async =>
              await firebaseDataSourceImpl.signInWithEmailAndPassword('', ''),
          throwsA(isA<AuthErrorTooManyRequests>()),
        );
      });

      test('errorOperationNotFound', () async {
        MockFirebaseAuth auth = MockFirebaseAuth(
          authExceptions: AuthExceptions(
            signInWithEmailAndPassword:
                FirebaseAuthException(code: errorOperationNotFound),
          ),
        );

        FirebaseDataSourceImpl firebaseDataSourceImpl =
            FirebaseDataSourceImpl(firebaseFirestore, auth);
        expect(
          () async =>
              await firebaseDataSourceImpl.signInWithEmailAndPassword('', ''),
          throwsA(isA<AuthErrorOperationNotFound>()),
        );

        //when(firebaseDataSourceImpl.signInWithEmailAndPassword('', '')).thenThrow(AuthErrorOperationNotFound());
      });
    });
  });

  group('sign up exceptions', () {
    test('errorOperationNotAllowed', () async {
      MockFirebaseAuth auth = MockFirebaseAuth(
        authExceptions: AuthExceptions(
            createUserWithEmailAndPassword:
                FirebaseAuthException(code: errorOperationNotAllowed)),
      );

      FirebaseDataSourceImpl firebaseDataSourceImpl =
          FirebaseDataSourceImpl(firebaseFirestore, auth);
      expect(
        () async =>
            await firebaseDataSourceImpl.signupWithEmailAndPassword('', ''),
        throwsA(isA<AuthErrorOperationNotAllowed>()),
      );
    });

    test('errorWeakPassword', () async {
      MockFirebaseAuth auth = MockFirebaseAuth(
        authExceptions: AuthExceptions(
            createUserWithEmailAndPassword:
                FirebaseAuthException(code: errorWeakPassword)),
      );

      FirebaseDataSourceImpl firebaseDataSourceImpl =
          FirebaseDataSourceImpl(firebaseFirestore, auth);
      expect(
        () async =>
            await firebaseDataSourceImpl.signupWithEmailAndPassword('', ''),
        throwsA(isA<AuthErrorWeakPassword>()),
      );
    });

    test('errorInvalidEmailSignup', () async {
      MockFirebaseAuth auth = MockFirebaseAuth(
        authExceptions: AuthExceptions(
            createUserWithEmailAndPassword:
                FirebaseAuthException(code: errorInvalidEmailSignup)),
      );

      FirebaseDataSourceImpl firebaseDataSourceImpl =
          FirebaseDataSourceImpl(firebaseFirestore, auth);
      expect(
        () async =>
            await firebaseDataSourceImpl.signupWithEmailAndPassword('', ''),
        throwsA(isA<AuthErrorInvalidEmailSignup>()),
      );
    });

    test('errorEmailAlreadyInUse', () async {
      MockFirebaseAuth auth = MockFirebaseAuth(
        authExceptions: AuthExceptions(
            createUserWithEmailAndPassword:
                FirebaseAuthException(code: errorEmailAlreadyInUse)),
      );

      FirebaseDataSourceImpl firebaseDataSourceImpl =
          FirebaseDataSourceImpl(firebaseFirestore, auth);
      expect(
        () async =>
            await firebaseDataSourceImpl.signupWithEmailAndPassword('', ''),
        throwsA(isA<AuthErrorEmailAlreadyInUse>()),
      );
    });

    test('errorInvalidCredential', () async {
      MockFirebaseAuth auth = MockFirebaseAuth(
        authExceptions: AuthExceptions(
            createUserWithEmailAndPassword:
                FirebaseAuthException(code: errorInvalidCredential)),
      );

      FirebaseDataSourceImpl firebaseDataSourceImpl =
          FirebaseDataSourceImpl(firebaseFirestore, auth);
      expect(
        () async =>
            await firebaseDataSourceImpl.signupWithEmailAndPassword('', ''),
        throwsA(isA<AuthErrorInvalidCredential>()),
      );
    });
  });

  group('sign in process', () {
    test('process  veterinary test', () async {
      final VeterinaryModel veterinaryModel = VeterinaryModel(
        id: 'mock_uid',
        profilePicture: "profilePicture",
        firstName: "firstName",
        lastName: "lastName",
        phoneNumber: "phoneNumber",
        email: "email",
        isEmergencyAgent: true,
        isConfirmed: true,
        fcmToken: "fcmToken",
      );
      await firebaseDataSourceImpl.createVeterinaryInDataBase(veterinaryModel);

      await firebaseDataSourceImpl.signupWithEmailAndPassword(
        'veterinary@veterinary.com',
        '111111',
      );

      final result = await firebaseDataSourceImpl.signInProcess(
        'veterinary@veterinary.com',
        '111111',
      );
      expect(result, isA<VeterinaryModel>());
      expect(veterinaryModel, result);
    });

    // test('process  client test', () async {
    //   //await firebaseDataSourceImpl.logOut();
    //   final ClientModel clientModel = ClientModel(
    //     isEmergencyAgent: false,
    //     id: 'mock_uid',
    //     address: 'address',
    //     email: 'email',
    //     lastName: 'lastName',
    //     name: 'name',
    //     phoneNumber: 29670128,
    //     photoUrl: 'photoUrl',
    //     isVip: false,
    //     role: 'role',
    //     clientCode: 'clientCode',
    //     fcmToken: 'fcmToken',
    //   );
    //   await firebaseDataSourceImpl.createClientInDataBase(clientModel);

    //   await firebaseDataSourceImpl.signupWithEmailAndPassword(
    //     'client@client.com',
    //     '111111',
    //   );

    //   final result = await firebaseDataSourceImpl.signInProcess(
    //     'client@client.com',
    //     '111111',
    //   );
    //   expect(result, isA<ClientModel>());
    //   expect(clientModel, result);
    // });
  });
  group('signup process exception', () {
    test('errorInvalidEmailSignIn', () async {
      MockFirebaseAuth auth = MockFirebaseAuth(
        authExceptions: AuthExceptions(
          signInWithEmailAndPassword:
              FirebaseAuthException(code: errorInvalidEmailSignIn),
        ),
      );

      FirebaseDataSourceImpl firebaseDataSourceImpl =
          FirebaseDataSourceImpl(firebaseFirestore, auth);
      expect(
        () async => await firebaseDataSourceImpl.signInProcess('', ''),
        throwsA(isA<AuthErrorInvalidEmailSignIn>()),
      );
    });

    test('errorWrongPassword', () async {
      MockFirebaseAuth auth = MockFirebaseAuth(
        authExceptions: AuthExceptions(
          signInWithEmailAndPassword:
              FirebaseAuthException(code: errorWrongPassword),
        ),
      );

      FirebaseDataSourceImpl firebaseDataSourceImpl =
          FirebaseDataSourceImpl(firebaseFirestore, auth);
      expect(
        () async => await firebaseDataSourceImpl.signInProcess('', ''),
        throwsA(isA<AuthErrorWrongPassword>()),
      );
    });

    test('prodUserNotFound', () async {
      MockFirebaseAuth auth = MockFirebaseAuth(
        authExceptions: AuthExceptions(
          signInWithEmailAndPassword:
              FirebaseAuthException(code: prodUserNotFound),
        ),
      );

      FirebaseDataSourceImpl firebaseDataSourceImpl =
          FirebaseDataSourceImpl(firebaseFirestore, auth);
      expect(
        () async => await firebaseDataSourceImpl.signInProcess('', ''),
        throwsA(isA<AuthErrorUserNotFound>()),
      );
    });

    test('errorUserDisabled', () async {
      MockFirebaseAuth auth = MockFirebaseAuth(
        authExceptions: AuthExceptions(
          signInWithEmailAndPassword:
              FirebaseAuthException(code: errorUserDisabled),
        ),
      );

      FirebaseDataSourceImpl firebaseDataSourceImpl =
          FirebaseDataSourceImpl(firebaseFirestore, auth);
      expect(
        () async => await firebaseDataSourceImpl.signInProcess('', ''),
        throwsA(isA<AuthErrorUserDisabled>()),
      );
    });

    test('errorTooManyRequests', () async {
      MockFirebaseAuth auth = MockFirebaseAuth(
        authExceptions: AuthExceptions(
            signInWithEmailAndPassword:
                FirebaseAuthException(code: errorTooManyRequests),
            fetchSignInMethodsForEmail:
                FirebaseAuthException(code: errorTooManyRequests)),
      );

      FirebaseDataSourceImpl firebaseDataSourceImpl =
          FirebaseDataSourceImpl(firebaseFirestore, auth);
      expect(
        () async => await firebaseDataSourceImpl.signInProcess('', ''),
        throwsA(isA<AuthErrorTooManyRequests>()),
      );
    });

    test('errorOperationNotFound', () async {
      MockFirebaseAuth auth = MockFirebaseAuth(
        authExceptions: AuthExceptions(
          signInWithEmailAndPassword:
              FirebaseAuthException(code: errorOperationNotFound),
        ),
      );

      FirebaseDataSourceImpl firebaseDataSourceImpl =
          FirebaseDataSourceImpl(firebaseFirestore, auth);
      expect(
        () async => await firebaseDataSourceImpl.signInProcess('', ''),
        throwsA(isA<AuthErrorOperationNotFound>()),
      );

      //when(firebaseDataSourceImpl.signInWithEmailAndPassword('', '')).thenThrow(AuthErrorOperationNotFound());
    });
  });
}

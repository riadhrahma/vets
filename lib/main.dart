import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vets_project/core/routes/routes.dart';
import 'package:vets_project/features/chat/presentation/Views/client/client_chat_main_screen.dart';
import 'package:vets_project/features/chat/presentation/Views/client/emergency_chat/emergency_chat_image_preview_screen.dart';
import 'package:vets_project/features/chat/presentation/Views/client/emergency_chat/map_screen.dart';
import 'package:vets_project/features/chat/presentation/Views/client/general_chat/general_chat_image_preview_screen.dart';
import 'package:vets_project/features/profile/presentation/views/client/client_profile_screen.dart';
import 'package:vets_project/firebase_options.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        return ScreenUtilInit(
          splitScreenMode: true,
          useInheritedMediaQuery: true,
          minTextAdapt: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: Routes.splashScreen,
              routes: Routes.routes(),
              title: 'Vets Project',
              theme: ThemeData(
                fontFamily: 'Montserrat',
                primarySwatch: Colors.blue,
              ),
              home: child,
            );
          },
          child: const ClientChatMainScreen(),
        );
      },
    );
  }
}

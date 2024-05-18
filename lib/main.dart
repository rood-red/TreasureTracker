import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treasure_tracker/routes/router_delegate.dart';
import 'package:treasure_tracker/ui/intro_screen/intro_screen_bindings.dart';
import 'firebase_options.dart';
import 'routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Preload images
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Preload images
    precacheImage(const AssetImage("assets/png/google.png"), context);
    precacheImage(const AssetImage("assets/png/treasure_tracker.png"), context);

    return GetMaterialApp.router(
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontFamily: 'Inter'),
        ),
      ),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade,
      title: 'TreasureTracker',
      routerDelegate: AppRouterDelegate(),
      getPages: AppPages.routes,
      initialBinding: IntroBinding(),
    );
  }
}

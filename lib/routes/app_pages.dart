import 'package:get/get.dart';
import 'package:treasure_tracker/ui/congratulations_screen/congratulations_bindings.dart';
import 'package:treasure_tracker/ui/congratulations_screen/congratulations_view.dart';
import 'package:treasure_tracker/ui/intro_screen/intro_screen_bindings.dart';
import 'package:treasure_tracker/ui/intro_screen/intro_screen_view.dart';
import 'package:treasure_tracker/ui/login_screen/login_screen_bindings.dart';
import 'package:treasure_tracker/ui/login_screen/login_screen_view.dart';
import 'package:treasure_tracker/ui/reset_password_screen/reset_password_binding.dart';
import 'package:treasure_tracker/ui/reset_password_screen/reset_password_view.dart';
import 'package:treasure_tracker/ui/sign_up_screen/sign_up_binding.dart';
import 'package:treasure_tracker/ui/sign_up_screen/sign_up_view.dart';
import 'package:treasure_tracker/ui/welcome_dashboard/welcome_bindings.dart';
import 'package:treasure_tracker/ui/welcome_dashboard/welcome_dashboard_view.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.intro;

  static final routes = [
    GetPage(
      name: AppRoutes.intro,
      page: () => const IntroScreen(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => const SignUpScreen(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.congatulations,
      page: () => const CongratulationsScreen(),
      binding: CongratulationsBinding(),
    ),
    GetPage(
      name: AppRoutes.welcome,
      page: () => const WelcomeDashboardView(),
      binding: WelcomeDashboardBindings(),
    ),
  ];
}

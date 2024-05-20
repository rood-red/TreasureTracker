import 'package:get/get.dart';
import 'package:treasure_tracker/ui/congratulations_screen/congratulations_bindings.dart';
import 'package:treasure_tracker/ui/congratulations_screen/congratulations_view.dart';
import 'package:treasure_tracker/ui/intro_screen/intro_screen_bindings.dart';
import 'package:treasure_tracker/ui/intro_screen/intro_screen_view.dart';
import 'package:treasure_tracker/ui/create_account/create_account_binding.dart';
import 'package:treasure_tracker/ui/create_account/create_account_screen.dart';
import 'package:treasure_tracker/ui/login_screen/login_bindings.dart';
import 'package:treasure_tracker/ui/login_screen/login_view.dart';
import 'package:treasure_tracker/ui/forgot_password_screen/forgot_password_binding.dart';
import 'package:treasure_tracker/ui/forgot_password_screen/forgot_password_view.dart';
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
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.createAccount,
      page: () => const CreateAccountScreen(),
      binding: CreateAccountBinding(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => const SignUpScreen(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
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

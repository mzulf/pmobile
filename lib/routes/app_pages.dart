import 'package:get/get.dart';
import '../screens/auth/welcome_screen.dart';
import '../screens/auth/signin_screen.dart';
import '../screens/auth/signup_screen.dart';
import '../screens/auth/phone_verification_screen.dart';
import '../screens/auth/otp_verification_screen.dart';
import '../screens/auth/reset_password_screen.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/laundry/fragrance_selection_screen.dart';
import '../screens/laundry/service_order_screen.dart';
import '../screens/laundry/laundry_service_screen.dart';

abstract class Routes {
  static const String WELCOME = '/welcome';
  static const String SIGNIN = '/signin';
  static const String SIGNUP = '/signup';
  static const String PHONE_VERIFICATION = '/phone-verification';
  static const String OTP_VERIFICATION = '/otp-verification';
  static const String RESET_PASSWORD = '/reset-password';
  static const String DASHBOARD = '/dashboard';
  static const String FRAGRANCE_SELECTION = '/fragrance-selection';
  static const String SERVICE_ORDER = '/service-order';
  static const String LAUNDRY_SERVICE = '/laundry-service';
}

class AppPages {
  static const String INITIAL = Routes.WELCOME;

  static final List<GetPage> routes = [
    GetPage(
      name: Routes.WELCOME,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: Routes.SIGNIN,
      page: () => const SignInScreen(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => const SignUpScreen(),
    ),
    GetPage(
      name: Routes.PHONE_VERIFICATION,
      page: () => const PhoneVerificationScreen(),
    ),
    GetPage(
      name: Routes.OTP_VERIFICATION,
      page: () => const OTPVerificationScreen(),
    ),
    GetPage(
      name: Routes.RESET_PASSWORD,
      page: () => const ResetPasswordScreen(),
    ),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => const DashboardScreen(),
    ),

    // New pages for laundry flow
    GetPage(
      name: Routes.FRAGRANCE_SELECTION,
      page: () => const FragranceSelectionScreen(),
    ),
    GetPage(
      name: Routes.SERVICE_ORDER,
      page: () => const ServiceOrderScreen(),
    ),
    GetPage(
      name: Routes.LAUNDRY_SERVICE,
      page: () => const LaundryServiceScreen(),
    ),
  ];
}
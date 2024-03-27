import 'package:get/get.dart';
import 'package:test_app/controllers/login_controller.dart';
import 'package:test_app/controllers/otp_controller.dart';
import 'package:test_app/di/di_config.dart';
import 'package:test_app/screens/flash/flash_screen.dart';
import 'package:test_app/screens/login/login_screen.dart';
import 'package:test_app/screens/login/otp_screen.dart';
import 'package:test_app/screens/login/success_screen.dart';
import 'package:test_app/screens/main/main_screen.dart';
import 'package:test_app/service/login_service.dart';
import 'package:test_app/service/otp_service.dart';

class RouteGenerator {
  static const String login = '/login';
  static const String otp = '/otp';
  static const String main = '/main';
  static const String home = '/';
  static const String success = '/success';

  static List<GetPage> generateRoute = <GetPage<dynamic>>[
    GetPage(
      name: home,
      page: () => const FlashScreen(),
    ),
    GetPage(
      name: main,
      page: () => const MainScreen(),
    ),
    GetPage(
      name: login,
      bindings: [
        BindingsBuilder<LoginController>(
          () {
            Get.lazyPut<LoginController>(
              () => LoginController(
                getIt.get<LoginService>(),
              ),
            );
          },
        ),
      ],
      page: () => LoginScreen(),
    ),
    GetPage(
      name: otp,
      bindings: [
        BindingsBuilder<OtpController>(() {
          Get.lazyPut<OtpController>(
            () => OtpController(getIt.get<OtpService>()),
          );
        })
      ],
      page: () => const OtpScreen(),
    ),
    GetPage(
      name: success,
      page: () => const SuccessScreen(),
    ),
  ];
}

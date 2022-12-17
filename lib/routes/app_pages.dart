
import 'package:cits_assignment/views/home_view.dart';
import 'package:cits_assignment/views/product_page_view.dart';
import 'package:get/get.dart';

import '../views/abcd.dart';
import '../views/login_page_view.dart';
import '../views/registration_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.REGISTRATION;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      // binding: HomeBinding(),
    ),
    
    GetPage(
      name: _Paths.REGISTRATION,
      page: () => RegistrationView(),
      // binding: RegistrationBinding(),
    ),
  ];
}

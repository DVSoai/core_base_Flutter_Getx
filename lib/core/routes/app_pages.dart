import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../../pages/initial/initial_binding.dart';
import '../../pages/initial/initial_page.dart';
import '../../pages/welcome/welcome_binding.dart';
import '../../pages/welcome/welcome_page.dart';
import 'app_routes.dart';

abstract class AppPages {
  static final pages = [

    GetPage(
        name: AppRoutes.root,
        page: () => const InitialPage(),
        binding: InitialBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: AppRoutes.welcome,
        page: () => const WelcomePage(),
        binding: WelcomeBinding()),
  ];
}


import 'package:core_base_flutter/provider/main_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'core/l10n/locale_manager.dart';
import 'core/routes/app_pages.dart';
import 'core/routes/app_routes.dart';
import 'core/theme/app_theme_controller.dart';
import 'data/repositories/auth/auth_repository.dart';
import 'data/repositories/auth/auth_repository_impl.dart';
import 'data/repositories/user/user_repository.dart';
import 'data/repositories/user/user_repository_impl.dart';
import 'data/source/local/local_storage.dart';
import 'domain/service/auth/auth_service.dart';
import 'domain/service/user/user_service.dart';

class ComicApp extends StatelessWidget {
  const ComicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Comic App',
      debugShowCheckedModeBanner: false,
      theme: Get.find<AppThemeController>().getTheme(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: AppRoutes.root,
      getPages: AppPages.pages,
    );
  }
}
initApp() async {
  // Local storage
  await Get.put<LocalStorage>(LocalStorageImpl()).init();

  // Main provider
  Get.put<MainProvider>(MainProvider());
  Get.put<AppThemeController>(AppThemeController());
  Get.put<LanguageManager>(LanguageManager());

  // Repository
  Get.put<AuthRepository>(AuthRepositoryImpl());
  Get.put<UserRepository>(UserRepositoryImpl());

  // Service
  Get.put<AuthService>(AuthService());
  Get.put<UserService>(UserService());


  // Controllers
}


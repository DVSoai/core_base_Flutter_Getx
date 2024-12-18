# Setup
## Install dependency
flutter pub get
## Generate Localkeys for L10n
dart run easy_localization:generate -S assets/translations -O lib/core/l10n -o locale_keys.g.dart -f keys
or
flutter run easy_localization:generate -S assets/translations -O lib/core/l10n -o locale_keys.g.dart -f keys
## Generate .g.dart for isar local database
dart run build_runner watch --delete-conflicting-outputs
## Add splash screen
dart run flutter_native_splash:create --path=flutter_native_splash.yaml
# Run dev
flutter run  dev -t lib/main.dart

## Project structure
- Repository: extends class ApiService to call API for only one category
- Service: call to repository to process business logic
- GetxController: Call to Service
enum AppScreen { login, main }

extension AppScreenExtension on AppScreen {
  String get toPath {
    switch (this) {
      case AppScreen.login:
        return "/login";
      case AppScreen.main:
        return "/main";
    }
  }

//없어도 됨
  // String get toName {
  //   switch (this) {
  //     case AppScreen.login:
  //       return "LOGIN";
  //     case AppScreen.main:
  //       return "MAIN";
  //   }
  // }
}

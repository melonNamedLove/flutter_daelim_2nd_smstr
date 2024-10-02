import 'package:daelim/routes/app_screen.dart';
import 'package:daelim/screens/login/login_sceen.dart';
import 'package:daelim/screens/main/main_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: AppScreen.login.toPath, //시작점 set

  routes: [
    //로그인화며면
    GoRoute(
        path: AppScreen.login.toPath,
        name: AppScreen.login.name,
        builder: (context, state) => const LoginSrceen()),

    //메인화면

    GoRoute(
        path: AppScreen.main.toPath,
        name: AppScreen.main.name,
        builder: (context, state) => const MainScreen()),
  ],
);

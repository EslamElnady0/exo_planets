import 'package:exo_planets/features/auth/presentation/views/auth_view.dart';
import 'package:exo_planets/features/auth/presentation/views/log_in_view.dart';
import 'package:exo_planets/features/auth/presentation/views/sign_up_view.dart';
import 'package:exo_planets/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:exo_planets/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String onboarding = '/onboarding';
  static const String splash = '/';
  static const String home = '/home';
  static const String auth = '/auth';
  static const String logIn = '/logIn';
  static const String signUp = '/signUp';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return _viewMaterialRoute(view: const SplashView());
      case onboarding:
        return _viewMaterialRoute(view: const OnboardingView());
      case auth:
        return _viewMaterialRoute(view: const AuthView());
      case logIn:
        return _viewMaterialRoute(view: const LogInView());
      case signUp:
        return _viewMaterialRoute(view: const SignUpView());
      default:
        return null;
    }
  }

  static MaterialPageRoute<dynamic> _viewMaterialRoute(
      {required Widget view, Object? arguments}) {
    return MaterialPageRoute(
        builder: (context) => view,
        settings: RouteSettings(arguments: arguments));
  }
}

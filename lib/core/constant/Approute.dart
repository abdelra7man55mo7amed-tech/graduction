import 'package:go_router/go_router.dart';
import 'package:graductaion/core/screens/avater_screen.dart';
import 'package:graductaion/core/screens/forgetPassword_screen.dart';
import 'package:graductaion/core/screens/language_screen.dart';
import 'package:graductaion/core/screens/login_screen.dart';
import 'package:graductaion/core/screens/onboarding_screen.dart';
import 'package:graductaion/core/screens/parentLink_screen.dart';
import 'package:graductaion/core/screens/quiz.dart';
import 'package:graductaion/core/screens/learning.dart';
import 'package:graductaion/core/screens/accountDone_screen.dart';
import 'package:graductaion/core/screens/register_screen.dart';
import 'package:graductaion/core/screens/setNewPassword_screen.dart';
import 'package:graductaion/core/screens/splash_screen.dart';
import 'package:graductaion/core/screens/topicOption_screen.dart';
import 'package:graductaion/core/screens/verifyParent_screen.dart';
import 'package:graductaion/core/screens/verify_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String quiz = '/quiz';
  static const String learning = '/learning';
  static const String accountDone = '/account-done';
  static const String interests = '/interests';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String forgetPassword = '/forgetPassword';
  static const String varifyEmailScreen = '/varifyEmailScreen';
  static const String setNewPassword = '/setNewPassword';
  static const String register = '/register';
  static const String parentLink = '/parentLink';
  static const String varifyParent = '/varifyParent';
  static const String avatar = '/avatar';
  static const String language = '/language';
}

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(path: AppRoutes.quiz, builder: (context, state) => const Quiz()),
    GoRoute(
      path: AppRoutes.learning,
      builder: (context, state) => const LearningGoalScreen(),
    ),
    GoRoute(
      path: AppRoutes.accountDone,
      builder: (context, state) => const AccountDoneScreen(),
    ),
    GoRoute(
      path: AppRoutes.interests,
      builder: (context, state) => const InterestsScreen(),
    ),
    GoRoute(
      path: AppRoutes.onboarding,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRoutes.forgetPassword,
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
    GoRoute(
      path: AppRoutes.varifyEmailScreen,
      builder: (context, state) => const VerifyEmailScreen(),
    ),
    GoRoute(
      path: AppRoutes.setNewPassword,
      builder: (context, state) => const SetNewPasswordScreen(),
    ),
    GoRoute(
      path: AppRoutes.register,
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: AppRoutes.parentLink,
      builder: (context, state) => const ParentlinkScreen(),
    ),
    GoRoute(
      path: AppRoutes.varifyParent,
      builder: (context, state) => const VerifyparentScreen(),
    ),
    GoRoute(
      path: AppRoutes.avatar,
      builder: (context, state) => const ChooseAvatarScreen(),
    ),
    GoRoute(
      path: AppRoutes.language,
      builder: (context, state) => const LanguageScreen(),
    ),
  ],
);

import 'package:go_router/go_router.dart';
import 'package:workout_tracker/landing_page.dart';

// GoRouter configuration
final router = GoRouter( //'_'지우고 글로벌변수로 전환
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LandingPage(),
    ),
  ],
);
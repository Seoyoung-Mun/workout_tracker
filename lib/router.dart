import 'package:go_router/go_router.dart';
import 'package:workout_tracker/landing_page.dart';
import 'package:workout_tracker/workout_home_page.dart';
import 'package:workout_tracker/workout_list_page.dart';
import 'package:workout_tracker/workout_guide_page.dart';

// GoRouter configuration
final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LandingPage(),
      routes: [
        GoRoute(
          path: 'workout_home',
          builder: (context, state) => WorkoutHomePage(),
          routes: [
            GoRoute(
              path: 'workout_list',
              builder: (context, state) => WorkoutListPage(),
              routes: [
                GoRoute(
                  path: 'workout_guide',
                  builder: (context, state) => WorkoutGuidePage(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
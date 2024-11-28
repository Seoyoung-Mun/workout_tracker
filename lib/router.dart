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
              path: 'workout_list/:group_index',
              builder: (context, state) {
              String? groupIndexString = state.pathParameters['group_index'];
              final groupIndex = int.parse(groupIndexString!);
              return WorkoutListPage(groupIndex: groupIndex);
              },
              routes: [
                GoRoute(
                  path: 'workout_guide/:workouts_index',
                  builder: (context, state) {
                    String? workoutsIndexString = state.pathParameters['workouts_index'];
                    final workoutsIndex = int.parse(workoutsIndexString!); //안정적인 방식은 아님. 예외처리 구문을 추가 해야함.

                    String? groupIndexString = state.pathParameters['group_index'];
                    final groupIndex = int.parse(groupIndexString!);

                    return WorkoutGuidePage(workoutsIndex: workoutsIndex, groupIndex: groupIndex);
                    },
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
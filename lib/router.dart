import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_tracker/pages/landing_page.dart';
import 'package:workout_tracker/pages/frame_page.dart';
// import 'package:workout_tracker/pages/simple_state/my_workout_list_page.dart';
import 'package:workout_tracker/pages/provider_state/my_workout_list_page.dart';
import 'package:workout_tracker/pages/profile_page.dart';
import 'package:workout_tracker/pages/reset_password_page.dart';
import 'package:workout_tracker/pages/workout_home_page.dart';
import 'package:workout_tracker/pages/workout_list_page.dart';
import 'package:workout_tracker/pages/workout_guide_page.dart';
import 'package:workout_tracker/pages/settings_page.dart';
import 'package:workout_tracker/pages/login_page.dart';
import 'package:workout_tracker/pages/registration_page.dart';
import 'package:workout_tracker/pages/animation_practice_widget.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _homeNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'home');
final GlobalKey<NavigatorState> _settingsNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'setting');

// GoRouter configuration
final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  redirect: (context, state) {
    //redirect에서 페이지를 제한
    //왜 제한하냐면, 로그인을 하지 않은 사용자가 로그인한 사용자만 볼 수 있는 페이지로 가려고 할때
    //로그인 페이지로 리디렉션 하게 만든다.
    User? user = FirebaseAuth.instance.currentUser; //로그인 사용자의 정보를 가져온다.
    //로그인 사용자가 없고 로그인 페이지로 가려고 할때 로그인 페이지로 리디렉션
    if (user == null &&
        (state.uri.path != '/settings/login/registration' &&
            state.uri.path != '/settings/login/reset_password') &&
        state.uri.path != '/') {
      return '/settings/login';
    }
    //로그인 사용자가 있고 로그인 페이지로 가려고 할때 메인 페이지로 리디렉션
    if (user != null &&
        (state.uri.path == '/settings/login' ||
            state.uri.path == '/settings/reset_password')) {
      return '/settings';
    }
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return LandingPage();
        // return AnimationPracticeWidget();
      },
    ),
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state, navigationShell) {
        return FramePage(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _homeNavigatorKey,
          routes: [
            GoRoute(
              path: '/workout_home',
              builder: (context, state) => WorkoutHomePage(),
              routes: [
                GoRoute(
                  path: 'my_workout_list',
                  builder: (context, state) => MyWorkoutListPage(),
                ),
                GoRoute(
                  path: 'workout_list/:group_index',
                  builder: (context, state) {
                    String? groupIndexString =
                        state.pathParameters['group_index'];
                    final groupIndex = int.parse(groupIndexString!);
                    return WorkoutListPage(groupIndex: groupIndex);
                  },
                  routes: [
                    GoRoute(
                      path: 'workout_guide/:workouts_index',
                      builder: (context, state) {
                        String? workoutsIndexString =
                            state.pathParameters['workouts_index'];
                        final workoutsIndex = int.parse(
                            workoutsIndexString!); //안정적인 방식은 아님. 예외처리 구문을 추가 해야함.

                        String? groupIndexString =
                            state.pathParameters['group_index'];
                        final groupIndex = int.parse(groupIndexString!);

                        return WorkoutGuidePage(
                            workoutsIndex: workoutsIndex,
                            groupIndex: groupIndex);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _settingsNavigatorKey,
          routes: [
            GoRoute(
              path: '/settings',
              builder: (context, state) {
                return SettingsPage();
              },
              routes: [
                GoRoute(
                  path: 'login',
                  builder: (context, state) {
                    return LoginPage();
                  },
                  routes: [
                    GoRoute(
                      path: 'registration',
                      builder: (context, state) {
                        return RegistrationPage();
                      },
                    ),
                    GoRoute(
                      path: 'reset_password',
                      builder: (context, state) {
                        return ResetPasswordPage();
                      },
                    )
                  ],
                ),
                GoRoute(
                    path: 'profile',
                    builder: (context, state) {
                      return ProfilePage();
                    }),
              ],
            )
          ],
        )
      ],
    ),
  ],
);

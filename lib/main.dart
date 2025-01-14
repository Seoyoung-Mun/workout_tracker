import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:workout_tracker/logic/provider/workout_provider.dart';
import 'package:workout_tracker/logic/workout_bloc/workout_bloc.dart';
import 'package:workout_tracker/repository/workout_repository.dart';
import 'package:workout_tracker/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:workout_tracker/services/fake_db.dart';
import 'firebase_options.dart';

import 'package:workout_tracker/pages/landing_page.dart';
import 'package:workout_tracker/pages/workout_list_page.dart';
import 'package:workout_tracker/pages/workout_guide_page.dart';
import 'package:workout_tracker/pages/workout_home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //main함수를 비동기로 수행할 때
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //simple state
    // return MaterialApp.router(
    //   routerConfig: router,
    //   //
    //   theme: FlexThemeData.light(scheme: FlexScheme.redWine),
    //   //     // home: LandingPage(),
    //   //     // home: WorkoutListPage(),
    //   //     // home: WorkoutGuidePage(),
    //   //     // home: WorkoutHomePage(),
    // );

    //provider
    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (_) => WorkoutProvider()),
    //   ],
    //   child: MaterialApp.router(
    //     routerConfig: router,
    //
    //     theme: FlexThemeData.light(scheme: FlexScheme.redWine),
    //     // home: LandingPage(),
    //     // home: WorkoutListPage(),
    //     // home: WorkoutGuidePage(),
    //     // home: WorkoutHomePage(),
    //   ),
    // );
    return MultiBlocProvider(
      providers: [
        BlocProvider<WorkoutBloc>(
          create: (context) => WorkoutBloc(
            WorkoutRepository(
              FakeDb(),
            ),
          ),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        //
        theme: FlexThemeData.light(scheme: FlexScheme.redWine),
        //     // home: LandingPage(),
        //     // home: WorkoutListPage(),
        //     // home: WorkoutGuidePage(),
        //     // home: WorkoutHomePage(),
      ),
    );
  }
}

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:provider/provider.dart';
import 'package:workout_tracker/constants.dart';
import 'package:workout_tracker/logic/provider/article_provider.dart';
import 'package:workout_tracker/logic/provider/workout_provider.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:workout_tracker/logic/workout_bloc/workout_bloc.dart';
// import 'package:workout_tracker/repository/workout_repository.dart';
import 'package:workout_tracker/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //main함수를 비동기로 수행할 때
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (kIsWeb) {
    usePathUrlStrategy();
    runApp(MyAppForWeb());
  } else {
    runApp(MyApp());
  }
}

class MyAppForWeb extends StatelessWidget {
  const MyAppForWeb({super.key});

  @override
  Widget build(BuildContext context) {
    //provider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WorkoutProvider()),
        ChangeNotifierProvider(create: (_) => ArticleProvider()),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        theme: FlexThemeData.light(scheme: FlexScheme.redWine),
        builder: (context, child) {
          return LayoutBuilder(builder: (context, constraints) {
            double width = (constraints.maxWidth > kMaxScreenWidth)
                ? kMaxScreenWidth
                : constraints.maxWidth;
            double height = (constraints.maxHeight > kMinScreenHeight)
                ? kMinScreenHeight
                : constraints.maxHeight;
            return Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: width,
                      height: height,
                      child: child,
                    ),
                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WorkoutProvider()),
        ChangeNotifierProvider(create: (_) => ArticleProvider()),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        theme: FlexThemeData.light(scheme: FlexScheme.redWine),
      ),
    );

    //bloc
    // return MultiRepositoryProvider(
    //   providers: [
    //     RepositoryProvider<WorkoutRepository>(
    //       create: (context) => WorkoutRepository(
    //         FakeDb(),
    //       ),
    //     ),
    //   ],
    //   child: MultiBlocProvider(
    //     providers: [
    //       BlocProvider<WorkoutBloc>(
    //         create: (context) => WorkoutBloc(
    //           context.read<WorkoutRepository>(),
    //         ),
    //       ),
    //     ],
    //     child: MaterialApp.router(
    //       routerConfig: router,
    //       theme: FlexThemeData.light(scheme: FlexScheme.redWine),
    //     ),
    //   ),
    // );
  }
}

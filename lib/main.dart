import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'package:workout_tracker/landing_page.dart';
import 'package:workout_tracker/workout_list_page.dart';
import 'package:workout_tracker/workout_guide_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: FlexThemeData.light(scheme: FlexScheme.redWine),
      // home: LandingPage(),
      // home: WorkoutListPage(),
      home: WorkoutGuidePage(),
    );
  }
}

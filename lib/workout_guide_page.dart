import 'package:flutter/material.dart';

class WorkoutGuidePage extends StatelessWidget {
  const WorkoutGuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('WorkoutGuide'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Text('스쿼트', style: Theme.of(context).textTheme.displaySmall),
            Row(
              children: [],
            ),
            Text('30분',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: Theme.of(context).colorScheme.secondary)),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.play_circle_fill),
              iconSize: Theme.of(context).textTheme.headlineLarge?.fontSize,
            )
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class WorkoutGuidePage extends StatefulWidget {
  WorkoutGuidePage({super.key});

  @override
  State<WorkoutGuidePage> createState() => _WorkoutGuidePageState();
}

class _WorkoutGuidePageState extends State<WorkoutGuidePage> {
  final player = AudioPlayer();

  IconButton getIconButton(){
    if(player.state == PlayerState.playing){
      return IconButton(
        onPressed: () async{
          await player.stop();
          setState(() {});
        },
        icon: Icon(Icons.stop_circle),
        iconSize: Theme.of(context).textTheme.displaySmall?.fontSize,
        color: Theme.of(context).colorScheme.primary,
      );
    } else{
      return IconButton(
        onPressed: () async {
          await player.play(AssetSource('sounds/squat.mp3'));
          setState(() {});
        },
        icon: Icon(Icons.play_circle_fill),
        iconSize: Theme.of(context).textTheme.displaySmall?.fontSize,
        color: Theme.of(context).colorScheme.primary,
    );
    }


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('WorkoutGuide'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('스쿼트', style: Theme.of(context).textTheme.displaySmall),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back_ios),
                  iconSize: Theme.of(context).textTheme.displayLarge?.fontSize,
                ),
                // Image(image: AssetImage('assets/squat.jpeg'),),
                Expanded(child: Image.asset('assets/squat.jpeg')),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_forward_ios),
                  iconSize: Theme.of(context).textTheme.displayLarge?.fontSize,
                ),
              ],
            ),
            Text('30분',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: Theme.of(context).colorScheme.secondary)),
            getIconButton()
          ],
        ));
  }
}

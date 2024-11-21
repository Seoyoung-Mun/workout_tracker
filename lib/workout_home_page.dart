import 'package:flutter/material.dart';
import 'package:workout_tracker/dashboard_card.dart';

class WorkoutHomePage extends StatefulWidget {
  const WorkoutHomePage({super.key});

  @override
  State<WorkoutHomePage> createState() => _WorkoutHomePageState();
}

class _WorkoutHomePageState extends State<WorkoutHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text('Just Do It'),
                    Text('간단하다. 흔들리면 그것은 지방이다.'),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/me.jpg'),
                  ),
                ),
              )
            ],
          ),
          Expanded(
            //세로 확장
            flex: 6,
            child: Row(
              children: [
                Expanded(
                  //가로 확장
                  child: DashboardCard(),
                ),
                Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                  ],
                ),Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child:DashboardCard(),
                      ),Expanded(
                        child: DashboardCard(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                SizedBox(child: DashboardCard(), width: 250),
                SizedBox(child: DashboardCard(), width: 250),
                SizedBox(child: DashboardCard(), width: 250),
                 ],
                  ),
              ),
            ),

          Expanded(
            flex: 3,
            child: DashboardCard(),
          )
        ],
      ),
    ));
  }
}


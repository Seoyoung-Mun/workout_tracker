import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey.shade500,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.fitness_center,
                    size: Theme.of(context).textTheme.headlineSmall?.fontSize,
                    color: Theme.of(context).colorScheme.primary),
                SizedBox(width: 10),
                Text(
                  'Monthly',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
            Expanded(
              child: Center(
                  child: Text(
                '12회',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              )),
            )
          ],
        ));
  }
}

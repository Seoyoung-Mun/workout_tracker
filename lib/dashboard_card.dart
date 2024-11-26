import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  Icon icon;
  Text title;
  Expanded info;
  Color? backgraoundColor;
  Function()? customOnTap;
  String? imagePath;
  DashboardCard({
    required this.icon,
    required this.title,
    required this.info,
    this.backgraoundColor,
    this.imagePath,
    this.customOnTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: customOnTap,
      child: Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: backgraoundColor ??
                Theme.of(context).colorScheme.outlineVariant,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  icon,
                  SizedBox(width: 10),
                  title,
                ],
              ),
              Expanded(
                child: Row(
                  children: [
                    info,
                    imagePath != null
                        ? Image.asset('assets/${imagePath}')
                        : Container()
                  ],
                ),
              )
            ],
          )),
    );
  }
}

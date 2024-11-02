import 'package:didyouknow/didyouknow/ui/details/slides_fact.dart';
import 'package:didyouknow/theme/colors.dart';
import 'package:flutter/material.dart';

class FactDetailsScreen extends StatelessWidget {
  const FactDetailsScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Fact Details'),
        backgroundColor: Colors.transparent,
        foregroundColor: KnowunityColors.white,
        iconTheme: const IconThemeData(color: KnowunityColors.white),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              KnowunityColors.background.withOpacity(0.9),
              KnowunityColors.third.withOpacity(0.7),
            ],
          ),
        ),
        child: SlidesFact(),
      ),
    );
  }
}

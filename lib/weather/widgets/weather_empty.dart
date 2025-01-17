import 'package:flutter/material.dart';

class WeatherEmpty extends StatelessWidget {
  const WeatherEmpty({super.key});
  final SELECT_TEXT = 'Please Select a City!';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('🏙️', style: TextStyle(fontSize: 64)),
        Text(
          SELECT_TEXT,
          style: theme.textTheme.headlineSmall,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:onboarding_pdi/screens/dashboard.dart';

void main() {
  runApp(OnboardingPdi());
}

class OnboardingPdi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.green[900],
          accentColor: Colors.blueAccent[700],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.primary,
          )),
      home: Dashboard(),
    );
  }
}

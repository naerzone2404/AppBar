import 'package:flutter/material.dart';
import 'package:mi_aplicativo_movil/views/Challengers/my_appbar_challenge.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyAppbarChallenge()
    );
  }
}

import 'package:flutter/material.dart';

import 'src/features/todo/presentation/views/profile_view.dart';


void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileView(),
    );
  }
}

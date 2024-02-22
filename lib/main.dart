import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tcc_mobile/screen/initial_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Geolocator.requestPermission();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TCC Mobile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        useMaterial3: true,
      ),
      home: const InitialScreen(),
    );
  }
}

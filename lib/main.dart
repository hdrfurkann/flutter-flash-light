import 'package:flutter/material.dart';
import 'package:flash_light/screens/flashlight_app.dart';
import 'package:torch_controller/torch_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  TorchController().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlashLightApp(),
    );
  }
}

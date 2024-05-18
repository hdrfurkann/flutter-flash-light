import 'dart:async';
import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';

class BatteryScreen extends StatefulWidget {
  const BatteryScreen({super.key});

  @override
  State<BatteryScreen> createState() => _BatteryScreenState();
}

class _BatteryScreenState extends State<BatteryScreen> {
  var battery = Battery();
  int percentage = 0;
  late Timer timer;
  BatteryState batteryState = BatteryState.full;
  late StreamSubscription streamSubscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBatteryPercentage();
    getBatteryState();
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      getBatteryPercentage();
    });
  }

  void getBatteryPercentage() async {
    final level = await battery.batteryLevel;
    percentage = level;

    setState(() {});
  }

  void getBatteryState() async {
    streamSubscription = battery.onBatteryStateChanged.listen((state) {
      batteryState = state;

      setState(() {});
    });
  }

  Widget Buildbattery(BatteryState state) {
    switch (state) {
      case BatteryState.full:
        return Container(
          width: 200,
          height: 200,
          child: Icon(Icons.battery_full, size: 200, color: Colors.green),
        );

      case BatteryState.charging:
        return Container(
          width: 200,
          height: 200,
          child:
              Icon(Icons.battery_charging_full, size: 200, color: Colors.blue),
        );

      case BatteryState.discharging:
        return Container(
          width: 200,
          height: 200,
          child: Icon(Icons.battery_alert,
              size: 200, color: Colors.deepOrangeAccent),
        );

      default:
        return Container(
          width: 200,
          height: 200,
          child: Icon(Icons.battery_full, size: 200, color: Colors.green),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 40, 45, 68),
      appBar: AppBar(
        title: Text("Pil Durumu",
            style: TextStyle(fontFamily: 'SF-UI-Display-Regular')),
        centerTitle: true,
        foregroundColor: Color.fromARGB(255, 240, 240, 240),
        backgroundColor: Color(0xFF0F111D),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Buildbattery(batteryState),
            Text(
              'Batarya Yüzdesi : ${percentage}%',
              style: TextStyle(
                  fontFamily: 'SF-UI-Display-Regular',
                  fontSize: 25,
                  color: Colors.white),
            ),
            SizedBox(height: 260),
            //const AnunciosWidget(adScreen: AnunciosWidget.settingsScreen)
          ],
        ),
      ),
    );
  }
}

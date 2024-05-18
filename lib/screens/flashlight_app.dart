import 'package:battery_plus/battery_plus.dart';
import 'package:flash_light/screens/battery_screen.dart';
import 'package:flash_light/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:torch_controller/torch_controller.dart';

class FlashLightApp extends StatefulWidget {
  const FlashLightApp({Key? key}) : super(key: key);

  @override
  _FlashLightAppState createState() => _FlashLightAppState();
}

class _FlashLightAppState extends State<FlashLightApp>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _animatedcontroller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    getBatteryPercentage();
  }

  late AnimationController _animatedcontroller;
  Color color = Colors.white;
  double fontSize = 20;
  bool isClicked = true;
  final controller = TorchController();
  final DecorationTween decorationTween = DecorationTween(
    begin: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(
              color: Colors.white,
              spreadRadius: 1,
              blurRadius: 20,
              offset: Offset(0, 0))
        ],
        border: Border.all(color: Colors.orange)),
    end: BoxDecoration(
      color: Colors.white,
      shape: BoxShape.circle,
      border: Border.all(color: Colors.red),
      boxShadow: const [
        BoxShadow(
            color: Colors.blueAccent,
            spreadRadius: 30,
            blurRadius: 15,
            offset: Offset(0, 0)),
      ],
    ),
  );

  var battery = Battery();
  int percentage = 0;

  void getBatteryPercentage() async {
    final level = await battery.batteryLevel;
    percentage = level;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 40, 45, 68),
      appBar: AppBar(
        title: Text("El Feneri",
            style: TextStyle(fontFamily: 'SF-UI-Display-Regular')),
        centerTitle: true,
        foregroundColor: Color.fromARGB(255, 240, 240, 240),
        backgroundColor: Color(0xFF0F111D),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => BatteryScreen()),
              );
            },
            icon: Icon(
              Icons.battery_charging_full,
              color: Colors.blue,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Settings()),
              );
            },
            icon: Icon(
              Icons.settings_outlined,
              color: Colors.blue,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BatteryScreen()),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 100,
                        height: 45,
                        child: Text(
                          'Batarya ${percentage}%',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 17,
                            fontWeight: FontWeight.w200,
                            fontFamily: 'SF-UI-Display-Regular',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (isClicked) {
                _animatedcontroller.forward();
                fontSize = 20;
                color = Colors.blueAccent;
                HapticFeedback.lightImpact();
              } else {
                _animatedcontroller.reverse();
                fontSize = 20;
                color = Colors.white;
                HapticFeedback.lightImpact();
              }
              isClicked = !isClicked;
              controller.toggle();
              setState(() {});
            },
            child: Center(
              child: DecoratedBoxTransition(
                position: DecorationPosition.background,
                decoration: decorationTween.animate(_animatedcontroller),
                child: SizedBox(
                  width: 120,
                  height: 120,
                  child: Center(
                    child: Icon(
                      Icons.power_settings_new,
                      color: isClicked ? Colors.black : Colors.red,
                      size: 60,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.4,
            alignment: Alignment.bottomCenter,
            child: AnimatedDefaultTextStyle(
              curve: Curves.ease,
              child: Text(!isClicked ? 'El Feneri Açık' : 'El Feneri Kapalı',
                  style: TextStyle(fontFamily: 'SF-UI-Display-Regular')),
              style: TextStyle(
                  color: color,
                  fontSize: fontSize,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.bold),
              duration: const Duration(milliseconds: 1000),
            ),
          ),
        ],
      ),
    );
  }
}

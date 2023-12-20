import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:battery/battery.dart';

void main() {
  runApp(const MaterialApp(home: BatteryApp()));
}

class BatteryApp extends StatefulWidget {
  const BatteryApp({super.key});

  @override
  _BatteryAppState createState() => _BatteryAppState();
}

class _BatteryAppState extends State<BatteryApp> {
  String _batteryLevel = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      batteryLevel = await Battery.getBatteryLevel();
    } on PlatformException {
      batteryLevel = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, and we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: _getBatteryLevel,
              child: const Text('Get Battery Level'),
            ),
            Text(_batteryLevel),
          ],
        ),
      ),
    );
  }
}

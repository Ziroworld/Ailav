import 'dart:async';
import 'dart:io'; // Import dart:io for exit(0)
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proximity_sensor/proximity_sensor.dart';

class GlobalProximityListener extends StatefulWidget {
  final Widget child;

  const GlobalProximityListener({super.key, required this.child});

  @override
  _GlobalProximityListenerState createState() =>
      _GlobalProximityListenerState();
}

class _GlobalProximityListenerState extends State<GlobalProximityListener> {
  late StreamSubscription<dynamic> _proximitySubscription;

  @override
  void initState() {
    super.initState();
    _proximitySubscription = ProximitySensor.events.listen((event) {
      // Log the raw sensor event for debugging.
      print('Proximity sensor event: $event');

      // Check if the event indicates "near". It might be an int (1), a bool (true), or any num > 0.
      if ((event == 1) || (event is bool && event == true) || (event is num && event > 0)) {
        print('Proximity sensor triggered: Object is near');
        // For testing, forcefully exit the app:
        exit(0);
        // If you prefer the standard method, you could try:
        // SystemNavigator.pop();
      }
    });
  }

  @override
  void dispose() {
    _proximitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:geolocator/geolocator.dart';

class QiblaFinderPage extends StatefulWidget {
  @override
  _QiblaFinderPageState createState() => _QiblaFinderPageState();
}

class _QiblaFinderPageState extends State<QiblaFinderPage> {
  double _qiblaDirection = 0.0; // Angle vers la Mecque

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    const kaabaLat = 21.4225;
    const kaabaLng = 39.8262;

    final userLat = position.latitude;
    final userLng = position.longitude;

    final deltaLng = kaabaLng - userLng;
    final direction = math.atan2(
      math.sin(_degToRad(deltaLng)) * math.cos(_degToRad(kaabaLat)),
      math.cos(_degToRad(userLat)) * math.sin(_degToRad(kaabaLat)) -
          math.sin(_degToRad(userLat)) * math.cos(_degToRad(kaabaLat)) * math.cos(_degToRad(deltaLng)),
    );

    setState(() {
      _qiblaDirection = (_radToDeg(direction) + 360) % 360;
    });
  }

  double _degToRad(double degree) => degree * math.pi / 180;
  double _radToDeg(double radian) => radian * 180 / math.pi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Qibla Finder", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
      ),
      body: StreamBuilder<CompassEvent>(
        stream: FlutterCompass.events,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("Erreur de capteur de boussole"));
          }

          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          double? direction = snapshot.data!.heading;
          if (direction == null) return Center(child: Text("Impossible de détecter la direction"));

          double angle = ((_qiblaDirection - direction) * (math.pi / 180));

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/quibla.jpg',
                      height: 250,
                      width: 250,
                    ),
                    Transform.rotate(
                      angle: angle,
                      child: Image.asset(
                        'assets/quibla.jpg',
                        height: 80,
                        width: 80,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Text(
                  "Direction de la Qibla : ${_qiblaDirection.toStringAsFixed(2)}°",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

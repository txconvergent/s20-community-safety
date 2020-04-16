import 'package:flutter/material.dart';
import 'package:route/assets/style.dart';
import 'package:route/screens/floating_search_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GoogleMapController controller;
  String _mapStyle;
  
  final LatLng _center = const LatLng(30.290801, -97.741648);

  void _mapInit(GoogleMapController controller) async {
    await rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });
    this.controller = controller;
    controller.setMapStyle(_mapStyle);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: FloatingAppBar(), backgroundColor: appTheme().scaffoldBackgroundColor, 
      body: GoogleMap(onMapCreated: _mapInit, initialCameraPosition: CameraPosition(target: _center, zoom: 11.0))
    );
  }
} 
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:tcc_mobile/components/mapcomponent.dart';
import 'package:tcc_mobile/screen/explorer_screen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Localização da Empresa X"),
      ),
      body: const MapComponent(
        setInitialZoom: LatLng(-25.533446509573626, -50.65746983435539),
        points: [
          Marker(
            point: LatLng(-25.533446509573626, -50.65746983435539),
            child: Icon(
              Icons.place,
              color: Colors.blueAccent,
            ),
            width: 160,
            height: 160,
          ),
        ],
        zoom: 16.0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (e) => const ExplorerScreen(),
            ),
          );
        },
        child: const Icon(
          Icons.store,
          color: Colors.white,
        ),
      ),
    );
  }
}

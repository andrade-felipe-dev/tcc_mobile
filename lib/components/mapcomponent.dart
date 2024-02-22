import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class MapComponent extends StatefulWidget {
  final List<Marker> points;
  final double zoom;
  final LatLng? setInitialZoom;

  const MapComponent(
      {required this.points,
      required this.zoom,
      this.setInitialZoom,
      super.key});

  @override
  State<MapComponent> createState() => _MapComponentState();
}

class _MapComponentState extends State<MapComponent> {
  LocationPermission? _locationPermission;

  @override
  void initState() {
    _checkLocationPermission();
    super.initState();
  }

  Future<void> _checkLocationPermission() async {
    _locationPermission = await Geolocator.checkPermission();
    if (_locationPermission == LocationPermission.denied) {
      _locationPermission = await Geolocator.requestPermission();
    }
    if (_locationPermission == LocationPermission.whileInUse ||
        _locationPermission == LocationPermission.always) {
      _locateUser();
      setState(() {});
    }
  }

  Future<LatLng> _locateUser() async {
    try {
      final Position position = await Geolocator.getCurrentPosition();
      return LatLng(position.latitude, position.longitude);
    } catch (e) {
      return const LatLng(-25.471088682689228, -50.644714168311445);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LatLng>(
      future: _locateUser(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return FlutterMap(
            options: MapOptions(
              initialCenter: widget.setInitialZoom ?? snapshot.data!,
              initialZoom: widget.zoom,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              ),
              MarkerLayer(
                markers: widget.points.map((e) => e).toList(),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          // Handle error (e.g., show message, use default location)
          return const Center(child: Text('Error getting location'));
        } else {
          // Show loading indicator while location is being fetched
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

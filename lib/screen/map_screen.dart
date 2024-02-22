import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:tcc_mobile/components/mapcomponent.dart';
import 'package:tcc_mobile/screen/explorer_screen.dart';
import 'package:tcc_mobile/screen/company/show_screen.dart';
import 'package:tcc_mobile/screen/signin_screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mapa"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (e) => const SignInScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.login)),
        ],
      ),
      body: MapComponent(
        points: [
          Marker(
            point: const LatLng(-25.521974037450992, -50.621259866338605),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Empresa X"),
                    content: const Text("Descrição da empresa"),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Fechar"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (e) => const ShowScreen(),
                                ),
                              );
                            },
                            child: const Text("Visualizar"),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
              child: const Icon(
                Icons.place,
                color: Colors.blueAccent,
              ),
            ),
            width: 160,
            height: 160,
          ),
          Marker(
            point: const LatLng(-25.468983998617905, -50.65050831572277),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Empresa X"),
                    content: const Text("Descrição da empresa"),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Fechar"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (e) => const ShowScreen(),
                                ),
                              );
                            },
                            child: const Text("Visualizar"),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
              child: const Icon(
                Icons.place,
                color: Colors.blueAccent,
              ),
            ),
            width: 160,
            height: 160,
          ),
          Marker(
            point: const LatLng(-25.47347432865482, -50.65540450544041),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Empresa X"),
                    content: const Text("Descrição da empresa"),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Fechar"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (e) => const ShowScreen(),
                                ),
                              );
                            },
                            child: const Text("Visualizar"),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
              child: const Icon(
                Icons.place,
                color: Colors.blueAccent,
              ),
            ),
            width: 160,
            height: 160,
          ),
          Marker(
            point: const LatLng(-25.49205617036813, -50.63552242883128),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Empresa X"),
                    content: const Text("Descrição da empresa"),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Fechar"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (e) => const ShowScreen(),
                                ),
                              );
                            },
                            child: const Text("Visualizar"),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
              child: const Icon(
                Icons.place,
                color: Colors.blueAccent,
              ),
            ),
            width: 160,
            height: 160,
          ),
        ],
        zoom: 13.0,
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

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tcc_mobile/components/customimage.dart';
import 'package:tcc_mobile/screen/company/location_screen.dart';

class ShowScreen extends StatefulWidget {
  const ShowScreen({super.key});

  @override
  State<ShowScreen> createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes da empresa."),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomImage(
              imageBase64: "",
              width: 200.0,
              height: 200.0,
            ),

            // Endereço
            _buildEndereco(),
            // Telefone
            _buildTelefone(),
            // Redes sociais
            _buildRedesSociais(),

            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: const BoxDecoration(color: Colors.black),
                        child: Text(
                          'text $i',
                          style: const TextStyle(fontSize: 16.0),
                        ));
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (e) => const LocationScreen(),
            ),
          );
        },
        child: const Icon(
          Icons.map,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildEndereco() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Endereço:'),
        Text("Rua Pedro Stadler - número 93 - Centro"),
      ],
    );
  }

  Widget _buildTelefone() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.phone),
          Text('(42) 99950-0305'),
        ],
      ),
    );
  }

  Widget _buildRedesSociais() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildIconeRedeSocial(
            icone: Logo(Logos.facebook_f),
            url: "https://www.facebook.com/?locale=pt_BR",
          ),
          _buildIconeRedeSocial(
            icone: Logo(Logos.instagram),
            url: "https://www.instagram.com/",
          ),
        ],
      ),
    );
  }

  Widget _buildIconeRedeSocial({required Logo icone, required String url}) {
    return GestureDetector(
      onTap: () => _abrirUrl(url),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: icone,
      ),
    );
  }

  void _abrirUrl(String url) {}
}

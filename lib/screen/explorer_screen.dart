import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tcc_mobile/components/customimage.dart';
import 'package:tcc_mobile/screen/company/show_screen.dart';

class ExplorerScreen extends StatefulWidget {
  const ExplorerScreen({super.key});

  @override
  State<ExplorerScreen> createState() => _ExplorerScreenState();
}

class _ExplorerScreenState extends State<ExplorerScreen> {
  List<dynamic> _clinics = [];
  String _searchText = "";
  bool _isSearchBarVisible = false;

  @override
  void initState() {
    _loadClinics();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Empresas Cadastradas"),
        actions: [
          IconButton(
            onPressed: () => _showSearchBar(),
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isSearchBarVisible) {
      return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildSearchBar(),
          ),
          _buildList()
        ],
      );
    } else {
      return _buildList();
    }
  }

  Widget _buildList() {
    return Expanded(
      child: FutureBuilder(
        future: _loadClinics(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: _clinics.length,
              itemBuilder: (context, index) {
                if (_searchText.isNotEmpty &&
                    !_clinics[index]["name"]
                        .toLowerCase()
                        .contains(_searchText.toLowerCase())) {
                  return const SizedBox.shrink();
                }

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (e) => const ShowScreen(),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 0,
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(_clinics[index]["name"],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              Text(_clinics[index]["address"]),
                              Text(_clinics[index]["phone"]),
                            ],
                          ),
                          CustomImage(
                            imageBase64: _clinics[index]["image"],
                            width: 10.0,
                            height: 10.0,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<String> _loadClinics() async {
    String jsonData = await DefaultAssetBundle.of(context)
        .loadString("assets/json/clinics.json");
    _clinics = json.decode(jsonData);

    return jsonData;
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Pesquisar",
          prefixIcon: Icon(Icons.search),
        ),
        onChanged: _onSearchTextChanged,
      ),
    );
  }

  void _onSearchTextChanged(String text) {
    setState(() {
      _searchText = text;
    });
  }

  void _showSearchBar() {
    setState(() {
      _isSearchBarVisible = !_isSearchBarVisible;
    });
  }
}

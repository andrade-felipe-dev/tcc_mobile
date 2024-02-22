import 'package:flutter/material.dart';
import 'package:tcc_mobile/screen/explorer_screen.dart';
import 'package:tcc_mobile/screen/register/aboutme_screen.dart';

class TypeUserScreen extends StatefulWidget {
  const TypeUserScreen({super.key});

  @override
  State<TypeUserScreen> createState() => _TypeUserScreenState();
}

class _TypeUserScreenState extends State<TypeUserScreen> {
  final List<Map<String, String>> _items = [
    {"key": "voluntary", "value": "Voluntário"},
    {"key": "company", "value": 'Empresa'},
  ];

  late String _selectedValue = "voluntary";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Empresas Cadastradas"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 300.0,
                width: 300.0,
              ),
              const SizedBox(
                height: 40.0,
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black12,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                items: _items
                    .map(
                      (item) => DropdownMenuItem<String>(
                        value: item['key'],
                        child: Text(item['value']!),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value!;
                  });
                },
              ),
              const SizedBox(
                height: 12.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (e) => _selectedValue == "voluntary"
                          ? const ExplorerScreen()
                          : const AboutMe(),
                    ),
                  );
                },
                child: _selectedValue == "voluntary"
                    ? const Text(
                        "Salvar",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    : const Text(
                        "Avançar",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

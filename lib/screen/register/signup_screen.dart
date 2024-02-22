import 'package:flutter/material.dart';
import 'package:tcc_mobile/components/passwordfield.dart';
import 'package:tcc_mobile/screen/register/typeuser_screen.dart';
import 'package:tcc_mobile/screen/signin_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formSignInKey = GlobalKey<FormState>();
  bool rememberPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          key: _formSignInKey,
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
                height: 20.0,
              ),
              TextFormField(
                validator: (value) => _isEmpty(value),
                decoration: InputDecoration(
                    label: const Text('E-mail'),
                    hintText: 'Digite seu e-mail',
                    hintStyle: const TextStyle(
                      color: Colors.black26,
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black12,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black12),
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              const SizedBox(
                height: 15.0,
              ),
              PasswordField(
                labelText: 'Senha',
                controller: TextEditingController(),
              ),
              const SizedBox(
                height: 12.0,
              ),
              PasswordField(
                labelText: 'Confirmar senha',
                controller: TextEditingController(),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (e) => const SignInScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (e) => const TypeUserScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent),
                    child: const Text(
                      'Avançar',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  String? _isEmpty(value) {
    if (value == null || value.isEmpty) {
      return 'Digite seu e-mail';
    }
    return null;
  }
}

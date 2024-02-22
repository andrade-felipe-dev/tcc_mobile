import 'package:flutter/material.dart';
import 'package:tcc_mobile/screen/map_screen.dart';
import 'package:tcc_mobile/screen/signin_screen.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              "assets/images/logo.png",
              height: 300.0,
              width: 300.0,
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "A Central de apoio e integração de projetos e ações coletivas é uma iniciativa de extensão de docentes, discentes, funcionários públicos da educação municipal, estadual e federal (Irati, UNICENTRO e IFPR). Realiza a articulação entre ensino, pesquisa e extensão de suas instituições para a integração, o fortalecimento e a divulgação de coletivos promovam, fortaleçam e integrem projetos e ações empenhados na garantia dos direitos humanos e melhorias nas condições de vida da população de Irati e região.",
              ),
            ),
            const SizedBox(
              height: 80.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (e) => const MapScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Visitar',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (e) => const SignInScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Fazer login',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

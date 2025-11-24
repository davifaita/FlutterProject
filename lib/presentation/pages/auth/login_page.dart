import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  Future<void> _login() async {
    final prefs = await SharedPreferences.getInstance();

    final savedEmail = prefs.getString('user_email');
    final savedPassword = prefs.getString('user_password');

    if (savedEmail == null || savedPassword == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Nenhum usuário cadastrado!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (emailController.text == savedEmail &&
        senhaController.text == savedPassword) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('E-mail ou senha incorretos!'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Store - Login"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Bem-vindo(a)!",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 30),

            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "E-mail",
                prefixIcon: Icon(Icons.mail),
              ),
            ),
            const SizedBox(height: 10),

            TextField(
              controller: senhaController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Senha",
                prefixIcon: Icon(Icons.lock),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _login,
                child: const Text("Entrar"),
              ),
            ),

            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, SignUpPage.routeName);
              },
              child: const Text("Criar Conta"),
            ),
          ],
        ),
      ),
    );
  }
}

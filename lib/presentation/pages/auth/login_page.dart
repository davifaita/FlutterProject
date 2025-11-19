import 'package:flutter/material.dart';
import '../../../shared/utils/form_validators.dart';
import '../home/home_page.dart';
import 'signup_page.dart';

// Tela de Login
class LoginPage extends StatefulWidget {
  static const routeName = '/'; // Rota inicial

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _submit() {
    // Validação visual: mostrar mensagem se campos estiverem vazios
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Simula o login bem-sucedido
    // A validação de e-mail/senha é simples para fins de requisito.
    Navigator.of(context).pushReplacementNamed(HomePage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Store - Login'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Text(
                  'Bem-vindo(a)!',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),

                // Campo E-mail
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    prefixIcon: Icon(Icons.email),
                  ),
                  // Validação simples (apenas se não está vazio)
                  validator: (value) => FormValidators.requiredField(value, 'E-mail'),
                ),
                const SizedBox(height: 15),

                // Campo Senha
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    prefixIcon: Icon(Icons.lock),
                  ),
                  // Validação simples (apenas se não está vazio)
                  validator: (value) => FormValidators.requiredField(value, 'Senha'),
                ),
                const SizedBox(height: 30),

                // Botão "Entrar" redireciona à Tela Home
                ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Entrar',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),

                // Link para "Criar Conta"
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(SignUpPage.routeName);
                  },
                  child: const Text(
                    'Criar Conta',
                    style: TextStyle(color: Colors.blueAccent, fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
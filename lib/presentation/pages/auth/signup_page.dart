import 'package:ecommerce/shared/utils/form_validators.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';


class SignUpPage extends StatefulWidget {
  static const routeName = '/signup';

  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final confirmarSenhaController = TextEditingController();

  Future<void> _register() async {
    // 1️⃣ Valida o formulário antes de tudo
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // 2️⃣ Senhas diferentes (também validado no validator)
    if (senhaController.text != confirmarSenhaController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("As senhas não coincidem!"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // 3️⃣ Salva os dados
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_name', nomeController.text);
    await prefs.setString('user_email', emailController.text);
    await prefs.setString('user_password', senhaController.text);

    // 4️⃣ Fecha página
    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Cadastro realizado, faça login!"),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Criar Conta"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text(
                "Cadastro",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: nomeController,
                decoration: const InputDecoration(labelText: "Nome"),
                validator: (v) => FormValidators.requiredField(v, "Nome"),
              ),
              const SizedBox(height: 10),

              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "E-mail"),
                validator: FormValidators.validateEmail,
              ),
              const SizedBox(height: 10),

              TextFormField(
                controller: senhaController,
                obscureText: true,
                decoration: const InputDecoration(labelText: "Senha"),
                validator: FormValidators.validatePassword,
              ),
              const SizedBox(height: 10),

              TextFormField(
                controller: confirmarSenhaController,
                obscureText: true,
                decoration:
                    const InputDecoration(labelText: "Confirmar Senha"),
                validator: (v) => FormValidators.confirmPassword(
                  v,
                  senhaController.text,
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _register,
                  child: const Text("Cadastrar"),
                ),
              ),

              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, LoginPage.routeName);
                },
                child: const Text("Já tenho conta"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

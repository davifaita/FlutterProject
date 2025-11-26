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

  bool isLoading = false;

  Future<void> _register() async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('user_email');

    // ✔ Validação de e-mail único
    final uniqueEmailError =
        FormValidators.uniqueEmail(emailController.text, savedEmail);

    if (uniqueEmailError != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(uniqueEmailError),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    await prefs.setString('user_name', nomeController.text);
    await prefs.setString('user_email', emailController.text);
    await prefs.setString('user_password', senhaController.text);

    await Future.delayed(const Duration(seconds: 1));

    setState(() => isLoading = false);

    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Cadastro realizado! Faça login."),
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

              // 🔥 Campo de E-MAIL atualizado com regra extra de e-mail único
              FutureBuilder(
                future: SharedPreferences.getInstance(),
                builder: (context, snapshot) {
                  String? savedEmail;

                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.data != null) {
                    savedEmail = snapshot.data!.getString('user_email');
                  }

                  return TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: "E-mail"),
                    validator: (v) {
                      final emailError = FormValidators.validateEmail(v);
                      if (emailError != null) return emailError;

                      return FormValidators.uniqueEmail(v, savedEmail);
                    },
                  );
                },
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
                decoration: const InputDecoration(labelText: "Confirmar Senha"),
                validator: (v) =>
                    FormValidators.confirmPassword(v, senhaController.text),
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isLoading ? null : _register,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: isLoading
                      ? const SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text("Cadastrar"),
                ),
              ),

              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, LoginPage.routeName);
                },
                child: const Text("Já tenho conta"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

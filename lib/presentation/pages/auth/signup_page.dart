import 'package:flutter/material.dart';
import '../../../shared/utils/form_validators.dart';

// Tela de Cadastro de Usuário
class SignUpPage extends StatefulWidget {
  static const routeName = '/signup';

  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _submit() {
    // 1. Validar os campos
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // 2. Validação adicional: senhas devem ser iguais
    if (_passwordController.text != _confirmPasswordController.text) {
      // Exibe um SnackBar para mostrar a mensagem de erro
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Erro: As senhas não coincidem!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // 3. Simula o cadastro bem-sucedido
    // Redirecionar de volta ao login com mensagem visual
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Cadastro realizado com sucesso! Faça login para continuar.'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Conta'),
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
                  'Bem-vindo à Flutter Store',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),

                // Campo Nome
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) => FormValidators.requiredField(value, 'Nome'),
                ),
                const SizedBox(height: 15),

                // Campo E-mail
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: FormValidators.validateEmail,
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
                  validator: (value) => FormValidators.requiredField(value, 'Senha'),
                ),
                const SizedBox(height: 15),

                // Campo Confirmar Senha
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Confirmar Senha',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    prefixIcon: Icon(Icons.lock_reset),
                  ),
                  validator: (value) => FormValidators.requiredField(value, 'Confirmação de Senha'),
                ),
                const SizedBox(height: 30),

                // Botão de Cadastro
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
                    'Cadastrar',
                    style: TextStyle(fontSize: 18, color: Colors.white),
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
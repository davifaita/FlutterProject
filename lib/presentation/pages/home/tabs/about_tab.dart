import 'package:flutter/material.dart';

// Tela de Informações sobre o App (Layout Livre)
class AboutTab extends StatelessWidget {
  const AboutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Título principal
          const Text(
            'Sobre a Flutter Store',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          const Divider(height: 30, thickness: 2),

          // Seção 1: Missão
          const Row(
            children: [
              Icon(Icons.rocket_launch, size: 40, color: Colors.orange),
              SizedBox(width: 15),
              Text(
                'Nossa Missão',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'A Flutter Store é uma aplicação de demonstração desenvolvida para a disciplina de Sistemas Móveis, focada em explorar o potencial do framework Flutter e da linguagem Dart. Nosso objetivo é simular uma experiência de e-commerce simples, porém funcional, utilizando os principais widgets e conceitos de navegação e gerenciamento de estado local.',
            style: TextStyle(fontSize: 16, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 40),

          // Seção 2: Desenvolvedor
          const Row(
            children: [
              Icon(Icons.code, size: 40, color: Colors.purple),
              SizedBox(width: 15),
              Text(
                'Time de Desenvolvimento',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Este projeto foi desenvolvido pelos estudantes Davi, Samoel e Gabriel para a disciplina de Sistemas Móveis, demonstrando a capacidade de estruturar o código de forma modular (utilizando Providers, Models e Pages) e implementar funcionalidades de UI/UX, como validação de formulários, navegação e um sistema de favoritos dinâmico.',
            style: TextStyle(fontSize: 16, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 40),

          // Informação de Contato
          Center(
            child: Column(
              children: [
                const Text('Versão 1.0.0 - 2024',
                    style: TextStyle(color: Colors.grey, fontSize: 14)),
                const SizedBox(height: 5),
                TextButton.icon(
                  onPressed: () {},
                  icon:
                      const Icon(Icons.info_outline, color: Colors.blueAccent),
                  label: const Text('Visite o nosso código-fonte (simulado)',
                      style: TextStyle(color: Colors.blueAccent)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

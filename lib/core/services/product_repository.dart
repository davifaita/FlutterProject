import '../models/product.dart';

// Classe que simula o acesso aos dados dos produtos (mock data).
class ProductRepository {
  // Lista simulada de produtos usando caminhos de assets locais.
  // Certifique-se de que estes arquivos existam em 'assets/images/' na raiz do projeto.
  static final List<Product> _mockProducts = [
    Product(
      id: 'p1',
      name: 'Smartwatch Esportivo X9',
      description: 'Design moderno, monitoramento de saúde 24h e bateria de longa duração. Ideal para quem pratica esportes.',
      price: 199.90,
      imageUrl: 'assets/images/smartwatch.png', // Caminho do Asset Local
    ),
    Product(
      id: 'p2',
      name: 'Fone Bluetooth Intra-auricular',
      description: 'Áudio de alta fidelidade e cancelamento de ruído passivo. Conexão estável e ergonômica.',
      price: 79.90,
      imageUrl: 'assets/images/fone.png', // Caminho do Asset Local
    ),
    Product(
      id: 'p3',
      name: 'Power Bank 10000mAh Slim',
      description: 'Carregador portátil fino e potente. Duas saídas USB para carregamento rápido e simultâneo.',
      price: 129.50,
      imageUrl: 'assets/images/powerbank.png', // Caminho do Asset Local
    ),
    Product(
      id: 'p4',
      name: 'Mouse Óptico Ergonômico',
      description: 'Conforto para longas horas de uso. Resolução ajustável e conexão wireless de 2.4GHz.',
      price: 45.00,
      imageUrl: 'assets/images/mouse.png', // Caminho do Asset Local
    ),
    Product(
      id: 'p5',
      name: 'Teclado Mecânico RGB',
      description: 'Switches táteis e iluminação RGB customizável. Durabilidade e alta performance para gamers.',
      price: 349.99,
      imageUrl: 'assets/images/teclado.png', // Caminho do Asset Local
    ),
  ];

  // Método que retorna a lista completa de produtos
  Future<List<Product>> loadProducts() async {
    // Simula um atraso de rede
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockProducts;
  }
}
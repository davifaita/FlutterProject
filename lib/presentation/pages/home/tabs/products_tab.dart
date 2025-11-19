import 'package:flutter/material.dart';
import '../../../../core/models/product.dart';
import '../../../../core/services/product_repository.dart';
import '../../../../shared/components/product_card.dart';

// Tab principal que lista todos os produtos. É a página default após o login.
class ProductsTab extends StatefulWidget {
  const ProductsTab({super.key});

  @override
  State<ProductsTab> createState() => _ProductsTabState();
}

class _ProductsTabState extends State<ProductsTab> {
  late Future<List<Product>> _productsFuture;
  final _repository = ProductRepository();

  @override
  void initState() {
    super.initState();
    _productsFuture = _repository.loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    // FutureBuilder lida com o estado de carregamento dos dados mock.
    return FutureBuilder<List<Product>>(
      future: _productsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erro ao carregar produtos: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('Nenhum produto encontrado.'));
        }

        final products = snapshot.data!;
        
        // ListView.builder para construir a lista de cards de produtos
        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductCard(product: products[index]);
          },
        );
      },
    );
  }
}
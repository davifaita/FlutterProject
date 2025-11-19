import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/models/product.dart';
import '../../core/providers/favorites_provider.dart';
import '../../presentation/pages/product_detail/product_detail_page.dart';

// Widget reutilizável para exibir um produto na lista.
class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // Usa Consumer para reagir apenas às mudanças no FavoritesProvider
    return Consumer<FavoritesProvider>(
      builder: (context, favoritesProvider, child) {
        final isFav = favoritesProvider.isFavorite(product);
        
        return Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            // Abre a tela de detalhes ao clicar no card
            onTap: () {
              Navigator.of(context).pushNamed(
                ProductDetailPage.routeName,
                arguments: product,
              );
            },
            
            // Imagem do produto
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                product.imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => 
                  const Icon(Icons.error, color: Colors.red),
              ),
            ),
            
            // Nome e Preço
            title: Text(
              product.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'R\$ ${product.price.toStringAsFixed(2)}',
              style: const TextStyle(color: Colors.green, fontSize: 16),
            ),
            
            // Botão/Ícone de Favoritar
            trailing: IconButton(
              icon: Icon(
                isFav ? Icons.favorite : Icons.favorite_border,
                color: isFav ? Colors.red : Colors.grey,
                size: 28,
              ),
              onPressed: () {
                favoritesProvider.toggleFavorite(product);
              },
            ),
          ),
        );
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.cartItems.values.toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Cart")),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            leading: Image.network(cartItems[index].image, width: 50),
            title: Text(cartItems[index].title),
            subtitle: Text("\$${cartItems[index].price}"),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => cartProvider.removeFromCart(cartItems[index].id),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Text("Total: \$${cartProvider.totalPrice}"),
      ),
    );
  }
}

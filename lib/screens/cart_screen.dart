import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(      backgroundColor: Colors.white,
      appBar: AppBar(      backgroundColor: Colors.white,title: const Text("Your Cart")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                final item = cartProvider.cartItems[index];
                return ListTile(
                  leading: Image.network(item.product.image, width: 50),
                  title: Text(item.product.title),
                  subtitle: Text("Qty: ${item.quantity}"),
                  trailing: Text("\$${item.product.price * item.quantity}"),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text("Total: \$${cartProvider.totalPrice.toStringAsFixed(2)}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Order placed (dummy)")));
                  },
                  child: const Text("Buy Now"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

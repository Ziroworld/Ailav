import 'package:ailav/features/cart/domain/entity/cart_item_entity.dart';
import 'package:ailav/features/cart/presentation/view_model/cart_bloc.dart';
import 'package:ailav/features/order/presentation/view/order_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CartScreenView extends StatelessWidget {
  const CartScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulated local data (for reference, not used in the Bloc state)
    final List<Map<String, dynamic>> cartItems = [
      {
        'image': 'assets/images/smirnoff.png',
        'name': 'Smirnoff Lemon Vodka',
        'description': 'A refreshing lemon-flavored vodka.',
        'price': 2.98,
        'quantity': 1,
      },
      {
        'image': 'assets/images/smirnoff.png',
        'name': 'Jack Daniel’s Cola Whiskey',
        'description': 'Smooth cola-infused whiskey blend.',
        'price': 3.98,
        'quantity': 1,
      },
      {
        'image': 'assets/images/smirnoff.png',
        'name': 'Calsberg Premium Beer',
        'description': 'Crisp, premium quality beer.',
        'price': 3.50,
        'quantity': 1,
      }
    ];

    // Dynamically calculate total price
    double calculateTotalPrice(List<CartItemEntity> items) {
      return items.fold(
          0.0, (total, item) => total + item.price * item.quantity);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.error != null) {
            return Center(child: Text("Error: ${state.error}"));
          }
          if (state.items.isEmpty) {
            return const Center(child: Text("Your cart is empty"));
          }

          double totalPrice = calculateTotalPrice(state.items);
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    final item = state.items[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Image.network(
                              item.productImage,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.productName,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    item.productDescription,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade600,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      // Remove one unit if quantity > 1, else remove completely
                                      IconButton(
                                        icon: const Icon(Icons.remove),
                                        onPressed: () {
                                          if (item.quantity > 1) {
                                            context.read<CartBloc>().add(
                                              RemoveProductFromCartEvent(
                                                productId: item.productId,
                                                userId: "rohan",
                                                productName: item.productName,
                                                productPrice: item.price,
                                                productQuantity: 1,
                                              ),
                                            );
                                          } else {
                                            context.read<CartBloc>().add(
                                              RemoveProductFromCartEvent(
                                                productId: item.productId,
                                                userId: "rohan",
                                                productName: item.productName,
                                                productPrice: item.price,
                                                productQuantity: item.quantity,
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                      Text(
                                        item.quantity.toString(),
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      // Increment quantity by 1
                                      IconButton(
                                        icon: const Icon(Icons.add),
                                        onPressed: () {
                                          context.read<CartBloc>().add(
                                            AddProductToCartEvent(
                                              productId: item.productId,
                                              userId: "rohan",
                                              productName: item.productName,
                                              productPrice: item.price,
                                              productQuantity: item.quantity + 1,
                                            ),
                                          );
                                        },
                                      ),
                                      const Spacer(),
                                      Text(
                                        '\$${item.price.toStringAsFixed(2)}',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      // Delete button to remove the item completely from the cart
                                      IconButton(
                                        icon: const Icon(Icons.delete),
                                        onPressed: () {
                                          context.read<CartBloc>().add(
                                            RemoveProductFromCartEvent(
                                              productId: item.productId,
                                              userId: "rohan",
                                              productName: item.productName,
                                              productPrice: item.price,
                                              productQuantity: item.quantity,
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Total Price and Proceed to Order Section
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\$${totalPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to Order Screen with cart data
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderScreenView(
                              cartItems: state.items,
                              totalPrice: totalPrice,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text(
                        'Proceed to Order',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

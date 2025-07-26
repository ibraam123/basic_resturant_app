import 'package:basic_resturant_app/controllers/items_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../models/food_item_model.dart';

class CartPage extends StatefulWidget {
  static const String routeName = '/cart';

  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final ItemsController itemsController = Get.find<ItemsController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "Your Cart",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (itemsController.cartItems.isEmpty) {
                return const Center(child: Text("Your cart is empty"));
              }

              return ListView.builder(
                itemCount: itemsController.cartItems.length,
                itemBuilder: (context, index) {
                  final cartItem = itemsController.cartItems[index];
                  return ListTile(
                    leading: cartItem.image != null
                        ? Image.asset(cartItem.image!, width: 50.w)
                        : const Icon(Icons.fastfood),
                    title: Text(cartItem.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('\$${cartItem.price.toStringAsFixed(2)}'),
                        SizedBox(height: 4.h),
                        Text(
                          'Quantity: ${cartItem.quantity}',
                          style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Decrease quantity button
                        IconButton(
                          icon: Icon(Icons.remove, color: Colors.orange),
                          onPressed: () {
                            if (cartItem.quantity > 1) {
                              itemsController.decreaseQuantity(cartItem);
                              setState(() {});
                            } else {
                              _showDeleteDialog(cartItem, itemsController);
                            }
                          },
                        ),
                        // Quantity display
                        Text(
                          '${cartItem.quantity}',
                          style: TextStyle(fontSize: 16.sp),
                        ),
                        // Increase quantity button
                        IconButton(
                          icon: Icon(Icons.add, color: Colors.orange),
                          onPressed: () {
                            itemsController.increaseQuantity(cartItem);
                            setState(() {});
                          },
                        ),
                        // Delete button
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            _showDeleteDialog(cartItem, itemsController);
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
          ),

          // 💰 Total Price + Checkout
          Obx(
            () => Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    offset: const Offset(0, -1),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total:",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$${itemsController.totalPrice.value.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (itemsController.cartItems.isNotEmpty) {
                          Get.snackbar("Order", "Checked out successfully!");
                          itemsController.clearCart();
                        } else {
                          Get.snackbar("Error", "Your cart is empty");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                      ),
                      child: Text(
                        "Check Out",
                        style: TextStyle(fontSize: 16.sp, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
void _showDeleteDialog(FoodItem item, ItemsController controller) {
  Get.dialog(
    AlertDialog(
      title: Text("Remove Item"),
      content: Text("Are you sure you want to remove this item completely?"),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            Get.back();
            controller.removeFromCart(item);
            Get.snackbar(
              "Removed",
              "${item.name} removed from cart",
              snackPosition: SnackPosition.BOTTOM,
            );
          },
          child: Text(
            "Remove",
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ),
  );
}
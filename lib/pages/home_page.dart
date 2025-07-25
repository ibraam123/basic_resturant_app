import 'package:basic_resturant_app/widgets/custom_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/items_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String routeName = '/home';

  @override
  @override
  Widget build(BuildContext context) {
    final ItemsController itemsController = Get.find<ItemsController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/cart');
            },
            icon: const Icon(Icons.shopping_cart , color: Colors.black),
          )
        ],
        backgroundColor: Colors.orange,
        title: Text(
          "Menu Items",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        final items = itemsController.foodItems;

        if (items.isEmpty) {
          return const Center(
            child: Text(
              'No items available',
              style: TextStyle(fontSize: 18),
            ),
          );
        }

        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return FoodItemCard(
              item: item,
            );
          },
        );
      }),
    );
  }
}

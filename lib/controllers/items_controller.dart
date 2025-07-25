import 'package:basic_resturant_app/models/food_item_model.dart';
import 'package:get/get.dart';

class ItemsController extends GetxController {
  final RxList<FoodItem> foodItems = <FoodItem>[
    FoodItem(name: 'Pizza', price: 10.99, image: 'assets/piizza2.jpg'),
    FoodItem(name: 'Burger', price: 8.99, image: 'assets/burger.jpg'),
    FoodItem(name: 'Salad', price: 6.99, image: 'assets/salad.jpg'),
    FoodItem(name: 'Pasta', price: 9.99, image: 'assets/pasta.jpg'),
    FoodItem(name: 'Sushi', price: 12.99, image: 'assets/sushi.jpg'),
    FoodItem(name: 'Tacos', price: 7.99, image: 'assets/tacos.jpg'),
    FoodItem(name: 'Steak', price: 15.99, image: 'assets/steak.jpg'),
    FoodItem(name: 'Ice Cream', price: 5.99, image: 'assets/icecream.jpg'),
    FoodItem(name: 'Soup', price: 4.99, image: 'assets/soup.jpg'),
  ].obs;

  final RxList<FoodItem> cartItems = <FoodItem>[].obs;
  final RxDouble totalPrice = 0.0.obs;

  void addToCart(FoodItem item) {
    final existingItem = cartItems.firstWhereOrNull(
          (i) => i.name == item.name,
    );
    if (existingItem != null) {
      existingItem.quantity++; // Increase quantity
    } else {
      cartItems.add(item); // Add new item
    }
    updateTotalPrice();
  }

  void removeFromCart(FoodItem item) {
    if (item.quantity > 1) {
      item.quantity--; // Decrease quantity
    } else {
      cartItems.remove(item); // Remove if quantity is 1
    }
    updateTotalPrice();
  }

  void updateTotalPrice() {
    totalPrice.value = cartItems.fold(
      0.0,
          (sum, item) => sum + (item.price * item.quantity),
    );
  }
  void increaseQuantity(FoodItem item) {
    item.quantity++;
    updateTotalPrice();
  }

  void decreaseQuantity(FoodItem item) {
    if (item.quantity > 1) {
      item.quantity--;
      updateTotalPrice();
    }
  }



  void clearCart() {
    cartItems.clear();
    totalPrice.value = 0.0;
  }
}

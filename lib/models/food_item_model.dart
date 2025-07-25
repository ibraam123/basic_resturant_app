class FoodItem {
  final String name;
  final double price;
  final String? image;
  int quantity; // Add this line

  FoodItem({
    required this.name,
    required this.price,
    this.image,
    this.quantity = 1, // Default to 1
  });
}
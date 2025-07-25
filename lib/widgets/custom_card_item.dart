import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/items_controller.dart';
import '../models/food_item_model.dart';

class FoodItemCard extends StatelessWidget {
  final FoodItem item;

  const FoodItemCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.r,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: InkWell(
        borderRadius: BorderRadius.circular(15.r),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // Image section
              Container(
                width: 80.w,
                height: 80.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.grey.shade200,
                  image: item.image != null
                      ? DecorationImage(
                    image: AssetImage(item.image!),
                    fit: BoxFit.cover,
                  )
                      : null,
                ),
                child: item.image == null
                    ? Icon(Icons.fastfood, size: 40.sp, color: Colors.grey)
                    : null,
              ),

              const SizedBox(width: 16),

              // Info section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      '\$${item.price.toString()}',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.green.shade700,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  Get.find<ItemsController>().addToCart(item);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                ),
                child: Text(
                  'Add to Cart',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

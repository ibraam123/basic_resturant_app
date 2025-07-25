import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final Size size;
  final String name;

  const Header({super.key, required this.size, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.height * 0.33,
      decoration: const BoxDecoration(color: Colors.orange),
      child: Stack(
        children: [
          Positioned(
            bottom: 20,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name ,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

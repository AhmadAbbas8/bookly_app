import 'package:flutter/material.dart';

class CustomAppBarBookDetails extends StatelessWidget {
  const CustomAppBarBookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => print('object'),
          icon: Icon(Icons.close),
          color: Colors.white,
        ),
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () => print('object'),
          icon: Icon(Icons.shopping_cart_outlined),
          color: Colors.white,
        ),
      ],
    );
  }
}

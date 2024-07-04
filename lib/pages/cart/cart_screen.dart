import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/pages/cart/cart_widget.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widget/text_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
          color: color,
          text: "Cart (2)",
          textSize: 18,
          isTitle: true,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              IconlyLight.delete,
              color: color,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          _checkOut(context),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const CartWidget();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _checkOut(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Material(
              borderRadius: BorderRadius.circular(16),
              color: Colors.green,
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(16),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextWidget(
                      color: Colors.white, text: "Order Now", textSize: 20),
                ),
              ),
            ),
            const Spacer(),
            FittedBox(
                child: TextWidget(
                    color: color, text: "Total: \$0.434", textSize: 20)),
          ],
        ),
      ),
    );
  }
}

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/components/foods.dart';
import 'package:grocery_app/components/shop.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widget/text_widget.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  final Food food;
  const ProductPage({
    super.key,
    required this.food,
  });

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int quantityCount = 0;

  void incrementQuantity() {
    setState(
      () {
        quantityCount++;
      },
    );
  }

  void decrementQuantity() {
    setState(
      () {
        if (quantityCount > 0) {
          quantityCount--;
        }
      },
    );
  }

  void addToCart() {
    if (quantityCount > 0) {
      final shop = context.read<Shop>();

      shop.addToCart(quantityCount, widget.food);

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: const Text("Added"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(IconlyLight.tickSquare),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                width: size.width,
                height: size.height * 0.3,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: FancyShimmerImage(
                  imageUrl:
                      "https://cdn.britannica.com/36/160636-050-B1DC5C0A/Laetrile-apricot-pits.jpg",
                  boxFit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: TextWidget(
                      color: color,
                      text: "Product Title",
                      textSize: 18,
                      isTitle: true,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(IconlyLight.buy),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextWidget(color: color, text: "\$0.18", textSize: 18),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _quantityController(
                      function: decrementQuantity,
                      icon: CupertinoIcons.minus,
                      color: Colors.red),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      quantityCount.toString(),
                      style: TextStyle(fontSize: 18, color: color),
                    ),
                  ),
                  _quantityController(
                      function: incrementQuantity,
                      icon: CupertinoIcons.add,
                      color: Colors.green),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: addToCart,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: color),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(
                        color: Colors.white,
                        text: "Add to Cart",
                        textSize: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _quantityController(
      {required Function function,
      required IconData icon,
      required Color color}) {
    return Flexible(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Material(
          borderRadius: BorderRadius.circular(16),
          color: color,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Icon(
                icon,
                color: Colors.white,
                size: 20,
              ),
            ),
            onTap: () {
              function();
            },
          ),
        ),
      ),
    );
  }
}

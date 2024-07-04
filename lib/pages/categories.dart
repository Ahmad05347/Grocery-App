import 'package:flutter/material.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widget/categories_widget.dart';
import 'package:grocery_app/widget/text_widget.dart';

class Categories extends StatelessWidget {
  Categories({super.key});

  List<Color> gridColor = [
    const Color(0xff53B175),
    const Color(0xffF8A44C),
    const Color(0xffF7A593),
    const Color(0xffD3B0E0),
    const Color(0xffFDE598),
    const Color(0xffB7DFF5),
  ];

  List<Map<String, dynamic>> catInfo = [
    {"imgPath": "lib/images/wishlist.png", "catText": "Fruits"},
    {"imgPath": "lib/images/shopping-cart.png", "catText": "Vegetables"},
    {"imgPath": "lib/images/seller.png", "catText": "Herbs"},
    {"imgPath": "lib/images/search.png", "catText": "Nuts"},
    {"imgPath": "lib/images/history.png", "catText": "Spices"},
    {"imgPath": "lib/images/gift.png", "catText": "Grains"},
  ];

  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    Color color = utils.color;
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          color: color,
          text: "Categories",
          textSize: 24,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 240 / 250,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(
            6,
            (index) {
              return CategoriesWidget(
                index: index,
                catText: catInfo[index]["catText"],
                imgPath: catInfo[index]["imgPath"],
                passedcolor: gridColor[index],
              );
            },
          ),
        ),
      ),
    );
  }
}

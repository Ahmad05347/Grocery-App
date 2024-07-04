import 'package:flutter/material.dart';
import 'package:grocery_app/components/shop.dart';
import 'package:grocery_app/pages/product.dart';
import 'package:grocery_app/provider/dark_theme_provider.dart';
import 'package:grocery_app/widget/text_widget.dart';
import 'package:provider/provider.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget(
      {super.key,
      required this.catText,
      required this.passedcolor,
      required this.index,
      required this.imgPath});

  final String catText, imgPath;
  final Color passedcolor;
  final int index;

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodItems;
    double widthSize = MediaQuery.of(context).size.width;
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(
              food: foodMenu[index],
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: passedcolor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: passedcolor,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: widthSize * 0.3,
                height: widthSize * 0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imgPath), fit: BoxFit.cover),
                ),
              ),
            ),
            TextWidget(color: color, text: catText, textSize: 18),
          ],
        ),
      ),
    );
  }
}

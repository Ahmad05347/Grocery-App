import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widget/on_sale_widget.dart';
import 'package:grocery_app/widget/text_widget.dart';

class OnSaleScreen extends StatelessWidget {
  static const routeName = "/OnSaleWidget";
  const OnSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool _isOnSale = false;
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          borderRadius: BorderRadius.circular(16),
          child: Icon(
            IconlyLight.arrowLeft2,
            color: color,
          ),
        ),
        title: TextWidget(color: color, text: "Products On Sale", textSize: 24),
      ),
      body: _isOnSale
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "lib/images/shopping-cart.png",
                      height: 100,
                      width: 100,
                    ),
                    Text(
                      "Nothing is on sale yet! \nStay tuned",
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ),
            )
          : GridView.count(
              // crossAxisSpacing: 10,
              // mainAxisSpacing: 10,
              // shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: size.width / (size.height * 0.5),
              children: List.generate(
                16,
                (index) {
                  return const OnSaleWidget();
                },
              ),
            ),
    );
  }
}

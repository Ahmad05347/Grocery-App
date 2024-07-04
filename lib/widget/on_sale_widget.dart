import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/components/shop.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widget/heart_BTN.dart';
import 'package:grocery_app/widget/price_widget.dart';
import 'package:grocery_app/widget/text_widget.dart';
import 'package:provider/provider.dart';

class OnSaleWidget extends StatefulWidget {
  const OnSaleWidget({super.key});

  @override
  State<OnSaleWidget> createState() => _OnSaleWidgetState();
}

class _OnSaleWidgetState extends State<OnSaleWidget> {
  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodItems;
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FancyShimmerImage(
                      imageUrl:
                          "https://cdn.britannica.com/36/160636-050-B1DC5C0A/Laetrile-apricot-pits.jpg",
                      height: size.width * 0.22,
                      width: size.width * 0.25,
                      boxFit: BoxFit.cover,
                    ),
                    Column(
                      children: [
                        TextWidget(color: color, text: "1KG", textSize: 22),
                        const SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                IconlyLight.bag2,
                                size: 22,
                                color: color,
                              ),
                            ),
                            const HeartBTN()
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const PriceWidget(
                  isOnSale: true,
                  price: 9.9,
                  salePrice: 1.1,
                  textPrice: "1",
                ),
                const SizedBox(
                  height: 7,
                ),
                TextWidget(color: color, text: "Product", textSize: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

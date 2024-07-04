import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/components/product_tile.dart';
import 'package:grocery_app/components/shop.dart';
import 'package:grocery_app/pages/product.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widget/heart_BTN.dart';
import 'package:grocery_app/widget/price_widget.dart';
import 'package:grocery_app/widget/text_widget.dart';
import 'package:provider/provider.dart';

class FeedWidget extends StatefulWidget {
  const FeedWidget({super.key});

  @override
  State<FeedWidget> createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  final _qualityTextController = TextEditingController();

  @override
  void initState() {
    _qualityTextController.text = "1";
    super.initState();
  }

  @override
  void dispose() {
    _qualityTextController.dispose();
    super.dispose();
  }

  void navigateToPage(int index) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodItems;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductTile(
          function: () => ProductPage(food: foodMenu[index]),
          food: foodMenu[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodItems;
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Material(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).cardColor,
        child: InkWell(
          onTap: () {
            navigateToPage;
          },
          borderRadius: BorderRadius.circular(16),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              FancyShimmerImage(
                imageUrl:
                    "https://cdn.britannica.com/36/160636-050-B1DC5C0A/Laetrile-apricot-pits.jpg",
                height: size.width * 0.15,
                width: size.width * 0.2,
                boxFit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      color: color,
                      text: "Title",
                      textSize: 20,
                      isTitle: true,
                    ),
                    const HeartBTN(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 4,
                      child: PriceWidget(
                        isOnSale: true,
                        price: 1.54,
                        salePrice: 1.1,
                        textPrice: _qualityTextController.text,
                      ),
                    ),
                    Flexible(
                      child: Row(
                        children: [
                          FittedBox(
                            child: TextWidget(
                                color: color, text: "KG", textSize: 20),
                          ),
                          Flexible(
                            flex: 2,
                            child: TextFormField(
                              controller: _qualityTextController,
                              key: const ValueKey("10"),
                              style: TextStyle(color: color, fontSize: 18),
                              keyboardType: TextInputType.number,
                              enabled: true,
                              maxLines: 1,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp("[0-9.]"),
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Theme.of(context).cardColor),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  child: TextWidget(
                      color: color, text: "Add to cart", textSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

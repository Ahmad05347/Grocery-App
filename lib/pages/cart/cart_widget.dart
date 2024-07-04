import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widget/heart_BTN.dart';
import 'package:grocery_app/widget/text_widget.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  final _quantityTextController = TextEditingController();

  @override
  void initState() {
    _quantityTextController.text = "1";
    super.initState();
  }

  @override
  void dispose() {
    _quantityTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Theme.of(context).canvasColor,
                ),
                child: Row(
                  children: [
                    Container(
                      height: size.width * 0.25,
                      width: size.width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: FancyShimmerImage(
                        imageUrl:
                            "https://cdn.britannica.com/36/160636-050-B1DC5C0A/Laetrile-apricot-pits.jpg",
                        boxFit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      children: [
                        TextWidget(color: color, text: "Title", textSize: 20),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          width: size.width * 0.3,
                          child: Row(
                            children: [
                              _quantityController(
                                  function: () {},
                                  icon: CupertinoIcons.minus,
                                  color: Colors.red),
                              Flexible(
                                flex: 1,
                                child: TextField(
                                  controller: _quantityTextController,
                                  keyboardType: TextInputType.number,
                                  maxLines: 1,
                                  decoration: const InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(),
                                    ),
                                  ),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp("[0-9]"),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    setState(
                                      () {
                                        if (value.isEmpty) {
                                          _quantityTextController.text = "1";
                                        } else {
                                          return;
                                        }
                                      },
                                    );
                                  },
                                ),
                              ),
                              _quantityController(
                                  function: () {},
                                  icon: CupertinoIcons.add,
                                  color: Colors.green),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: const Icon(
                              CupertinoIcons.cart_badge_minus,
                              size: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const HeartBTN(),
                          TextWidget(
                            color: color,
                            text: "\$0.99",
                            textSize: 18,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
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
          color: color,
          borderRadius: BorderRadius.circular(16),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
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

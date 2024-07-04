import 'package:flutter/material.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widget/text_widget.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget(
      {super.key,
      required this.isOnSale,
      required this.price,
      required this.salePrice,
      required this.textPrice});

  final double salePrice, price;
  final String textPrice;
  final bool isOnSale;

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    double userPrice = isOnSale ? salePrice : price;

    return FittedBox(
      child: Row(
        children: [
          TextWidget(
              color: Colors.green,
              text:
                  "\$${(userPrice * int.parse(textPrice)).toStringAsFixed(2)}",
              textSize: 18),
          const SizedBox(
            width: 7,
          ),
          Visibility(
            visible: isOnSale ? true : false,
            child: Text(
              "\$${(price * int.parse(textPrice)).toStringAsFixed(2)}",
              style: TextStyle(
                  color: color, decoration: TextDecoration.lineThrough),
            ),
          )
        ],
      ),
    );
  }
}

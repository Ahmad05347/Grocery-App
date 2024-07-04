import 'package:flutter/cupertino.dart';
import 'package:grocery_app/components/foods.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodItems = [
    Food(
        imagePath:
            "https://cdn.britannica.com/36/160636-050-B1DC5C0A/Laetrile-apricot-pits.jpg",
        name: "Hello",
        price: "29"),
  ];
  List<Food> _cart = [];

  List<Food> get cart => _cart;
  List<Food> get foodItems => _foodItems;

  void addToCart(int quantity, Food foodItems) {
    for (var i = 0; i < quantity; i++) {
      _cart.add(foodItems);
    }
    notifyListeners();
  }

  void removeFood(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}

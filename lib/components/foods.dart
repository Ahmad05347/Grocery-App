class Food {
  String name;
  String price;
  String imagePath;

  Food({required this.imagePath, required this.name, required this.price});

  String get _name => name;
  String get _price => price;
  String get _imagePath => imagePath;
}

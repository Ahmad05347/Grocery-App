import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/inner%20screens/feeds_screen.dart';
import 'package:grocery_app/inner%20screens/on_sale_screen.dart';
import 'package:grocery_app/services/global_method.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widget/feed_widget.dart';
import 'package:grocery_app/widget/on_sale_widget.dart';
import 'package:grocery_app/widget/text_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _offersImages = [
    "lib/images/offers/download (1).jpg",
    "lib/images/offers/download (2).jpg",
    "lib/images/offers/download (3).jpg",
    "lib/images/offers/download.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.33,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    _offersImages[index],
                    fit: BoxFit.cover,
                  );
                },
                autoplay: true,
                itemCount: _offersImages.length,
                pagination: const SwiperPagination(
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            TextButton(
              onPressed: () {
                GlobalMethod.navigateTo(
                    context: context, routeName: OnSaleScreen.routeName);
              },
              child: TextWidget(
                  color: Colors.blue, text: "View all", textSize: 20),
            ),
            const SizedBox(
              height: 7,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 5,
                ),
                RotatedBox(
                  quarterTurns: -1,
                  child: Row(
                    children: [
                      TextWidget(
                          color: Colors.greenAccent,
                          text: "ON SALE",
                          textSize: 25),
                      const Icon(
                        IconlyLight.buy,
                        color: Colors.green,
                      )
                    ],
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    height: size.height * 0.25,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return const OnSaleWidget();
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  TextWidget(
                    color: color,
                    text: "Our Products",
                    textSize: 22,
                    isTitle: true,
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      GlobalMethod.navigateTo(
                          context: context, routeName: FeedsScreen.routeName);
                    },
                    child: TextWidget(
                        color: Colors.blue, text: "Browse all", textSize: 20),
                  ),
                ],
              ),
            ),
            GridView.count(
              // crossAxisSpacing: 10,
              // mainAxisSpacing: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: size.width / (size.height * 0.66),
              children: List.generate(
                4,
                (index) {
                  return const FeedWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

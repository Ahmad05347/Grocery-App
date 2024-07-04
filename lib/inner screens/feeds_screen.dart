import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widget/feed_widget.dart';
import 'package:grocery_app/widget/text_widget.dart';

class FeedsScreen extends StatefulWidget {
  static const routeName = "/FeedsScreen";
  const FeedsScreen({super.key});

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  final TextEditingController? _searchTextController = TextEditingController();
  final FocusNode _searchTextFocusNode = FocusNode();
  @override
  void dispose() {
    _searchTextFocusNode.dispose();
    _searchTextController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
        title: TextWidget(color: color, text: "All Products", textSize: 20),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: kBottomNavigationBarHeight,
                child: TextField(
                  focusNode: _searchTextFocusNode,
                  controller: _searchTextController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide:
                            const BorderSide(color: Colors.green, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide:
                            const BorderSide(color: Colors.green, width: 1),
                      ),
                      hintText: "Search here...",
                      prefixIcon: const Icon(IconlyLight.search),
                      suffix: IconButton(
                        onPressed: () {
                          _searchTextController!.clear();
                          _searchTextFocusNode.unfocus();
                        },
                        icon: Icon(Icons.close),
                        color:
                            _searchTextFocusNode.hasFocus ? Colors.red : color,
                      )),
                ),
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

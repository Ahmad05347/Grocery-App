import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/provider/dark_theme_provider.dart';
import 'package:grocery_app/widget/text_widget.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final updateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;

    @override
    void dispose() {
      updateController.dispose();
      super.dispose();
    }

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Hi, ",
                    style: const TextStyle(
                        color: Color.fromARGB(255, 5, 169, 90),
                        fontSize: 27,
                        fontWeight: FontWeight.w500),
                    children: <TextSpan>[
                      TextSpan(
                          text: "MyName",
                          style: TextStyle(
                              color: color,
                              fontSize: 25,
                              fontWeight: FontWeight.w300),
                          recognizer: TapGestureRecognizer()..onTap = () {}),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextWidget(color: color, text: "email@email.com", textSize: 15),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  thickness: 1,
                ),
                const SizedBox(
                  height: 20,
                ),
                _listTile(
                    title: "Address",
                    icon: IconlyLight.profile,
                    onPressed: () async {
                      await _showAddressAlertDialog();
                    },
                    subtitle: "Subtitle 2",
                    color: color),
                _listTile(
                    title: "Orders",
                    icon: IconlyLight.bag2,
                    onPressed: () {},
                    color: color),
                _listTile(
                    title: "WishList",
                    icon: IconlyLight.heart,
                    onPressed: () {},
                    color: color),
                _listTile(
                    title: "Viewed",
                    icon: IconlyLight.show,
                    onPressed: () {},
                    color: color),
                SwitchListTile(
                  onChanged: (bool value) {
                    setState(
                      () {
                        themeState.setDarkTheme = value;
                      },
                    );
                  },
                  value: themeState.getDarkTheme,
                  title: TextWidget(
                      color: color,
                      text:
                          themeState.getDarkTheme ? "Dark Mode" : "Light Mode",
                      textSize: 20),
                  secondary: Icon(themeState.getDarkTheme
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined),
                ),
                _listTile(
                    title: "Logout",
                    icon: IconlyLight.logout,
                    onPressed: () {
                      _showLogoutAlertDialog();
                    },
                    color: color),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showLogoutAlertDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Image.asset(
                "lib/images/warning.png",
                height: 30,
                width: 20,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "Signout?",
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
            ],
          ),
          content: const Text("Do you want to signouot?"),
          actions: [
            TextButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: TextWidget(
                color: Colors.cyan,
                text: "Cancel",
                textSize: 18,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: TextWidget(
                color: Colors.red,
                text: "OK",
                textSize: 18,
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showAddressAlertDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Update Address"),
          content: TextField(
            onChanged: (value) {
              // updateController.text;
            },
            controller: updateController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: "Your Address",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text("Update"),
            ),
          ],
        );
      },
    );
  }

  Widget _listTile(
      {required String title,
      String? subtitle,
      required IconData icon,
      required Function onPressed,
      required Color color}) {
    return ListTile(
      title: TextWidget(
        color: color,
        text: title,
        textSize: 20,
      ),
      subtitle: TextWidget(
        color: color,
        text: subtitle ?? "",
        textSize: 15,
      ),
      leading: Icon(icon),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: () {
        onPressed();
      },
    );
  }
}

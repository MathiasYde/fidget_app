import 'package:fidget_app/config/themes.dart';
import 'package:fidget_app/pages/settings_page.dart';
import 'package:fidget_app/providers/settings.dart';
import "package:flutter/material.dart";
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';

import 'package:fidget_app/datamodels/errors.dart';

import 'package:fidget_app/pages/error_page.dart';
import 'package:fidget_app/pages/toucharea_page.dart';
import 'package:fidget_app/pages/button_page.dart';
import 'package:fidget_app/pages/switch_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => Settings.fromSharedPreferences(prefs)),
      ],
      child: const FidgetApp(),
    ),
  );
}

class FidgetApp extends StatelessWidget {
  const FidgetApp({super.key});

  @override
  Widget build(BuildContext context) {
    Settings settings = context.watch<Settings>();

    return MaterialApp(
      title: "Fidget App",
      themeMode: settings.themeMode,
      theme: kLightTheme,
      darkTheme: kDarkTheme,
      home: FutureBuilder(
        future: Vibration.hasVibrator(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage(title: "Fidget App");
          } else {
            return ErrorPage(Errors.noVibrator);
          }
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int selectedPageIndex = 0;

  final Map<String, Widget> pages = {
    "Switch": const SwitchPage(),
    "Button": const ButtonPage(),
    "Touch Area": const TouchAreaPage(),
    // "Radial Dial": const RadialDialPage(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView.builder(
          itemCount: pages.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(pages.keys.elementAt(index)),
              onTap: () {
                setState(() {
                  selectedPageIndex = index;
                });
                Navigator.pop(context);
              },
            );
          },
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: SafeArea(
        child: pages.values.elementAt(selectedPageIndex),
      ),
    );
  }
}

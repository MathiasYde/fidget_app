import 'package:fidget_app/providers/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    Settings settings = context.watch<Settings>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          IconButton(
            onPressed: () {
              showLicensePage(context: context);
            },
            icon: const Icon(Icons.info),
          ),
        ],
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            tiles: [
              SettingsTile(
                title: const Text("Theme"),
                leading: const Icon(Icons.color_lens),
                trailing: DropdownButton(
                  value: settings.themeMode,
                  onChanged: (value) {
                    settings.updateWith(themeMode: value as ThemeMode);
                  },
                  items: [
                    for (ThemeMode themeMode in ThemeMode.values)
                      DropdownMenuItem(
                        value: themeMode,
                        child: Text(themeMode.toString().split('.').last),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

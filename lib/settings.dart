import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgets_responsive/provider_theme.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: Consumer<ProviderTheme>(builder: (ctx, provider, __) {
          return SwitchListTile.adaptive(
              title: Text("Dark Modes"),
              subtitle: Text("Chnage them mode here"),
              value: provider.getThemeValue(),
              onChanged: (value) {
                provider.updateTheme(value: value);
              });
        }));
  }
}

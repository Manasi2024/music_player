import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Padding(
      padding: const EdgeInsets.only(left: 50),
    child: Text(" S E T T I N G S",
        style: TextStyle(
          fontSize: 25
        ),
    ),
      ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(12)),
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //
              Text(" Dark Mode",
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),),

              CupertinoSwitch(
                  value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
                  onChanged: (value)=> Provider.of<ThemeProvider>(context, listen: false).toggleTheme()
          ),
          ],
        ),
      ),
    );
  }
}

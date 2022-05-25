import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../Utils/theme_provider.dart';
import '../Utils/view_constants.dart';

class SettinsPage extends StatelessWidget {
  const SettinsPage({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeProvider theme;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Align(
            child: Text(
              "Settings",
              style: theme.getTheme().textTheme.headline1,
            ),
          ),
          SizedBox(
            height: 100.h,
          ),
          SwitchListTile.adaptive(
              activeColor: fabColor,
              title: Text(
                "Switch Theme Color",
                style: theme.getTheme().textTheme.headline1,
              ),
              subtitle: Text(
                  "Current Theme: " +
                      context
                          .watch<ThemeProvider>()
                          .themeMode
                          .name
                          .toUpperCase(),
                  style: TextStyle(
                    fontSize: 18.sp,
                  )),
              value: context.watch<ThemeProvider>().themeMode.index !=
                  ThemeMode.light.index,
              onChanged: (val) {
                if (val) {
                  context.read<ThemeProvider>().setDarkMode();
                } else {
                  context.read<ThemeProvider>().setLightMode();
                }
              })
        ],
      ),
    );
  }
}

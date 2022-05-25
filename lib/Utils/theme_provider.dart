import 'package:crypto_app/Utils/view_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  void setDarkMode() async {
    themeMode = ThemeMode.dark;

    notifyListeners();
  }

  void setLightMode() async {
    themeMode = ThemeMode.light;
    notifyListeners();
  }

  getBottomIconColor(bool value) {
    if (value) {
      return getTheme().iconTheme.color;
    }
    return getTheme().iconTheme.color!.withOpacity(.5);
  }

  ThemeData getTheme() {
    if (themeMode == ThemeMode.light) {
      return lightTheme;
    }
    return darkTheme;
  }

  final darkTheme = ThemeData(
    fontFamily: GoogleFonts.barlow().fontFamily,
    bottomAppBarColor: Colors.blueGrey.shade900,
    iconTheme: IconThemeData(color: const Color(0xff90E0EF), size: 30.sp),
    listTileTheme: ListTileThemeData(
      textColor: Color(0xff1d3557),
    ),
    scaffoldBackgroundColor: Color.fromARGB(255, 12, 19, 23),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
    colorScheme: const ColorScheme.dark(),
  );

  final lightTheme = ThemeData(
      fontFamily: GoogleFonts.barlow().fontFamily,
      bottomAppBarColor: const Color(0xff90E0EF),
      iconTheme: IconThemeData(color: const Color(0xff1d3557), size: 30.sp),
      listTileTheme: const ListTileThemeData(
        textColor: Color(0xff1d3557),
      ),
      scaffoldBackgroundColor: const Color(0xFFCAF0F8),
      primaryColor: const Color(0xff1d3557),
      textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
          color: Color(0xff1d3557),
        ),
      ),
      colorScheme: const ColorScheme.light());
}

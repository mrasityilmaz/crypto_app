import 'package:crypto_app/Utils/theme_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

import 'View/Widgets/bottom_appbar.dart';
import 'View/Widgets/floating_action.dart';
import 'View/assets_page.dart';
import 'View/homepage.dart';
import 'View/profile_page.dart';
import 'View/settings_page.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
      child: MaterialMain()));
}

class MaterialMain extends StatelessWidget {
  MaterialMain({Key? key}) : super(key: key);

  static final PageController pageController = PageController(initialPage: 0);
  final ValueNotifier<int> currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, child) => MaterialApp(
        title: 'CryptoCurrency App',
        debugShowCheckedModeBanner: false,
        theme: context.watch<ThemeProvider>().lightTheme,
        themeMode: context.watch<ThemeProvider>().themeMode,
        darkTheme: context.watch<ThemeProvider>().darkTheme,
        builder: (context, widget) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
        home: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            floatingActionButton: MyFAB(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: MyBottomAppBar(
              currentIndex: currentIndex,
            ),
            body: PagesWidget(
                currentIndex: currentIndex, pageController: pageController)),
      ),
    );
  }
}

class PagesWidget extends StatelessWidget {
  const PagesWidget(
      {Key? key, required this.pageController, required this.currentIndex})
      : super(key: key);

  final PageController pageController;
  final ValueNotifier currentIndex;

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = context.watch<ThemeProvider>();
    List<Widget> screens = [
      const HomePage(),
      AssetsPage(theme: theme),
      ProfilePage(theme: theme),
      SettinsPage(theme: theme)
    ];
    return PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          currentIndex.value = value;
        },
        controller: MaterialMain.pageController,
        itemCount: screens.length,
        itemBuilder: ((context, index) => screens[index]));
  }
}

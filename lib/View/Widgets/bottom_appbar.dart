import 'package:crypto_app/Utils/theme_provider.dart';
import 'package:crypto_app/Utils/view_constants.dart';
import 'package:crypto_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MyBottomAppBar extends StatelessWidget {
  const MyBottomAppBar({Key? key, required this.currentIndex})
      : super(key: key);

  final ValueNotifier<int> currentIndex;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = context.watch<ThemeProvider>();
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 6,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 5.sp),
        child: ValueListenableBuilder(
          valueListenable: currentIndex,
          builder: (context, int currentIndexValue, child) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  MaterialMain.pageController.animateToPage(0,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.fastOutSlowIn);
                },
                icon: Icon(
                    currentIndexValue == 0
                        ? CupertinoIcons.chart_bar_fill
                        : CupertinoIcons.chart_bar,
                    color: themeProvider
                        .getBottomIconColor(currentIndexValue == 0)),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    MaterialMain.pageController.animateToPage(1,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.fastOutSlowIn);
                  },
                  icon: Icon(currentIndexValue == 1
                      ? Icons.account_balance_wallet
                      : Icons.account_balance_wallet_outlined),
                  color:
                      themeProvider.getBottomIconColor(currentIndexValue == 1)),
              const Spacer(
                flex: 5,
              ),
              IconButton(
                  onPressed: () {
                    MaterialMain.pageController.animateToPage(2,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.fastOutSlowIn);
                  },
                  icon: Icon(currentIndexValue == 2
                      ? CupertinoIcons.person_fill
                      : CupertinoIcons.person),
                  color:
                      themeProvider.getBottomIconColor(currentIndexValue == 2)),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    MaterialMain.pageController.animateToPage(3,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.fastOutSlowIn);
                  },
                  icon: const Icon(CupertinoIcons.settings),
                  color:
                      themeProvider.getBottomIconColor(currentIndexValue == 3)),
            ],
          ),
        ),
      ),
    );
  }
}

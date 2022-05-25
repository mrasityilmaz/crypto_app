import 'dart:convert';
import 'dart:developer';

import 'package:crypto_app/Model/api_single_result_model.dart';
import 'package:crypto_app/Repo/api_services.dart';
import 'package:crypto_app/Utils/theme_provider.dart';
import 'package:crypto_app/View/Dialog/exchange_dialog.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:cryptocoins_icons/cryptocoins_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../Utils/view_constants.dart';

class MyFAB extends StatelessWidget {
  MyFAB({
    Key? key,
  }) : super(key: key);

  // first Sell
  // second Buy
  final ValueNotifier<List<String?>> choices = ValueNotifier([null, null]);

  final TextEditingController sellController = TextEditingController();
  final TextEditingController buyyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var themeProvider = context.watch<ThemeProvider>().getTheme();
    return ElevatedButton(
      child: const Icon(
        CupertinoIcons.arrow_right_arrow_left,
      ),
      style: ElevatedButton.styleFrom(
          elevation: 20,
          primary: fabColor,
          padding: EdgeInsets.all(20.sp),
          shadowColor: Colors.white30,
          shape: const CircleBorder()),
      onPressed: () async {
        exchangeBottomSheet(context);
      },
    );
  }
}

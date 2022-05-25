import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../Widgets/exchange_dialog_body.dart';

Future exchangeBottomSheet(BuildContext context) {
  return showMaterialModalBottomSheet(
      context: context,
      elevation: 20,
      barrierColor: Colors.blueGrey.shade300.withOpacity(.7),
      animationCurve: Curves.fastLinearToSlowEaseIn,
      duration: const Duration(milliseconds: 500),
      backgroundColor: Colors.transparent,
      bounce: true,
      builder: (context) => const ExchangeDialogBody());
}

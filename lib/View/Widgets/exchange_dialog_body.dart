import 'package:crypto_app/Utils/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../Model/api_single_result_model.dart';
import '../../Repo/api_services.dart';
import '../../Utils/view_constants.dart';

class ExchangeDialogBody extends StatelessWidget {
  const ExchangeDialogBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeProvider = context.watch<ThemeProvider>().getTheme();
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
          color: themeProvider.scaffoldBackgroundColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.r))),
      height: .7.sh,
      child: Column(
        children: [
          Text(
            "Exchange",
            style: themeProvider.textTheme.headline1,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Container(
              height: 60.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: themeProvider.cardColor,
                  borderRadius: BorderRadius.circular(14.r)),
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Bitcoin",
                    style: themeProvider.textTheme.headline1,
                  ),
                  Text(
                    "1 BTC",
                    style: TextStyle(
                        fontFamily: GoogleFonts.robotoSlab().fontFamily,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Divider(
                  color: bottomIconColor,
                  thickness: 2.w,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.currency_exchange),
              ),
              Expanded(
                child: Divider(
                  color: bottomIconColor,
                  thickness: 2.w,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Container(
              height: 60.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: themeProvider.cardColor,
                  borderRadius: BorderRadius.circular(14.r)),
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "USD",
                    style: themeProvider.textTheme.headline1,
                  ),
                  FutureBuilder(
                    future: CryptoAPI.searchCoin("btc"),
                    builder: (BuildContext context,
                        AsyncSnapshot<ApiResult> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator.adaptive();
                      } else {
                        Object? price = snapshot
                            .data!.data!.bTC!.quote.priceAndVolume.price;
                        return Text(
                          price.toString().substring(
                              0, price.toString().lastIndexOf('.') + 5),
                          style: TextStyle(
                              fontFamily: GoogleFonts.robotoSlab().fontFamily,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          SizedBox(
            width: double.infinity,
            height: 60.h,
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  maximumSize: Size(double.infinity, 60.h),
                  fixedSize: Size(double.infinity, 60.h),
                  backgroundColor: headerContainerColor,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.r)),
                  elevation: 10,
                ),
                child: Text(
                  "Exchange maybe later",
                  style: TextStyle(
                      color: bottomIconColor,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700),
                )),
          )
        ],
      ),
    );
  }
}

import 'package:crypto_app/Utils/view_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils/theme_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeProvider theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: .3.sh,
          width: double.infinity,
          decoration: BoxDecoration(
              color: headerContainerColor,
              boxShadow: kElevationToShadow[24],
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(40.r))),
          child: SafeArea(
            bottom: false,
            child: Column(
              children: [
                Align(
                  child: Text(
                    "Profile",
                    style: theme.getTheme().textTheme.headline1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100.w,
                        height: 100.h,
                        decoration: BoxDecoration(
                            boxShadow: kElevationToShadow[24],
                            image: const DecorationImage(
                                image: NetworkImage(
                                    "https://media.istockphoto.com/photos/silhouette-of-man-in-dark-place-anonymous-backlit-contour-a-picture-id1139459625?b=1&k=20&m=1139459625&s=170667a&w=0&h=zVpBlAmdwUDWIVf0Zxtb3idMCitol4nzII2qde8Ybag="),
                                fit: BoxFit.fill),
                            shape: BoxShape.circle),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Adam Fawer",
                        style: TextStyle(
                            fontSize: 24.sp, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListTile(
            title: Text(
              "Last Transactions",
              style: theme.getTheme().textTheme.headline1,
            ),
            subtitle: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 20.h) +
                    EdgeInsets.only(bottom: .2.sh),
                itemBuilder: ((context, index) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: Container(
                        width: double.infinity,
                        height: 80.h,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey.shade200,
                            borderRadius: BorderRadius.circular(14.r)),
                        padding: EdgeInsets.all(10.w),
                        child: Row(
                          children: [
                            Container(
                              width: 60.w,
                              height: 60.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: Colors.blueGrey,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.blueGrey.shade600,
                                        offset: Offset(1, 1),
                                        spreadRadius: 1,
                                        blurRadius: 1),
                                    BoxShadow(
                                        color: Colors.blueGrey.shade300,
                                        offset: Offset(-1, -1),
                                        spreadRadius: 1,
                                        blurRadius: 1),
                                  ]),
                              child: Center(
                                child: Text(
                                  [
                                    "Bitcoin",
                                    "Etherium",
                                    "Litecoin",
                                    "Zartcoin"
                                  ][index % 4]
                                      .substring(0, 1),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          [
                                            "Bitcoin",
                                            "Etherium",
                                            "Litecoin",
                                            "Zartcoin"
                                          ][index % 4],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24.sp,
                                              fontWeight: FontWeight.w900),
                                        ),
                                        Text(
                                          "\$ ${index + 1}${(10 - index)}.${45}",
                                          style: TextStyle(
                                              fontFamily:
                                                  GoogleFonts.robotoSlab()
                                                      .fontFamily,
                                              color: Colors.white,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          index % 2 == 0 ? "Sell" : "Buy",
                                          style: TextStyle(
                                              color: bottomIconColor,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          DateTime.now().toString().substring(
                                              0,
                                              DateTime.now()
                                                  .toString()
                                                  .lastIndexOf('.')),
                                          style: TextStyle(
                                              color: bottomIconColor,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))),
          ),
        )
      ],
    );
  }
}

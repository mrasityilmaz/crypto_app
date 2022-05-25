import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils/theme_provider.dart';
import '../Utils/view_constants.dart';

class AssetsPage extends StatelessWidget {
  const AssetsPage({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeProvider theme;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SizedBox(
        height: 1.sh,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "My assets",
                  style: theme.getTheme().textTheme.headline1,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 40.h),
                height: .6.sh,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "Total Balance",
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "\$ 11.980,18",
                            style: TextStyle(
                                fontFamily: GoogleFonts.robotoSlab().fontFamily,
                                fontSize: 35.sp,
                                fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: PieChart(
                        PieChartData(
                            borderData: FlBorderData(
                              show: false,
                            ),
                            sectionsSpace: 5.w,
                            centerSpaceRadius: 100.h,
                            sections: showingSections()),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Container(
                    height: 90.h,
                    decoration: BoxDecoration(
                        boxShadow: kElevationToShadow[4],
                        color: Colors.blueGrey.shade300,
                        borderRadius: BorderRadius.circular(20.r)),
                    child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        itemBuilder: ((context, index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 20.h,
                                        width: 20.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                            color: Colors
                                                .accents[index + 1].shade400,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors
                                                      .accents[index + 1]
                                                      .shade700,
                                                  offset: Offset(1, 1),
                                                  spreadRadius: 1,
                                                  blurRadius: 1),
                                              BoxShadow(
                                                  color: Colors
                                                      .accents[index + 1]
                                                      .shade200,
                                                  offset: Offset(-1, -1),
                                                  spreadRadius: 1,
                                                  blurRadius: 1),
                                            ]),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(
                                        ["40", "30", "15", "15"][index] + "%",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontFamily: GoogleFonts.robotoSlab()
                                                .fontFamily,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    [
                                      "Bitcoin",
                                      "Etherium",
                                      "Litecoin",
                                      "Zartcoin"
                                    ][index],
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 18.sp, color: Colors.white),
                                  ),
                                ],
                              ),
                            )),
                        separatorBuilder: (context, sprindex) =>
                            VerticalDivider(
                              color: mainBackgroundColor,
                              thickness: 2.w,
                            ),
                        itemCount: 4)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<PieChartSectionData> showingSections() {
  return List.generate(4, (i) {
    final fontSize = 16.0;
    final radius = 50.0;
    switch (i) {
      case 0:
        return PieChartSectionData(
          color: Colors.accents[i + 1].shade400,
          value: 40,
          title: '40%',
          radius: radius,
          titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff)),
        );
      case 1:
        return PieChartSectionData(
          color: Colors.accents[i + 1].shade400,
          value: 30,
          title: '30%',
          radius: radius,
          titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff)),
        );
      case 2:
        return PieChartSectionData(
          color: Colors.accents[i + 1].shade400,
          value: 15,
          title: '15%',
          radius: radius,
          titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff)),
        );
      case 3:
        return PieChartSectionData(
          color: Colors.accents[i + 1].shade400,
          value: 15,
          title: '15%',
          radius: radius,
          titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff)),
        );
      default:
        throw Error();
    }
  });
}

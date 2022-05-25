import 'package:auto_size_text/auto_size_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import '../../Model/api_result_list_model.dart';

class CryptoListItem extends StatelessWidget {
  final ListData itemData;
  const CryptoListItem({Key? key, required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Container(
        width: double.infinity,
        height: 100.h,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.8),
            borderRadius: BorderRadius.circular(20.r)),
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: AutoSizeText(
                    itemData.name,
                    minFontSize: 18,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w900),
                  ),
                  subtitle: AutoSizeText(
                    itemData.symbol,
                  ),
                )),
            Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LineChart(mainData()),
                )),
            Flexible(
                flex: 3,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: AutoSizeText(
                    "\$ ${itemData.quote.uSD!.price.toString().substring(0, itemData.quote.uSD!.price.toString().lastIndexOf('.') + 3)}",
                    minFontSize: 20,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontFamily: GoogleFonts.robotoSlab().fontFamily,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                  subtitle: AutoSizeText(
                    "${itemData.quote.uSD!.percentChange24h!.toString().substring(0, 4)}%",
                    textAlign: TextAlign.end,
                    minFontSize: 20,
                    style: TextStyle(
                        fontFamily: GoogleFonts.robotoSlab().fontFamily,
                        color: itemData.quote.uSD!.percentChange24h!
                                .toString()
                                .contains('-')
                            ? Colors.red
                            : Colors.green.shade700),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

LineChartData mainData() {
  return LineChartData(
    gridData: FlGridData(
      show: false,
      drawVerticalLine: false,
      horizontalInterval: 1,
      verticalInterval: 1,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: const Color(0xff37434d),
          strokeWidth: 1,
        );
      },
      getDrawingVerticalLine: (value) {
        return FlLine(
          color: const Color(0xff37434d),
          strokeWidth: 1,
        );
      },
    ),
    titlesData: FlTitlesData(
      show: false,
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
    ),
    borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d), width: 1)),
    minX: 0,
    maxX: 11,
    minY: 0,
    maxY: 6,
    lineBarsData: [
      LineChartBarData(
        spots: [
          FlSpot(0, math.Random.secure().nextDouble() * 3),
          FlSpot(2.6, math.Random.secure().nextDouble() * 3),
          FlSpot(4.9, math.Random.secure().nextDouble() * 3),
          FlSpot(6.8, math.Random.secure().nextDouble() * 3),
          FlSpot(8, math.Random.secure().nextDouble() * 4),
          FlSpot(9.5, math.Random.secure().nextDouble() * 3),
          FlSpot(11, math.Random.secure().nextDouble() * 4),
        ],
        isCurved: true,
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
      ),
    ],
  );
}

List<Color> gradientColors = [
  const Color(0xff23b6e6),
  const Color(0xff02d39a),
];

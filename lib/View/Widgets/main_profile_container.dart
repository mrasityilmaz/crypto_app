import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderProfileContainer extends StatelessWidget {
  const HeaderProfileContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 1.sw,
        height: .3.sh,
        decoration: BoxDecoration(
            boxShadow: kElevationToShadow[4],
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(40.r)),
            color: const Color(0xff48CAE4).withOpacity(1)),
        padding: EdgeInsets.all(20.w),
        child: SafeArea(
          top: true,
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 70.w,
                    height: 70.h,
                    decoration: BoxDecoration(
                        boxShadow: kElevationToShadow[24],
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://media.istockphoto.com/photos/silhouette-of-man-in-dark-place-anonymous-backlit-contour-a-picture-id1139459625?b=1&k=20&m=1139459625&s=170667a&w=0&h=zVpBlAmdwUDWIVf0Zxtb3idMCitol4nzII2qde8Ybag="),
                            fit: BoxFit.fill),
                        shape: BoxShape.circle),
                  ),
                  Flexible(
                    child: ListTile(
                      title: Text(
                        "Welcome back,Adam!",
                        style: TextStyle(
                            fontSize: 22.sp, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "Smart Wallet",
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              ListTile(
                contentPadding: EdgeInsets.only(right: .05.sw),
                trailing: Wrap(
                  direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.start,
                  children: [
                    Icon(
                      Icons.arrow_circle_up_rounded,
                      color: Colors.green.shade800,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "% 8.9",
                      style: TextStyle(
                          fontFamily: GoogleFonts.robotoSlab().fontFamily,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
                title: Text(
                  "Total Balance",
                  style:
                      TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  "\$ 11.980,18",
                  style: TextStyle(
                      fontFamily: GoogleFonts.robotoSlab().fontFamily,
                      fontSize: 35.sp,
                      fontWeight: FontWeight.w900),
                ),
              )
            ],
          ),
        ));
  }
}

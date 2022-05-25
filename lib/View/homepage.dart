import 'package:crypto_app/Model/api_result_list_model.dart';

import 'package:crypto_app/Repo/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Widgets/crypto_list_item.dart';
import 'Widgets/main_profile_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderProfileContainer(),
        SizedBox(
          height: .7.sh,
          child: FutureBuilder(
            future: CryptoAPI.getCurrency(),
            builder:
                (BuildContext context, AsyncSnapshot<ApiResultList> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator.adaptive();
              } else {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h) +
                          EdgeInsets.only(bottom: .2.sh),
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data!.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CryptoListItem(
                      itemData: snapshot.data!.data![index],
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pokeapp/utils/constants.dart' as constants;

class BottomLoadingBarWidget extends StatelessWidget {
  const BottomLoadingBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
        child: Column(children: [
      SizedBox(height: constants.largePadding),
      Center(
          child: CircularProgressIndicator(
              color: constants.circularProgressIndicatorColor)),
      SizedBox(height: constants.largePadding),
    ]));
  }
}

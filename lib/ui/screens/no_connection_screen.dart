import 'package:flutter/material.dart';

class NoConnectionWidget extends StatelessWidget {
  static String routeName = 'NoConnectionScreen';

  const NoConnectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          Icon(Icons.signal_wifi_connected_no_internet_4_rounded, size: 48),
          Text('Please Check Your Internet Connection')
        ],
      ),
    );
  }
}

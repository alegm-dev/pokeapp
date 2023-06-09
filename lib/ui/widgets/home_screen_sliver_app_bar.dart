import 'package:flutter/material.dart';
import 'package:pokeapp/utils/constants.dart' as constants;
import 'package:provider/provider.dart';

import '../../controllers/theme_controller.dart';
import '../screens/settings_screen.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Provider.of<ThemeController>(context).themeData;
    bool isDark = themeData == ThemeData.dark();

    return SliverAppBar(
      expandedHeight: constants.homeScreenSliverAppBarHeight,
      backgroundColor: isDark
          ? constants.scaffoldDarkThemeColor
          : constants.scaffoldLightThemeColor,
      elevation: 0,
      pinned: false,
      floating: true,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // get status bar height + add extra top padding
            SizedBox(
                height: MediaQuery.of(context).viewPadding.top +
                    constants.screenTopPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(constants.homeScreenTitle,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: isDark
                            ? constants.homeScreenTitleDarkThemeColor
                            : constants.homeScreenTitleLightThemeColor,
                        fontWeight: FontWeight.bold)),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(SettingsScreen.routeName);
                  },
                  icon: Icon(Icons.settings,
                      color: isDark
                          ? constants.searchIconDarkThemeColor
                          : constants.searchIconLightThemeColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

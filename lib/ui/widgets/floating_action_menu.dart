import 'package:flutter/material.dart';
import 'package:pokeapp/controllers/theme_controller.dart';
import 'package:pokeapp/ui/screens/favorite_screen.dart';
import 'package:pokeapp/ui/screens/search_screen.dart';
import 'package:provider/provider.dart';
import 'package:pokeapp/utils/constants.dart' as constants;

class FloatingActionMenu extends StatelessWidget {
  const FloatingActionMenu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Provider.of<ThemeController>(context).themeData;
    bool isDark = themeData == ThemeData.dark();
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: constants.favoriteIconHeightAndWidth,
          width: constants.favoriteIconHeightAndWidth,
          decoration: BoxDecoration(
            color: isDark
                ? constants.favoriteIconContainerDarkThemeColor
                : constants.favoriteIconContainerLightThemeColor,
            borderRadius:
                BorderRadius.circular(constants.containerCornerRadius),
            boxShadow: [
              BoxShadow(
                color: Colors.black54.withOpacity(0.5),
                spreadRadius: 2.0,
                blurRadius: 5.0,
                offset: const Offset(0, 5), // Desplazamiento de la sombra
              ),
            ],
          ),
          child: IconButton(
            icon: const Icon(Icons.favorite_rounded),
            color: isDark
                ? constants.favoriteIconDarkThemeColor
                : constants.favoriteIconLightColor,
            onPressed: () {
              navigateToScreen(context, FavoriteScreen.routeName);
            },
          ),
        ),
        const SizedBox(height: constants.mediumPadding),
        FloatingActionButton(
          onPressed: () {
            navigateToScreen(context, SearchScreen.routeName);
          },
          backgroundColor: isDark
              ? constants.homeScreenTitleDarkThemeColor
              : constants.homeScreenTitleLightThemeColor,
          elevation: 10.0,
          child: const Icon(
            Icons.search,
            color: constants.leftSearchIconColor,
          ),
        ),
        // add space between search container and menu icon
      ],
    );
  }

  void navigateToScreen(BuildContext context, String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }
}

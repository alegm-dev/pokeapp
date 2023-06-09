import 'package:flutter/material.dart';
import 'package:pokeapp/controllers/pokemon_about_controller.dart';
import 'package:pokeapp/controllers/pokemon_basic_controller.dart';
import 'package:pokeapp/controllers/pokemon_favorite_controller.dart';
import 'package:pokeapp/controllers/pokemon_more_info_controller.dart';
import 'package:pokeapp/controllers/pokemon_stat_controller.dart';
import 'package:pokeapp/controllers/search_controller.dart';
import 'package:pokeapp/controllers/theme_controller.dart';
import 'package:pokeapp/ui/screens/favorite_screen.dart';
import 'package:pokeapp/ui/screens/home_screen.dart';
import 'package:pokeapp/ui/screens/pokemon_detail_screen.dart';
import 'package:pokeapp/ui/screens/search_screen.dart';
import 'package:pokeapp/ui/screens/settings_screen.dart';
import 'package:pokeapp/ui/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var isDarkTheme = prefs.getBool("isDark") ?? true; // theme is dark by default
  runApp(
    ChangeNotifierProvider<ThemeController>(
      create: (_) => ThemeController(isDarkTheme),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PokemonBasicDataController()),
        ChangeNotifierProvider(create: (_) => PokemonAboutDataController()),
        ChangeNotifierProvider(create: (_) => PokemonMoreInfoController()),
        ChangeNotifierProvider(create: (_) => PokemonStatsController()),
        ChangeNotifierProvider(create: (_) => PokemonFavoritesController()),
        ChangeNotifierProvider(create: (_) => SearchPokemonsController()),
      ],
      child: Consumer<ThemeController>(
        builder: (context, provider, ch) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: provider.themeData,
            title: 'Flutter Demo',
            initialRoute: SplashScreen.routeName,
            routes: {
              SplashScreen.routeName: (context) => const SplashScreen(),
              HomeScreen.routeName: (context) => const HomeScreen(),
              PokemonDetailScreen.routeName: (context) =>
                  const PokemonDetailScreen(),
              SettingsScreen.routeName: (context) => const SettingsScreen(),
              FavoriteScreen.routeName: (context) => const FavoriteScreen(),
              SearchScreen.routeName: (context) => const SearchScreen(),
            },
          );
        },
      ),
    );
  }
}

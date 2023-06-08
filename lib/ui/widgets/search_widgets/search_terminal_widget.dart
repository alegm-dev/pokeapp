import 'package:flutter/material.dart';
import 'package:pokeapp/models/pokemon_basic_data.dart';
import 'package:pokeapp/ui/widgets/pokemon_card_item.dart';
import 'package:pokeapp/utils/constants.dart' as constants;

class SearchedPokemonTerminalWidget extends StatelessWidget {
  final bool isDark;
  final PokemonBasicData pokemon;
  final String id;
  final String imageUrl;

  const SearchedPokemonTerminalWidget(
      {Key? key,
      required this.isDark,
      required this.pokemon,
      required this.imageUrl,
      required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
        backgroundColor: isDark
            ? constants.appBarDarkThemeColor
            : constants.appBarLightThemeColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(constants.largePadding),
        child: Column(
          children: [
            Text('Click en el pokemon para mas detalles',
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: constants.largePadding),
            SizedBox(
              width: double.infinity,
              child: PokemonCardItem(
                isDark: isDark,
                pokemon: pokemon,
                imageUrl: imageUrl,
                id: id,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

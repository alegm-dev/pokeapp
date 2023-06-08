import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokeapp/utils/colors_generator.dart';
import 'package:pokeapp/utils/constants.dart' as constants;
import 'package:pokeapp/models/pokemon_basic_data.dart';
import '../screens/pokemon_detail_screen.dart';

class PokemonCardItem extends StatefulWidget {
  final PokemonBasicData pokemon;
  final bool isDark;
  final String imageUrl;
  final String id;

  const PokemonCardItem(
      {Key? key,
      required this.isDark,
      required this.pokemon,
      required this.imageUrl,
      required this.id})
      : super(key: key);

  @override
  State<PokemonCardItem> createState() => _PokemonCardItemState();
}

class _PokemonCardItemState extends State<PokemonCardItem> {
  Color cardColor = Colors.transparent;
  late Map<String, String> getPokemonIdAndImage;
  bool colorReady = false;

  @override
  void initState() {
    generateContainerColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = widget.isDark;
    final pokemonBasicInfo = widget.pokemon;

    // update ids and imageUrls
    return GestureDetector(
      onTap: () {
        // Navigate to pokemon detail screen and pass the pokemon and card color as argument
        Navigator.of(context).pushNamed(PokemonDetailScreen.routeName,
            arguments: {
              'pokemon': pokemonBasicInfo,
              'color': cardColor,
              'imageUrl': widget.imageUrl
            });
      },
      child: Builder(builder: (context) {
        if (colorReady) {
          return Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 130.0,
                  decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Opacity(
                  opacity: 0.2,
                  child: Image.asset(
                    'assets/images/pokeball_illustrator.png',
                    width: 120.0,
                    height: 120.0,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Hero(
                    tag: pokemonBasicInfo.name,
                    child: CachedNetworkImage(
                      imageUrl: widget.imageUrl,
                      width: 165.0,
                      fit: BoxFit.cover,
                      fadeInDuration: const Duration(milliseconds: 150),
                      fadeOutDuration: const Duration(milliseconds: 150),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                bottom: 0,
                left: 10,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      child: Text(
                        widget.id,
                        style: TextStyle(
                          color: constants.pokemonIdDarkThemeColor
                              .withOpacity(0.2),
                          fontSize: 100.0,
                          //Theme.of(context).textTheme.titleLarge?.fontSize,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        pokemonBasicInfo.name,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: constants.pokemonNameLightThemeColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 35.0
                            //Theme.of(context).textTheme.titleLarge?.fontSize,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return const Center(
              child: CircularProgressIndicator(
                  color: constants.circularProgressIndicatorColor));
        }
      }),
    );
  }

  Future<void> generateContainerColor() async {
    ColorsGenerator colorsGenerator = ColorsGenerator();
    Color generatedColor =
        await colorsGenerator.generateCardColor(widget.imageUrl, widget.isDark);
    if (mounted) {
      setState(() {
        colorReady = true;
        cardColor = generatedColor;
      });
    }
  }
}

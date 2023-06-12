import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:pokeapp/controllers/pokemon_basic_controller.dart';

import 'package:pokeapp/ui/screens/home_screen.dart';
//import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "SplashScreen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    //bool isLoading = Provider.of<PokemonBasicDataController>(context).isLoading;
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () => Navigator.pushReplacementNamed(context, HomeScreen.routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Mostrar el logo giratorio mientras isLoading es true
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Colors.red.shade600,
              Colors.red.shade900,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/images/pokeball_logo.png',
                  height: 200.0,
                  width: 200.0,
                ),
                const Text(
                  "Cargando PokeApp",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            const CircularProgressIndicator(
              color: Colors.white70,
            )
          ],
        ),
      ),
    );
  }
}

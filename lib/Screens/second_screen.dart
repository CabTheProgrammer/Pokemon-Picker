import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
 final String pokemonName;
  const SecondScreen({Key? key, required this.pokemonName }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
          body: Text(pokemonName),
    ),
    );
  }
}

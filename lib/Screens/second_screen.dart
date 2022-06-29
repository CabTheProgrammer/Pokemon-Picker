import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String pokemonName;
  final int pokeHeight;
  final String pokeImageUrl;
  const SecondScreen(
      {Key? key,
      required this.pokemonName,
      required this.pokeHeight,
      required this.pokeImageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              Image(image: NetworkImage(pokeImageUrl)),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(pokemonName,
                    style: const TextStyle(
                      fontSize: 40,
                      fontFamily: "Serif",
                      fontWeight: FontWeight.w800,
                    )),
              ),
              Text("Height: $pokeHeight feet",style:const TextStyle(fontSize: 25))
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String pokemonName;
  final int pokeHeight;
  final int pokeAttack;
  final int pokeDefense;
  final String pokeImageUrl;
  final String pokeType;

  const SecondScreen(
      {Key? key,
      required this.pokemonName,
      required this.pokeHeight,
      required this.pokeImageUrl,
      required this.pokeAttack,
      required this.pokeDefense,
      required this.pokeType})
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
                        fontFamily: "upheaval",
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.8)),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Text("Height: $pokeHeight feet",
                    style: const TextStyle(fontSize: 25)),
              ),
              Row(
                children:  <Widget>[
                   Expanded(
                    child: Text(
                      'TYPE\n $pokeType',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontFamily: "Minecraft", fontSize: 18),
                    ),
                  ),
                  Expanded(
                    child: Text('ATTACK \n $pokeAttack',
                        textAlign: TextAlign.center,
                        style:
                            const TextStyle(fontFamily: "Minecraft", fontSize: 18)),
                  ),
                  Expanded(
                    child: Text('DEFENSE \n $pokeDefense',
                        textAlign: TextAlign.center,
                        style:
                            const TextStyle(fontFamily: "Minecraft", fontSize: 18)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top:20),
                child: ElevatedButton(
                    onPressed: () {}, child: const Text("Gimme a next Pokemon!")),
              )
            ],
          ),
        ),
      ),
    );
  }
}

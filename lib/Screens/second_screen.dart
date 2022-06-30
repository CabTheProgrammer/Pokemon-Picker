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
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Text("Height: $pokeHeight feet",
                    style: const TextStyle(fontSize: 25)),
              ),
              Row(
                children: const <Widget>[
                  Expanded(
                    child: Text('Type\n DEMO', textAlign: TextAlign.center),
                  ),
                  Expanded(
                    child: Text('Attack \n test',
                        textAlign: TextAlign.center),
                  ),
                  Expanded(
                    child:
                        Text('Defence \n test', textAlign: TextAlign.center),
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () {}, child: const Text("Gimme a next Pokemon!"))
            ],
          ),
        ),
      ),
    );
  }
}

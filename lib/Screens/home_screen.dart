import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quotes/Screens/second_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
                child: ElevatedButton(
      onPressed: () async {
        //Generate Random Number
        var randNum = Random().nextInt(150);

        //Making Request to PokeApi
        var url = Uri.parse('https://pokeapi.co/api/v2/pokemon/$randNum/');
        var response = await http.get(url);
        //TODO: Do some error handling with the statusCode
        // print('Response status: ${response.statusCode}');

        var data = jsonDecode(response.body);
        String pokemonName = data["forms"][0]["name"];
        int pokeHeight = data["height"];
        String pokeImageUrl =
            data["sprites"]["other"]["official-artwork"]["front_default"];

        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SecondScreen(
                  pokemonName: pokemonName,
                  pokeHeight: pokeHeight,
                  pokeImageUrl: pokeImageUrl,
                )));
      },
      child: const Text(
        "Get that Pokemon!",
        style: TextStyle(fontSize: 25),
      ),
    ))));
  }
}

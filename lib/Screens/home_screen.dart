import 'dart:io';
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

        try {
          var url = Uri.parse('https://pokeapi.co/api/v2/pokemon/$randNum/');
          var response = await http.get(url);

          if (response.statusCode == 200) {
            var data = jsonDecode(response.body);
            String pokemonName = data["forms"][0]["name"];
            int pokeHeight = data["height"];
            String pokeImageUrl =
                data["sprites"]["other"]["official-artwork"]["front_default"];
            int pokeAttack = data["stats"][1]["base_stat"];
            int pokeDefense = data["stats"][2]["base_stat"];
            String pokeType = data["types"][0]["type"]["name"];
            pokeType = pokeType.toUpperCase();

            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SecondScreen(
                      pokeType: pokeType,
                      pokeDefense: pokeDefense,
                      pokeAttack: pokeAttack,
                      pokemonName: pokemonName,
                      pokeHeight: pokeHeight,
                      pokeImageUrl: pokeImageUrl,
                    )));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(response.statusCode.toString()),
            ));
          }
        } on SocketException {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
                "Please check your internet connection and try again later"),
          ));
        }
      },
      child: const Text(
        "Get that Pokemon!",
        style: TextStyle(fontSize: 25),
      ),
    ))));
  }
}

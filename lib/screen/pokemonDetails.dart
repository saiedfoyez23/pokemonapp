import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pokemonapp/controllers/pokemon.dart';
import 'package:pokemonapp/models/pokemon_list.dart';

class pokemonDetails extends StatefulWidget {
  const pokemonDetails({super.key,this.Id,this.Name});
  final String? Id;
  final String? Name;

  @override
  State<pokemonDetails> createState() => _pokemonDetailsState();
}

class _pokemonDetailsState extends State<pokemonDetails> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Pokemons().pokemonDetails(context, widget.Id!, widget.Name!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Pokemon Details"),
      ),
    );
  }
}
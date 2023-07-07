import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemonapp/models/pokemon_details.dart';
import 'package:pokemonapp/screen/pokemonDetails.dart';
import 'package:pokemonapp/screen/pokemonDetails.dart';

import '../models/pokemon_list.dart';


class Pokemons{

  String baseURL = "https://graphql-pokemon2.vercel.app/";
  
  Future<List<Pokemon>?> pokemonList(BuildContext context) async {
    String pokemonListQuery = r''' 
    query{
      pokemons(first: 500){
        id,
        weight{
          minimum,
          maximum,
        },
        height{
          minimum,
          maximum,
        },
        name,
        classification,
        image,
      }
    }''';
    
    final response = await http.post(
    Uri.parse('${baseURL}'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, dynamic>{
      "query": pokemonListQuery,
    }),
  );
  
  print("${jsonDecode(response.body)}");
   

   if(response.statusCode > 200){
     ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Error code : ${response.statusCode}"
        )
      )
     );
   }else{
    Map<String,dynamic> data = jsonDecode(response.body);
    List<dynamic> list = data["data"]["pokemons"];
    return list.map((e) => Pokemon.fromJson(e)).toList();
   }
  
  }


  Future<List<Pokamondetails>?> pokemonDetails(BuildContext context,String id,String name) async {
    String pokemonListQuery = r''' 
    query{
      pokemon(id: "UG9rZW1vbjowMDE=", name:"Bulbasaur"){
        id,
        number,
        weight{
          minimum,
          maximum,
        },
        height{
          minimum,
          maximum,
        },
        name,
        classification,
        image,
        types,
        resistant,
        attacks{
          fast{
            name,
            type,
            damage,
          },
          special{
            name,
            type,
            damage,
          },
        },
        weaknesses,
        fleeRate,
        maxCP,
        maxHP,
      }
     }''';
    
    final response = await http.post(
    Uri.parse('${baseURL}'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, dynamic>{
      "query": pokemonListQuery,
    }),
  );
  
  print("${jsonDecode(response.body)}");
   

   if(response.statusCode > 200){
     ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Error code : ${response.statusCode}"
        )
      )
     );
   }else{
    print("${jsonDecode(response.body)}");
    Map<String,dynamic> data = jsonDecode(response.body);
   }
  
  }

  
}
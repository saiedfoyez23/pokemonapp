import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:pokemonapp/controllers/pokemon.dart';
import 'package:pokemonapp/models/pokemon_list.dart';
import 'package:pokemonapp/screen/pokemonDetails.dart';

import '../controllers/text_controller.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      body: CustomScrollView(
        slivers: [

          SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,),
                  child: Container(
                    height: MediaQuery.of(context).size.height/15,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 30),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            SystemNavigator.pop();
                          },
                          icon: ImageIcon(
                            AssetImage("images/Back_Icon.png"),
                            size: 20,
                            color: Color.fromRGBO(17, 37, 46, 1),
                          ),
                        ),
                        SizedBox(width: 15,),
                        Text(
                          "Pokemon Lists",
                          style: TextController().myStyle(
                            size: 20,
                            color: Color.fromRGBO(17, 37, 46, 1),
                            fs: FontStyle.normal,
                            fw: FontWeight.w400,
                          ),
                        ),

                      ],
                    ),
                  ),
                )
            ),

            SliverFillRemaining(
              child: FutureBuilder<List<Pokemon>?>(
                future: Pokemons().pokemonList(context),
                builder: (BuildContext context,snapshot){
                  if(snapshot.hasData){
                    return GridView.builder(
                       itemCount: snapshot.data!.length,
                       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 3/3,
                      ),
                      itemBuilder: (BuildContext context,int index){
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: InkWell(
                            onTap: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>pokemonDetails(Id: snapshot.data![index].id,Name: snapshot.data![index].name,)));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(236, 236, 236, 1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height:  MediaQuery.of(context).size.height/3.6,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage("${snapshot.data![index].image}"),
                                        fit: BoxFit.fill
                                      ),
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
                                    ),
                                  ),
                                  Container(
                                    height:  MediaQuery.of(context).size.height/4.4,
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
                                    ),
                                    child: RichText(
                                      text: TextSpan(
                                        text: "Name : ",
                                        style: TextController().myStyle(
                                          size: 20,
                                          color: Color.fromRGBO(17, 37, 46, 1),
                                          fs: FontStyle.normal,
                                          fw: FontWeight.w400,
                                        ),
                                        children:[
                                        TextSpan(text: "${snapshot.data![index].name}\n",
                                        style: TextController().myStyle(
                                          size: 20,
                                          color: Color.fromRGBO(17, 37, 46, 1),
                                          fs: FontStyle.normal,
                                          fw: FontWeight.w700,
                                        ),),
                                        TextSpan(text: "Weight : ",
                                        style: TextController().myStyle(
                                          size: 20,
                                          color: Color.fromRGBO(17, 37, 46, 1),
                                          fs: FontStyle.normal,
                                          fw: FontWeight.w400,
                                        ),),
                                        TextSpan(text: "${snapshot.data![index].weight!.minimum} - ${snapshot.data![index].weight!.maximum}\n",
                                        style: TextController().myStyle(
                                          size: 20,
                                          color: Color.fromRGBO(17, 37, 46, 1),
                                          fs: FontStyle.normal,
                                          fw: FontWeight.w700,
                                        ),),
                                        TextSpan(text: "Height : ",
                                        style: TextController().myStyle(
                                          size: 20,
                                          color: Color.fromRGBO(17, 37, 46, 1),
                                          fs: FontStyle.normal,
                                          fw: FontWeight.w400,
                                        ),),
                                        TextSpan(text: "${snapshot.data![index].height!.minimum} - ${snapshot.data![index].height!.maximum}\n",
                                        style: TextController().myStyle(
                                          size: 20,
                                          color: Color.fromRGBO(17, 37, 46, 1),
                                          fs: FontStyle.normal,
                                          fw: FontWeight.w700,
                                        ),),
                                        TextSpan(text: "Classification : ",
                                        style: TextController().myStyle(
                                          size: 20,
                                          color: Color.fromRGBO(17, 37, 46, 1),
                                          fs: FontStyle.normal,
                                          fw: FontWeight.w400,
                                        ),),
                                        TextSpan(text: "${snapshot.data![index].classification}\n",
                                        style: TextController().myStyle(
                                          size: 20,
                                          color: Color.fromRGBO(17, 37, 46, 1),
                                          fs: FontStyle.normal,
                                          fw: FontWeight.w700,
                                        ),),
                                        ]
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    );
                  }else{
                    return const Center(child: CircularProgressIndicator(color: Color.fromRGBO(234, 10, 120, 1),),);
                  }
                }
              ),
            ),
        ],
      )
    );
  }
}
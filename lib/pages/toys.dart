import 'package:flutter/material.dart';
import 'package:pet_store/models/pokemon.dart';
import 'package:pet_store/models/toys_model.dart';
import 'package:pet_store/service/graphql_service.dart';

class ToysPage extends StatefulWidget {
  ToysPage({super.key});

  @override
  State<ToysPage> createState() => _ToysPageState();
}

class _ToysPageState extends State<ToysPage> {
  GraphqlService graphqlService = GraphqlService();

  List<ToysModel> toys = [];

  void getToys() {
    toys = ToysModel.getToys();
  }

  List<PokemonModel>? pokemon;

  @override
  initState() {
    super.initState();
    _load();
  }

  void _load() async {
    pokemon = null;
    pokemon = await graphqlService.getPokemon();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    toys = ToysModel.getToys();

    return Scaffold(
      appBar: appBar(context),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20.0),
              child: Text(
                'Toys',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            toysSection(context),
          ],
        ),
      ),
    );
  }

  Column toysSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height - kToolbarHeight - 40,
          child: ListView.builder(
            itemCount: toys.length,
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (toys[index].name == 'Charmander plush') {
                    showPokemonStats(context);
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: AssetImage(toys[index].imgPath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              toys[index].name,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '\$${toys[index].price}',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${toys[index].rating} stars',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      title: Text('Pet Store'),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0.5,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
    );
  }

  void showPokemonStats(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pokemon Stats'),
          content: pokemon == null
                  ? Center(child: CircularProgressIndicator())
                  : pokemon!.isEmpty
                      ? Text('No data')
                      : Wrap(
                          children: pokemon!.map((p) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Divider(),
                                Text('Name: ${p.name.toUpperCase()}'),
                                Text('Weight: ${p.weight}'),
                                Text('Height: ${p.height}'),
                                Text('Base Experience: ${p.baseExperience}'),
                                Text('Order: ${p.order}'),
                                Text('Pokemon Species ID: ${p.pokemonSpeciesId}'),
                              ],
                            );
                          }).toList(),
                        ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

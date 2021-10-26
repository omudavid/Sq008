import 'package:flutter/material.dart';
import 'package:flutter_class/providers/pokemon_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_class/repository/DBProvider.dart';
import 'package:flutter_class/repository/student.dart';
import 'dart:developer';

class DatabaseTest extends StatefulWidget {
  const DatabaseTest({Key? key}) : super(key: key);

  @override
  State<DatabaseTest> createState() => _DatabaseTestState();
}

class _DatabaseTestState extends State<DatabaseTest> {
  @override
  void initState() {
    //var david = Provider.of<PokemonProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Database'),
      ),
      body: Consumer<PokemonProvider>(
        builder: (context, provider, child) {
          var list = provider.pokemons;
          return ListView.builder(
            itemBuilder: (context, index) => Column(
              children: [
                Text('${list[index].name}'),
                Text('${list[index].url}'),
              ],
            ),
            itemCount: list.length,
          );
        },
      ),
    );
  }
}

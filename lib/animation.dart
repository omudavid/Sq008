import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_class/pokemon_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';

class AnimationTest extends StatefulWidget {
  const AnimationTest({Key? key}) : super(key: key);

  @override
  _AnimationTestState createState() => _AnimationTestState();
}

class _AnimationTestState extends State<AnimationTest>
    with SingleTickerProviderStateMixin {
  late Animation<num> animation;
  late AnimationController controller;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));

    animation = Tween(begin: 0.0, end: 400).animate(controller);

    animation.addListener(() {
      setState(() {});

      ///changes based on the state of the widget
    });

    controller.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  addToPreferences();
                },
                child: const Text('Add User'),
              ),
              TextButton(
                onPressed: retrievePreferences,
                child: const Text('Retrieve User'),
              ),
              TextButton(
                onPressed: makeNetworkCall,
                child: const Text('Make Network call'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addToPreferences() async {
    var prefs = await SharedPreferences.getInstance();

    await prefs.setString('User', 'David');
  }

  Future<void> retrievePreferences() async {
    var prefs = await SharedPreferences.getInstance();

    var user = prefs.getString('User');

    log('$user');
  }

  Future<void> makeNetworkCall() async {
    var _dio = Dio();
    await _dio.get('https://pokeapi.co/api/v2/pokemon',
        queryParameters: {'limit': 40, 'offset': 0}).then((response) {
      var data = PokemonResponse.fromJson(response.data);
      log('${data.results!.length}');
    }).catchError((e) {});
    // var response = await _dio.get('https://pokeapi.co/api/v2/pokemon');
    // log('${response.data}');
  }
}

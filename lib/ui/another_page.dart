import 'dart:io';
import 'dart:developer';
import 'package:flutter/material.dart';

import '../main.dart';

class PokemonPage extends StatefulWidget {
  const PokemonPage({Key? key}) : super(key: key);

  @override
  _PokemonPageState createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  final List<String> names = ['James', 'John'];
  final controller = ScrollController();
  final formKey = GlobalKey<FormState>();
  String? name;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our App'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              obscureText: true,
              onSaved: (val) {
                setState(() {});
              },
              validator: (val) {
                if (val!.isNotEmpty) {
                  return null;
                }
                return 'Field is Required';
              },
            ),
            TextFormField(
              obscureText: true,
              onSaved: (val) {
                setState(() {});
              },
              validator: (val) {
                if (val!.isNotEmpty) {
                  return null;
                }
                return 'Field is Required';
              },
            ),
          ],
        ),
      ),
      // bottomNavigationBar: SafeArea(child: Text('App Bar Widget')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            // formKey.currentState!.reset();
          }
          //Navigator.pushNamed(context, '/myHomePage');
          // Navigator.pop(context);
        },
      ),
    );
  }

  Future<String> giveNumber(String param1, String param2) async {
    await Future.delayed(const Duration(seconds: 3));
    return '2 $param1';
  }

  Future<void> stuff() async {
    var myString = await giveNumber('param1', 'param2');
    log(myString);

    streamNumbers().listen((event) {});
  }

  Stream<int> streamNumbers() async* {
    for (int i = 0; i < 100; i++) {
      await Future.delayed(const Duration(seconds: 3));
      yield i;
    }
  }
}

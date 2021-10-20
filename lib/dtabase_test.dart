import 'package:flutter/material.dart';
import 'package:flutter_class/DBProvider.dart';
import 'package:flutter_class/student.dart';
import 'dart:developer';

class DatabaseTest extends StatelessWidget {
  const DatabaseTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Database'),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () async {
                var response =
                    await DBProvider.db.addToDatabase(Student('1', 'John Doe'));
                log('$response');
              },
              child: const Text('Write to Database')),

          ///
          TextButton(
              onPressed: () async {
                var response = await DBProvider.db.getStudents();
                log('$response');
              },
              child: const Text('Read from Database')),
        ],
      ),
    );
  }
}

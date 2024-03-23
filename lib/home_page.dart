import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'hive_localdatabase/services/database_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final DatabaseService dbService = DatabaseService();
  final _myBox = Hive.box('mybox');

  //write data
  void writeData() {
    _myBox.put('name', 'John Doe');
    _myBox.put('age', 25);
    _myBox.put('height', 1.75);
  }

  //read data
  void readData() {
    print(_myBox.get('name'));
    print(_myBox.get('age'));
    print(_myBox.get('height'));
  }

  //delete data
  void deleteData() {
    _myBox.delete('name');
    _myBox.delete('age');
    _myBox.delete('height');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD Operations'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('CRUD Operations'),
                content: Text('Select an operation to perform'),
                actions: <Widget>[
                  TextButton(
                    child: Text('Close'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.message),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            MaterialButton(
              onPressed: () async {
                writeData();
              },
              child: Text('Create'),
              color: Color.fromARGB(255, 78, 139, 189),
            ),
            MaterialButton(
              onPressed: () async {
                readData();
              },
              child: Text('Read'),
              color: Color.fromARGB(255, 78, 139, 189),
            ),
            MaterialButton(
              onPressed: () async {
                //updateData();
              },
              child: Text('Update'),
              color: Color.fromARGB(255, 78, 139, 189),
            ),
            MaterialButton(
              onPressed: () async {
                deleteData();
              },
              child: Text('Delete'),
              color: Color.fromARGB(255, 78, 139, 189),
            ),
          ],
        ),
      ),
    );
  }
}

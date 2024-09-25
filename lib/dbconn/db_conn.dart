import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class LiftTrackDatabase extends StatefulWidget {
  @override
  _LiftTrackDatabaseState createState() => _LiftTrackDatabaseState();
}

class _LiftTrackDatabaseState extends State<LiftTrackDatabase> {
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:your_project_path/dataTemplate/user_data.dart';

class LiftTrackDatabase extends StatefulWidget {
  @override
  _LiftTrackDatabaseState createState() => _LiftTrackDatabaseState();
}

class _LiftTrackDatabaseState extends State<LiftTrackDatabase> {
  final databaseRef = FirebaseDatabase.instance.ref();
  final TextEditingController _controller = TextEditingController();
  late DatabaseReference itemsRef;

  @override
  void initState() {
    super.initState();
    itemsRef = databaseRef.child('items');
  }

  // Method to add data
  Future<void> addItem(User user) async {
    final newItem = itemsRef.push();
    await newItem.set(user.toJson());
    _controller.clear();
  }

  // Method to update data
  Future<void> updateItem(String key, User user) async {
    await itemsRef.child(key).update(user.toJson());
  }

  // Method to delete data
  Future<void> deleteItem(String key) async {
    await itemsRef.child(key).remove();
  }
}
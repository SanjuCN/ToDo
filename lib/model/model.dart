import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
 part 'model.g.dart';

@HiveType(typeId: 1)
class NoteModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final Color color;

  NoteModel(
      {required this.color,
      required this.title,
      required this.description,
      required this.date});

  void add(List<NoteModel> noteModel) {}
}

List<Color> color = [
  Colors.grey.withOpacity(0.3),
  Colors.red,
  Colors.yellow,
  Colors.green,
  Colors.cyan,
  Colors.orange,
  Colors.deepPurpleAccent
];
List<NoteModel> noteModel = [];

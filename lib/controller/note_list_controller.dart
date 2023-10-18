import 'package:hive_flutter/adapters.dart';
import 'package:title/model/model.dart';

class NoteController {
  final Box<NoteModel> _notesBox = Hive.box<NoteModel>('notes');
// load the data from database
  Future<List<NoteModel>> getNotes() async {
    return _notesBox.values.toList();
  }

// add data to database
  Future<void> addNote(NoteModel note) async {
    await _notesBox.add(note);
  }

// edit the saved datas
  Future<void> editNote(int index, NoteModel updatedNote) async {
    await _notesBox.putAt(index, updatedNote);
  }

// delete the saved datas
  Future<void> deleteNote(int index) async {
    await _notesBox.deleteAt(index);
  }
}

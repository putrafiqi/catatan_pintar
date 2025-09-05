import 'package:catatan_pintar/data/data.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract interface class NoteLocalDataSource {
  Future<List<NoteModel>> getAllNote();
  Future<void> addNote({
    required String title,
    String? content,
    String? folderName,
  });
  Future<void> deleteNote({required String id});
  Future<void> updateNote({
    required String id,
    String? title,
    String? content,
    String? folderName,
  });
}

class NoteLocalDataSourceImpl implements NoteLocalDataSource {
  final Box<NoteModel> _noteBox;

  const NoteLocalDataSourceImpl(this._noteBox);

  @override
  Future<void> addNote({
    required String title,
    String? content,
    String? folderName,
  }) async {
    final newNote = NoteModel(
      title: title,
      content: content,
      folderName: folderName,
    );
    _noteBox.put(newNote.id, newNote);
  }

  @override
  Future<void> deleteNote({required String id}) async {
    _noteBox.delete(id);
  }

  @override
  Future<List<NoteModel>> getAllNote() async {
    return _noteBox.values.toList();
  }

  @override
  Future<void> updateNote({
    required String id,
    String? title,
    String? content,
    String? folderName,
  }) async {
    final note = _noteBox
        .get(id)
        ?.copyWith(title: title, content: content, folderName: folderName);
    if (note != null) {
      _noteBox.put(id, note);
    }
  }
}

import 'package:catatan_pintar/data/data.dart'
    show NoteLocalDataSource, NoteModel;

class NoteRepository {
  final NoteLocalDataSource _localDataSource;

  const NoteRepository(this._localDataSource);

  void addNote({
    required String title,
    String? content,
    String? folderName,
  }) async {
    await _localDataSource.addNote(
      title: title,
      content: content,
      folderName: folderName,
    );
  }

  void deleteNote({required String id}) async {
    await _localDataSource.deleteNote(id: id);
  }

  Future<List<NoteModel>> getAllNote() async {
    return _localDataSource.getAllNote();
  }

  Future<void> updateNote({
    required String id,
    String? title,
    String? content,
    String? folderName,
  }) async {
    await _localDataSource.updateNote(
      id: id,
      title: title,
      content: content,
      folderName: folderName,
    );
  }
}

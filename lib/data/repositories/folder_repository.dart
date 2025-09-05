import 'package:catatan_pintar/data/data.dart'
    show FolderLocalDataSource, FolderModel;

class FolderRepository {
  final FolderLocalDataSource _localDataSource;

  const FolderRepository(this._localDataSource);

  void addFolder({required String name}) async {
    await _localDataSource.addFolder(name: name);
  }

  void deleteFolder({required String id}) async {
    await _localDataSource.deleteFolder(id: id);
  }

  Future<List<FolderModel>> getAllFolder() async {
    return _localDataSource.getAllFolder();
  }

  Future<void> updateFolder({
    required String id,
    required String newName,
  }) async {
    await _localDataSource.updateFolder(id: id, newName: newName);
  }
}

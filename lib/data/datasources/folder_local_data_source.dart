import 'package:catatan_pintar/data/data.dart' show FolderModel;
import 'package:hive_flutter/hive_flutter.dart';

abstract interface class FolderLocalDataSource {
  Future<List<FolderModel>> getAllFolder();
  Future<void> addFolder({required String name});
  Future<void> deleteFolder({required String id});
  Future<void> updateFolder({required String id, required String newName});
}

class FolderLocalDataSourceImpl implements FolderLocalDataSource {
  final Box<FolderModel> _folderBox;

  FolderLocalDataSourceImpl(this._folderBox);

  @override
  Future<void> addFolder({required String name}) async {
    final newFolder = FolderModel(name: name);
    _folderBox.put(newFolder.id, newFolder);
  }

  @override
  Future<void> deleteFolder({required String id}) async {
    _folderBox.delete(id);
  }

  @override
  Future<List<FolderModel>> getAllFolder() async {
    return _folderBox.values.toList();
  }

  @override
  Future<void> updateFolder({
    required String id,
    required String newName,
  }) async {
    final foldel = _folderBox.get(id)?.copyWith(name: newName);

    if (foldel != null) {
      _folderBox.put(id, foldel);
    }
  }
}

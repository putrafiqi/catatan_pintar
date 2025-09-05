import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

part 'folder_model.g.dart';

@HiveType(typeId: 0)
class FolderModel extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;

  FolderModel({String? id, required this.name})
    : assert(id == null || id.isNotEmpty, 'id must be null or not empty'),
      id = id ?? Uuid().v4();

  FolderModel copyWith({String? id, String? name}) =>
      FolderModel(id: id ?? this.id, name: name ?? this.name);

  @override
  List<Object> get props => [id, name];
}

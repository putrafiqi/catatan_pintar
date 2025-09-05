import 'package:equatable/equatable.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

part 'note_model.g.dart';

@HiveType(typeId: 1)
class NoteModel extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String? content;
  @HiveField(3)
  final String? folderName;

  NoteModel({String? id, required this.title, this.content, this.folderName})
    : assert(id == null || id.isNotEmpty, 'id must be null or not empty'),
      id = id ?? Uuid().v4();

  NoteModel copyWith({
    String? id,
    String? title,
    String? content,
    String? folderName,
  }) => NoteModel(
    id: id ?? this.id,
    title: title ?? this.title,
    content: content ?? this.content,
    folderName: folderName ?? this.folderName,
  );
  @override
  List<Object?> get props => [id, title, content, folderName];
}

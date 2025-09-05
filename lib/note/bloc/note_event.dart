part of 'note_bloc.dart';

sealed class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object> get props => [];
}

final class NoteRequested extends NoteEvent {}

final class AddNotePressed extends NoteEvent {
  final String title;
  final String? content;
  final String? folderName;

  const AddNotePressed(this.title, this.content, this.folderName);

  @override
  List<Object> get props => [title];
}

final class DeleteNotePressed extends NoteEvent {
  final String id;

  const DeleteNotePressed(this.id);

  @override
  List<Object> get props => [id];
}

final class UpdateNotePressed extends NoteEvent {
  final String id;
  final String? title;
  final String? content;
  final String? folderName;

  const UpdateNotePressed(this.id, this.title, this.content, this.folderName);

  @override
  List<Object> get props => [id];
}

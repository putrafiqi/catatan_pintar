part of 'folder_bloc.dart';

final class FolderEvent extends Equatable {
  const FolderEvent();

  @override
  List<Object> get props => [];
}

final class FolderRequested extends FolderEvent {}

final class AddFolderPressed extends FolderEvent {
  final String name;

  const AddFolderPressed(this.name);

  @override
  List<Object> get props => [name];
}

final class DeleteFolderPressed extends FolderEvent {
  final String id;

  const DeleteFolderPressed(this.id);

  @override
  List<Object> get props => [id];
}

final class UpdateFolderPressed extends FolderEvent {
  final String id;
  final String newName;

  const UpdateFolderPressed(this.id, this.newName);

  @override
  List<Object> get props => [id, newName];
}

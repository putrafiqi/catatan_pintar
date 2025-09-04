part of 'folder_bloc.dart';

enum FolderStateStatus { initial, loading, loaded, failure }

final class FolderState extends Equatable {
  final FolderStateStatus status;
  final String? errorMessage;
  final List<FolderModel> folders;
  const FolderState({
    this.status = FolderStateStatus.initial,
    this.folders = const [],
    this.errorMessage,
  });

  FolderState copyWith({
    FolderStateStatus? status,
    List<FolderModel>? folders,
    String? errorMessage,
  }) => FolderState(
    errorMessage: errorMessage ?? this.errorMessage,
    folders: folders ?? this.folders,
    status: status ?? this.status,
  );

  @override
  List<Object> get props => [status, folders];
}

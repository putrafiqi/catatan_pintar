part of 'filter_folder_bloc.dart';

final class FilterFolderEvent extends Equatable {
  const FilterFolderEvent();

  @override
  List<Object> get props => [];
}

final class FilterFolderPressed extends FilterFolderEvent {
  final String name;

  const FilterFolderPressed(this.name);

  @override
  List<Object> get props => [name];
}

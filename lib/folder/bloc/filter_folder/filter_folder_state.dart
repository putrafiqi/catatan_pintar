part of 'filter_folder_bloc.dart';

final class FilterFolderState extends Equatable {
  final String selectedFolderName;
  const FilterFolderState({this.selectedFolderName = "Semua"});

  FilterFolderState copyWith({String? selectedFolderName}) {
    return FilterFolderState(
      selectedFolderName: selectedFolderName ?? this.selectedFolderName,
    );
  }

  @override
  List<Object> get props => [selectedFolderName];
}

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'filter_folder_event.dart';
part 'filter_folder_state.dart';

class FilterFolderBloc extends Bloc<FilterFolderEvent, FilterFolderState> {
  FilterFolderBloc() : super(FilterFolderState()) {
    on<FilterFolderPressed>((event, emit) {
      emit(state.copyWith(selectedFolderName: event.name));
    });
  }
}

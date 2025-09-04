import 'package:catatan_pintar/data/data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'folder_event.dart';
part 'folder_state.dart';

class FolderBloc extends Bloc<FolderEvent, FolderState> {
  final FolderRepository _folderRepository;
  FolderBloc(this._folderRepository) : super(FolderState()) {
    on<FolderRequested>((event, emit) async {
      emit(state.copyWith(status: FolderStateStatus.loading));
      try {
        final folders = await _folderRepository.getAllFolder();
        emit(
          state.copyWith(folders: folders, status: FolderStateStatus.loaded),
        );
      } catch (_) {
        emit(
          state.copyWith(
            status: FolderStateStatus.failure,
            errorMessage: 'Terjadi Kesalahan',
          ),
        );
      }
    });
    on<AddFolderPressed>((event, emit) async {
      emit(state.copyWith(status: FolderStateStatus.loading));
      try {
        _folderRepository.addFolder(name: event.name);
        final folders = await _folderRepository.getAllFolder();
        emit(
          state.copyWith(folders: folders, status: FolderStateStatus.loaded),
        );
      } catch (_) {
        emit(
          state.copyWith(
            status: FolderStateStatus.failure,
            errorMessage: 'Terjadi Kesalahan',
          ),
        );
      }
    });
    on<DeleteFolderPressed>((event, emit) async {
      emit(state.copyWith(status: FolderStateStatus.loading));
      try {
        _folderRepository.deleteFolder(id: event.id);
        final folders = await _folderRepository.getAllFolder();
        emit(
          state.copyWith(folders: folders, status: FolderStateStatus.loaded),
        );
      } catch (_) {
        emit(
          state.copyWith(
            status: FolderStateStatus.failure,
            errorMessage: 'Terjadi Kesalahan',
          ),
        );
      }
    });
  }
}

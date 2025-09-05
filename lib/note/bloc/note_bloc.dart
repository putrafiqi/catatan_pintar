import 'package:catatan_pintar/data/data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final NoteRepository _noteRepository;
  NoteBloc(this._noteRepository) : super(NoteState()) {
    on<NoteRequested>((event, emit) async {
      emit(state.copyWith(status: NoteStateStatus.loading));
      try {
        final notes = await _noteRepository.getAllNote();
        emit(state.copyWith(status: NoteStateStatus.loaded, notes: notes));
      } catch (_) {
        emit(
          state.copyWith(
            status: NoteStateStatus.failure,
            errorMessage: 'Terjadi Kesalahan',
          ),
        );
      }
    });
  }
}

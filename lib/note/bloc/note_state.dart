part of 'note_bloc.dart';

enum NoteStateStatus { initial, loading, loaded, failure }

final class NoteState extends Equatable {
  final NoteStateStatus status;
  final List<NoteModel> notes;
  final String? errorMessage;

  const NoteState({
    this.status = NoteStateStatus.initial,
    this.notes = const [],
    this.errorMessage,
  });

  NoteState copyWith({
    NoteStateStatus? status,
    List<NoteModel>? notes,
    String? errorMessage,
  }) => NoteState(
    errorMessage: errorMessage ?? this.errorMessage,
    notes: notes ?? this.notes,
    status: status ?? this.status,
  );

  @override
  List<Object> get props => [status, notes];
}

import 'package:catatan_pintar/note/note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ListNote extends StatelessWidget {
  const ListNote({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteBloc, NoteState>(
      builder: (context, state) {
        if (state.status == NoteStateStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.notes.isEmpty) {
          return const Center(child: Text('Belum ada note'));
        }
        return Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              final note = state.notes[index];
              return ListTile(
                key: ValueKey(note.id),
                title: Text(note.title),
                subtitle: Text(note.content ?? '-'),
              );
            },
            separatorBuilder: (context, index) => const Gap(4),
            itemCount: state.notes.length,
          ),
        );
      },
    );
  }
}

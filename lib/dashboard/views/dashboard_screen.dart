import 'package:catatan_pintar/data/data.dart';
import 'package:catatan_pintar/folder/folder.dart';
import 'package:catatan_pintar/note/note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  FilterFolderBloc()..add(FilterFolderPressed('Semua')),
        ),
        BlocProvider(
          create: (context) {
            final folderRepository = context.read<FolderRepository>();
            return FolderBloc(folderRepository)..add(FolderRequested());
          },
        ),
        BlocProvider(
          create: (context) {
            final noteRepository = context.read<NoteRepository>();
            return NoteBloc(noteRepository)..add(NoteRequested());
          },
        ),
      ],
      child: const DashboardView(),
    );
  }
}

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(LucideIcons.settings)),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SearchNotesField(),
          const Gap(16),
          FilterFolder(),
          const Gap(16),

          //TODO: Add Note List
          const ListNote(),
          const Gap(16),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(LucideIcons.plus),
      ),
    );
  }
}

class SearchNotesField extends StatelessWidget {
  const SearchNotesField({super.key, bool? enabled})
    : enabled = enabled ?? true;

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextField(
        enabled: enabled,
        onTap: () {},
        decoration: InputDecoration(
          hintText: 'Cari Catatan',
          hintStyle: textTheme.labelLarge!.copyWith(color: Colors.grey),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}

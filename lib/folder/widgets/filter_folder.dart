import 'package:catatan_pintar/folder/folder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class FilterFolder extends StatelessWidget {
  const FilterFolder({super.key, this.selectedFolder});

  final String? selectedFolder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: BlocBuilder<FolderBloc, FolderState>(
          builder: (context, state) {
            if (state.status == FolderStateStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.separated(
              separatorBuilder: (context, index) => const Gap(4),
              scrollDirection: Axis.horizontal,
              itemCount: state.folders.length + 2,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return BlocBuilder<FilterFolderBloc, FilterFolderState>(
                    builder: (context, state) {
                      return ChoiceChip(
                        label: const Text('Semua'),
                        selected:
                            state.selectedFolderName == 'Semua' ? true : false,
                        onSelected:
                            (value) => context.read<FilterFolderBloc>().add(
                              FilterFolderPressed('Semua'),
                            ),
                      );
                    },
                  );
                }
                if (index == (state.folders.length + 1)) {
                  return IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) => BlocProvider.value(
                                value: context.read<FolderBloc>(),
                                child: const FolderScreen(),
                              ),
                        ),
                      );
                    },
                    icon: const Icon(LucideIcons.folderPlus),
                  );
                }
                final folder = state.folders[index - 1];

                return BlocBuilder<FilterFolderBloc, FilterFolderState>(
                  builder: (context, state) {
                    return ChoiceChip(
                      label: Text(folder.name),
                      selected:
                          state.selectedFolderName == folder.name
                              ? true
                              : false,
                      onSelected:
                          (value) => context.read<FilterFolderBloc>().add(
                            FilterFolderPressed(folder.name),
                          ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}

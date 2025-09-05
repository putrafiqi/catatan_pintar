import 'package:catatan_pintar/folder/folder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class FolderScreen extends StatefulWidget {
  const FolderScreen({super.key});

  @override
  State<FolderScreen> createState() => _FolderScreenState();
}

class _FolderScreenState extends State<FolderScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Folder'), centerTitle: true),
      body: BlocBuilder<FolderBloc, FolderState>(
        builder: (context, state) {
          if (state.status == FolderStateStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.folders.isEmpty) {
            return const Center(child: Text('Belum ada Folder'));
          }

          return ListView.separated(
            itemBuilder: (context, index) {
              final folder = state.folders[index];
              return ListTile(
                key: ValueKey(folder.id),
                title: Text(folder.name),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.read<FolderBloc>().add(
                          DeleteFolderPressed(folder.id),
                        );
                      },
                      icon: const Icon(LucideIcons.trash, size: 20),
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder:
                              (_) => BlocProvider.value(
                                value: context.read<FolderBloc>(),
                                child: AlertDialog(
                                  title: const Text('Nama Baru Folder'),

                                  content: Form(
                                    key: formKey,
                                    child: TextFormField(
                                      controller:
                                          nameController..text = folder.name,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Nama folder tidak boleh kosong';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Batal'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          context.read<FolderBloc>().add(
                                            UpdateFolderPressed(
                                              folder.id,
                                              nameController.text,
                                            ),
                                          );
                                          nameController.clear();
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: const Text('Simpan'),
                                    ),
                                  ],
                                ),
                              ),
                        );
                      },
                      icon: const Icon(LucideIcons.pen, size: 20),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const Gap(4),
            itemCount: state.folders.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder:
                (_) => BlocProvider.value(
                  value: context.read<FolderBloc>(),
                  child: AlertDialog(
                    title: const Text('Nama Folder'),
                    content: Form(
                      key: formKey,
                      child: TextFormField(
                        controller: nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nama folder tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Batal'),
                      ),
                      TextButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<FolderBloc>().add(
                              AddFolderPressed(nameController.text),
                            );
                            nameController.clear();
                            Navigator.pop(context);
                          }
                        },
                        child: const Text('Simpan'),
                      ),
                    ],
                  ),
                ),
          );
        },
        child: const Icon(LucideIcons.plus),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    formKey.currentState?.dispose();
    super.dispose();
  }
}

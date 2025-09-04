import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashboardView();
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
          SizedBox(
            height: 40,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView.separated(
                separatorBuilder: (context, index) => const Gap(4),
                scrollDirection: Axis.horizontal,
                itemCount: 10 + 2,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return ChoiceChip(
                      label: const Text('Semua'),
                      selected: selectedIndex == index ? true : false,
                      onSelected:
                          (value) => setState(() {
                            selectedIndex = index;
                          }),
                    );
                  }
                  if (index == 11) {
                    return IconButton(
                      onPressed: () {},
                      icon: const Icon(LucideIcons.folderPlus),
                    );
                  }
                  return ChoiceChip(
                    label: Text('$index'),
                    selected: selectedIndex == index ? true : false,
                    onSelected:
                        (value) => setState(() {
                          selectedIndex = index;
                        }),
                  );
                },
              ),
            ),
          ),

          const Gap(16),

          //TODO: Add Note List
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

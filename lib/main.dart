import 'package:catatan_pintar/dashboard/dashboard.dart';
import 'package:catatan_pintar/data/data.dart';
import 'package:catatan_pintar/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();
  await Hive.initFlutter();
  Hive.registerAdapter<FolderModel>(FolderModelAdapter());
  final folderBox = await Hive.openBox<FolderModel>('folders');
  runApp(App(pref: pref, folderBox: folderBox));
}

class App extends StatelessWidget {
  const App({super.key, required this.pref, required this.folderBox});

  final SharedPreferences pref;
  final Box<FolderModel> folderBox;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catatan Pintar',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<FolderRepository>(
            create:
                (context) =>
                    FolderRepository(FolderLocalDataSourceImpl(folderBox)),
          ),
        ],
        child: BlocProvider(
          create: (context) => OnboardingCubit(pref),
          lazy: false,
          child: const AppView(),
        ),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        if (state.isFirstDownload) {
          return const OnboardingScreen();
        }
        return const DashboardScreen();
      },
    );
  }
}

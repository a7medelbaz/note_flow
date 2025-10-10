import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/constants/my_strings.dart';
import 'core/helpers/app_router.dart';
import 'layers/data/model/note_model.dart';
import 'layers/domain/logic/cubit/my_cubit_observer.dart';
import 'layers/ui/widgets/my_general_widgets.dart';

class NoteFlow extends StatelessWidget {
  final AppRouter appRouter;
  const NoteFlow({
    super.key,
    required this.appRouter,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyGeneralWidgets().buildDarkTheme(),
      debugShowCheckedModeBanner: false,
      title: 'NotFlow',
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Hive
  Bloc.observer = MyBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(MyConstants.myNoteHiveBox);
  runApp(NoteFlow(appRouter: AppRouter()));
}

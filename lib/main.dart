import 'package:flutter/material.dart';
import 'package:note_flow/helpers/app_router.dart';

class NoteFlow extends StatelessWidget {
  final AppRouter appRouter;
  const NoteFlow({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData.dark() ,
      debugShowCheckedModeBanner: false,
      title: 'NoteFlow',
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}

void main() {
  runApp( NoteFlow(appRouter: AppRouter(),));
}

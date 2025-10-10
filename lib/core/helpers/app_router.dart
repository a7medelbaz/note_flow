import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/my_strings.dart';
import '../../layers/domain/logic/cubit/add_note_cubit.dart';
import '../../layers/ui/screens/edite_note_page.dart';
import '../../layers/ui/screens/home_page.dart';

class AppRouter {

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MyRoutes.homePageRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AddNoteCubit(),
            child: HomePage(),
          ),
        );
      case MyRoutes.editeNotePageRoute:
        return MaterialPageRoute(
          builder: (_) => EditeNotePage(),
        );
      default:
    }
    return null;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/logic/cubit/add_note_cubit/add_note_cubit.dart';
import '../widgets/add_note.dart';
import '../widgets/my_appbar.dart';
import '../widgets/note_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    buildShowModelButtomSheet(
      BuildContext context,
    ) {
      return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        // useSafeArea: true,
        backgroundColor: Colors.black87,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
          ),
        ),
        builder: (context) {
          return BlocProvider(
            create: (context) => AddNoteCubit(),
            child: const AddNote(),
          );
        },
      );
    }

    return BlocBuilder<
      AddNoteCubit,
      AddNoteState
    >(
      builder: (context, state) {
        return Scaffold(
          appBar: MyAppbar(
            appbarIcon: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            appBarTitle: 'NoteFlow',
          ),
          floatingActionButton:
              FloatingActionButton(
                backgroundColor:
                    Colors.blueAccent,
                shape: const CircleBorder(),
                child: Icon(Icons.add),
                onPressed: () {
                  buildShowModelButtomSheet(
                    context,
                  );
                },
              ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: NoteListView(),
          ),
        );
      },
    );
  }
}

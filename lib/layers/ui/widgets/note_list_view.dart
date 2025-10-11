import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/logic/cubit/read_note_cubit/notes_cubit.dart';
import 'note_card.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        if (state is NotesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is NotesSuccesss) {
          return SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount:
                  state.loadingNotes.length,
              itemBuilder: (context, index) {
                return NoteCard(
                  id: state
                      .loadingNotes[index]
                      .id,
                  title: state
                      .loadingNotes[index]
                      .title,
                  subTitle: state
                      .loadingNotes[index]
                      .subTitle,
                  time: state
                      .loadingNotes[index]
                      .dateTime,
                  selectedNote:
                      state.loadingNotes[index],
                );
              },
            ),
          );
        } else if (state is NotesFailure) {
          return Center(
            child: Text(
              'Error: ${state.errorMassage}',
              style: const TextStyle(
                color: Colors.red,
              ),
            ),
          );
        } else {
          return const Center(
            child: Text('No notes yet'),
          );
        }
      },
    );
  }
}

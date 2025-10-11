import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_flow/layers/data/model/note_model.dart';
import 'package:note_flow/layers/domain/logic/cubit/read_note_cubit/notes_cubit.dart';
import '../widgets/my_appbar.dart';
import '../widgets/widgets_of_modal_bottom_sheet.dart';

class EditeNotePage extends StatelessWidget {
  final NoteModel selectedNote;

  const EditeNotePage({
    super.key,
    required this.selectedNote,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController =
        TextEditingController();
    final TextEditingController
    contentController = TextEditingController();
    return Scaffold(
      appBar: MyAppbar(
        appbarIcon: Padding(
          padding: const EdgeInsets.only(
            right: 8.0,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withValues(
                alpha: 0.8,
              ),
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            child: IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        appBarTitle: 'Edite The Note',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: WidgetsOfModalBottomSheet()
                  .buildTextField(
                    title: 'Title',
                    context: context,
                    hintText: 'Edite the Title',
                    controller: titleController,
                    textColor: Colors.white,
                  ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: WidgetsOfModalBottomSheet()
                  .buildTextField(
                    maxLines: 6,
                    title: 'Content',
                    context: context,
                    hintText:
                        'Edite the Content of the Note',
                    controller: contentController,
                    textColor: Colors.white,
                  ),
            ),
            SizedBox(height: 30),
            BlocListener<NotesCubit, NotesState>(
              listener: (context, state) {
                if (state is NotesSuccesss) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Note updated successfully!',
                      ),
                    ),
                  );
                }
              },
              child: WidgetsOfModalBottomSheet()
                  .buildElevatedButton(
                    text: 'Edite Note',
                    onPressed: () {
                      BlocProvider.of<NotesCubit>(
                        context,
                      ).updateNote(
                        NoteModel(
                          id: selectedNote.id,
                          title: titleController
                              .text,
                          subTitle:
                              contentController
                                  .text,
                          dateTime: selectedNote
                              .dateTime,
                          color:
                              selectedNote.color,
                        ),
                      );
                    },
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

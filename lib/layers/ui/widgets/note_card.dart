import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_flow/layers/data/model/note_model.dart';
import 'package:note_flow/layers/domain/logic/cubit/read_note_cubit/notes_cubit.dart';

import '../../../core/constants/my_strings.dart';

class NoteCard extends StatelessWidget {
  final NoteModel selectedNote;
  final String id;
  final String title;
  final String subTitle;
  final DateTime time;
  const NoteCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.time,
    required this.id, required this.selectedNote,
  });

  @override
  Widget build(BuildContext context) {
    final formattedTime = DateFormat(
      'MMM d, yyyy – h:mm a',
    ).format(time);
    // delete Note
    deleteNote(String id) {
      BlocProvider.of<NotesCubit>(
        context,
      ).deleteNote(id);
    }

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.amber,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(
                  top: 14.0,
                ),
                child: Text(
                  subTitle,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black
                        .withValues(alpha: .5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              trailing: IntrinsicHeight(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment:
                      MainAxisAlignment
                          .spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.redAccent,
                        size: 30,
                      ),
                      onPressed: () =>
                          deleteNote(id),
                    ),
                    const SizedBox(height: 6),
                    IconButton(
                      icon: const Icon(
                        Icons.edit_note,
                        color: Colors.blue,
                        size: 24,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          MyRoutes
                              .editeNotePageRoute,
                          arguments: selectedNote,
                        );
                      },
                    ),
                  ],
                ),
              ),
              minVerticalPadding: 25,
            ),
            Align(
              alignment:
                  AlignmentGeometry.topRight,
              child: Padding(
                padding: const EdgeInsets.all(
                  8.0,
                ),
                child: Text(
                  formattedTime,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight:
                            FontWeight.bold,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

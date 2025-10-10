import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import '../../../../../core/constants/my_strings.dart';
import '../../../../data/model/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

// read the notes
  Future<List<NoteModel>> fetchAllNotes() async {
    try {
      emit(NotesLoading());
      final notesBox = Hive.box<NoteModel>(
        MyConstants.myNoteHiveBox,
      );
      List<NoteModel> notesList = notesBox.values
          .toList();
      notesList.sort(
        (a, b) =>
            b.dateTime.compareTo(a.dateTime),
      );
      emit(
        NotesSuccesss(loadingNotes: notesList),
      );
      return notesList;
    } on Exception catch (e) {
      emit(
        NotesFailure(errorMassage: e.toString()),
      );
      return [];
    }
  }

//  delete methode
  Future<void> deleteNote(String id) async {
    try {
      final notesBox = Hive.box<NoteModel>(
        MyConstants.myNoteHiveBox,
      );
      final keyToDelete = notesBox.keys
          .firstWhere(
            (key) =>
                (notesBox.get(key) as NoteModel)
                    .id ==
                id,
          );
      await notesBox.delete(keyToDelete);
      fetchAllNotes();
    } catch (e) {
      emit(
        NotesFailure(errorMassage: e.toString()),
      );
    }
  }
}

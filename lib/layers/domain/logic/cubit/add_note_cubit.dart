import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_flow/core/constants/my_strings.dart';
import 'package:note_flow/layers/data/model/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  addNote(NoteModel noteModel) async {
    try {
      emit(AddNoteLoading());
      var notesBox = Hive.box(
        MyConstants.myNoteHiveBox,
      );
      emit(AddNoteSuccesss());
      await notesBox.add(noteModel);
    } on Exception catch (e) {
      AddNotefailure(errorMassage:e.toString());
    }
  }
}

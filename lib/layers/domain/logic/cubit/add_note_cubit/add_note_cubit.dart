import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../../../core/constants/my_strings.dart';
import '../../../../data/model/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  Color noteColor = Color(0xff8ECAE6);
  addNote(NoteModel noteModel) async {
    noteModel.color = noteColor.toARGB32();
    try {
      if (noteModel.title.trim().isEmpty ||
          noteModel.subTitle.trim().isEmpty) {
        emit(
          AddEmptyNote(
            emptyMassagewarning:
                'Title and content cannot be empty.',
          ),
        );
        return; // نوقف التنفيذ هنا
      }
      emit(AddNoteLoading());
      var notesBox = Hive.box<NoteModel>(
        MyConstants.myNoteHiveBox,
      );
      await notesBox.add(noteModel);
      emit(AddNoteSuccesss());
    } on Exception catch (e) {
      emit(
        AddNotefailure(
          errorMassage: e.toString(),
        ),
      );
    }
  }
}

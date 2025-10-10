part of 'notes_cubit.dart';

sealed class NotesState extends Equatable {
  const NotesState();

  @override
  List<Object> get props => [];
}

final class NotesInitial extends NotesState {}

final class NotesLoading extends NotesState {}

final class NotesSuccesss extends NotesState {
  final List<NoteModel> loadingNotes;
  const NotesSuccesss({
    required this.loadingNotes,
  });
}

final class Notesfailure extends NotesState {}

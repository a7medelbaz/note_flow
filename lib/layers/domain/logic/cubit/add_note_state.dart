part of 'add_note_cubit.dart';

@immutable
sealed class AddNoteState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class AddNoteInitial extends AddNoteState {}

final class AddNoteLoading extends AddNoteState {}

final class AddNoteSuccesss
    extends AddNoteState {}

final class AddNotefailure extends AddNoteState {
  final String errorMassage;
  AddNotefailure({required this.errorMassage});
}

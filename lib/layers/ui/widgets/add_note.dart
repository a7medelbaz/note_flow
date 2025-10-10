import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_flow/layers/domain/logic/cubit/add_note_cubit.dart';
import 'package:note_flow/layers/ui/widgets/widgets_of_modal_bottom_sheet.dart';
import 'add_note_form.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<
      AddNoteCubit,
      AddNoteState
    >(
      listener: (context, state) {
        if (state is AddNotefailure) {
          WidgetsOfModalBottomSheet()
              .showCustomSnackBar(
                context,
                'Failed: ${state.errorMassage}',
                Colors.red,
              );
        }
        if (state is AddNoteSuccesss) {
          WidgetsOfModalBottomSheet()
              .showCustomSnackBar(
                context,
                'Note added successfully!',
                Colors.green,
              );
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: ModalProgressHUD(
              inAsyncCall: state is AddNoteLoading
                  ? true
                  : false,
              child: AddNoteForm(),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:note_flow/layers/ui/widgets/widgets_of_modal_bottom_sheet.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: AddNoteForm(),
      ),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() =>
      _AddNoteFormState();
}

class _AddNoteFormState
    extends State<AddNoteForm> {
  final TextEditingController titleController =
      TextEditingController();
  final TextEditingController contentController =
      TextEditingController();

  final GlobalKey<FormState> formKey =
      GlobalKey<FormState>();

  AutovalidateMode autovalidateMode =
      AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: WidgetsOfModalBottomSheet()
                .buildTextField(
                  title: 'Title',
                  context: context,
                  hintText: 'Write the Title',
                  controller: titleController,
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
                      'Write the Content of the Note',
                  controller: contentController,
                ),
          ),
          SizedBox(height: 30),
          WidgetsOfModalBottomSheet()
              .buildElevatedButton(
                text: 'Add Note',
                onPressed: () {
                  if (formKey.currentState!
                      .validate()) {
                    formKey.currentState!.save();
                    WidgetsOfModalBottomSheet()
                        .showCustomSnackBar(
                          context,
                          'Note is valid!',
                        );
                  } else {
                    autovalidateMode =
                        AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
        ],
      ),
    );
  }
}

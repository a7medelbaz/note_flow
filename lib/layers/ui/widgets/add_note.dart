import 'package:flutter/material.dart';
import 'add_note_form.dart';

class AddNote extends StatelessWidget {

  const AddNote({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: AddNoteForm(),
      ),
    );
  }
}


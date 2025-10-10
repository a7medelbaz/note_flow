import 'package:flutter/material.dart';

import 'note_card.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return NoteCard(
          title: ' My Flutter Course',
          subTitle: 'Hi my name is Ahmed ',
          deleteFunction: () {},
          time: DateTime.now(),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:note_flow/layers/ui/widgets/my_appbar.dart';
import 'package:note_flow/layers/ui/widgets/note_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        appBarTitle: 'NoteFlow',
        onpressed: () {},
      ),
      body: NoteCard(
        title: ' My Flutter Course',
        subTitle: 'Hi my name is Ahmed ',
        deleteFunction: () {},
        time: DateTime.now(),
      ),
    );
  }
}

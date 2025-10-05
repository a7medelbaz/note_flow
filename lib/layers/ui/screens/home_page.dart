import 'package:flutter/material.dart';
import 'package:note_flow/layers/ui/widgets/my_appbar.dart';
import 'package:note_flow/layers/ui/widgets/note_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        appBarTitle: 'NoteFlow',
        onpressed: () {},
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        shape: const CircleBorder(),
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      body: NoteListView(),
    );
  }
}

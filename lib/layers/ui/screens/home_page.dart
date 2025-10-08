import 'package:flutter/material.dart';
import 'package:note_flow/layers/ui/widgets/add_note.dart';
import 'package:note_flow/layers/ui/widgets/my_appbar.dart';
import 'package:note_flow/layers/ui/widgets/note_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    buildShowModelButtomSheet(
      BuildContext context,
    ) {
      return showModalBottomSheet(
        context: context,
        isScrollControlled: false,
        backgroundColor: Colors.blueGrey,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
          ),
        ),
        builder: (context) {
          return const AddNote();
        },
      );
    }

    return Scaffold(
      appBar: MyAppbar(
        appBarTitle: 'NoteFlow',
        onpressed: () {},
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        shape: const CircleBorder(),
        child: Icon(Icons.add),
        onPressed: () {
          buildShowModelButtomSheet(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: NoteListView(),
      ),
    );
  }
}

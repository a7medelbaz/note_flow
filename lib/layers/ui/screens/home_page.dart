import 'package:flutter/material.dart';
import 'package:note_flow/layers/ui/widgets/my_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(appBarTitle:'NoteFlow',onpressed:(){}),
    );
  }
}
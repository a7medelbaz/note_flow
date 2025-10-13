import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/my_strings.dart';
import '../../domain/logic/cubit/add_note_cubit/add_note_cubit.dart';
import 'color_item.dart';

class BuildColorItem extends StatefulWidget {
  const BuildColorItem({super.key});

  @override
  State<BuildColorItem> createState() =>
      _BuildColorItemState();
}

class _BuildColorItemState
    extends State<BuildColorItem> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: MyColors.notesColors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(1.0),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                BlocProvider.of<AddNoteCubit>(
                      context,
                    ).noteColor =
                    MyColors.notesColors[index];
                setState(() {});
              },
              child: ColorItem(
                color:
                    MyColors.notesColors[index],
                isActive: currentIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}

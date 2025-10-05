import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoteCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final Function deleteFunction;
  final DateTime time;
  const NoteCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.deleteFunction,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    final formattedTime = DateFormat(
      'MMM d, yyyy – h:mm a',
    ).format(time);

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.amber,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 14.0),
                child: Text(
                  subTitle,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black.withValues(
                      alpha: .5,
                    ),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.redAccent,
                  size: 30,
                ),
                onPressed: () {
                  deleteFunction;
                },
              ),
              minVerticalPadding: 25,
            ),
            Align(
              alignment:
                  AlignmentGeometry.topRight,
              child: Padding(
                padding: const EdgeInsets.all(
                  8.0,
                ),
                child: Text(
                  formattedTime,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight:
                            FontWeight.bold,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

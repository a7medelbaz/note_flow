import 'package:hive/hive.dart';

part 'note_model.g.dart';
@HiveType(typeId: 0)
class NoteModel extends HiveObject {

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String subTitle;
  @HiveField(3)
  final DateTime dateTime;
  @HiveField(4)
  final int color;

  NoteModel({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.dateTime,
    required this.color,
  });
}

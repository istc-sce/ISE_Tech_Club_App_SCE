import 'package:hive/hive.dart';
part 'question_model.g.dart';

@HiveType(typeId: 0)
class QuestionModel extends HiveObject {
  @HiveField(0)
  List<bool> isChecked;

  QuestionModel({this.isChecked});

}
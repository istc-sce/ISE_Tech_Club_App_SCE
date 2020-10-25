import 'package:hive/hive.dart';
import './question_model.dart';
import 'hive_names.dart';


  Future loadBoxes() async  {
    Box<QuestionModel> arrayBox = Hive.box<QuestionModel>(HiveBoxes.array);
    Box<QuestionModel> stringBox  = Hive.box<QuestionModel>(HiveBoxes.string);
    Box<QuestionModel> matrixBox  = Hive.box<QuestionModel>(HiveBoxes.matrix);
    Box<QuestionModel> linkedListBox  = Hive.box<QuestionModel>(HiveBoxes.linkedList);
    Box<QuestionModel> bitManipulationBox  = Hive.box<QuestionModel>(HiveBoxes.bitManipulation);
    Box<QuestionModel> binaryTreeBox  = Hive.box<QuestionModel>(HiveBoxes.binaryTree);
    arrayBox.add(QuestionModel(isChecked: [false,false,false,false,false,false,false,false,false,false,false]));

    stringBox.add(QuestionModel(isChecked: [false,false,false,false,false,false,false,false,false,false,false],));

    matrixBox.add(QuestionModel(isChecked: [false,false,false,false,false,false,false,false,false,false],));

    linkedListBox.add(QuestionModel(isChecked: [false,false,false,false,false,false,false,false,false,false,false],));

    bitManipulationBox.add(QuestionModel(isChecked: [false,false,false,false,false,false,false,false,false,false],));

    binaryTreeBox.add(QuestionModel(isChecked: [false,false,false,false,false,false,false,false,false,false,false],));
  }

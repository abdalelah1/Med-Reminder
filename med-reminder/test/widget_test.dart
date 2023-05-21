// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:try_app2/modules/testet/DataBase_test.dart';
import 'package:try_app2/modules/testet/profile_test.dart';
import 'package:try_app2/shared/cubit/Cubit.dart';



class GetDataFromDataBase extends MedRemindCubit {}

class TestAllDataBaseFunction extends database {}

class TestLoginData extends profile {}

void main() {
  TestAllDataBaseFunction database = TestAllDataBaseFunction();
  List<dynamic> list;
  test('test version of data base', () {
    expect(database.GetsqfliteVesion(), 1);
  });
  test('change screen', () {
    int current_index = 0;
    expect(database.chaneScreen(current_index), 0);
  });
  
  test('testing for insert and get from database', () {
    // expect(
    //     database.inserttodatabase(
    //         MedName: 1,
    //         MedCount: 1,
    //         Medountperday: 1,
    //         Celender: 1,
    //         firstDrug: 1),
    //     {

    //     }
    var functionInsert = database.inserttodatabase(
        MedName: 1, MedCount: 1, Medountperday: 1, Celender: 1, firstDrug: 1);
    list = database.getdatafromdatabase();
    expect(functionInsert, list);
  });


  test('test all the day of end drugs', () {
    expect(database.calcAmoutofmedicine('20', '2', '2022-12-06'), '2022-12-16');
  });
  test('Delete Medicine', () {
    List<dynamic> inputData = [
      'MedName: a',
      'MedCount: b',
      'Medountperday: 1',
      'Celender: 12',
      'firstDrug: 12',
    ];
    database.inserttodatabase(
        MedName: 'a',
        MedCount: 'b',
        Medountperday: 1,
        Celender: 12,
        firstDrug: 12);
    List<dynamic> beforeDelete = database.getdatafromdatabase();
    expect(database.DeleteFromDatabase(inputData), []);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import 'package:intl/intl.dart';

import 'package:try_app2/shared/cubit/srates.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';
import '../../modules/addmed/addmedicine.dart';
import '../../modules/medical_archive copy/Medical_Person_Archive.dart';
import '../../modules/medical_archive/Medical_Archive.dart';
import '../../modules/notifcations/not.dart';
import '../../modules/profile/profile.dart';
import '../components/DioHelper.dart';

// import '../Components/Componenet.dart';
// import '../DioHelper.dart';
// import '../newtork/web_view.dart';

class MedRemindCubit extends Cubit<MedRemindStates> {
  MedRemindCubit() : super(InitaialStates());
  static MedRemindCubit get(context) => BlocProvider.of(context);
  List<BottomNavigationBarItem> listOfItemForBNB = const [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.person,
        ),
        label: 'profile'),
    BottomNavigationBarItem(icon: Icon(Icons.medication_liquid), label: 'add'),
    BottomNavigationBarItem(icon: Icon(Icons.article_outlined), label: 'med'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
  ];
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  int currentIndex = 0;
  List<Widget> screens = [
    Profile(),
    HealthScreen(),
    AddMedicine(),
    MedicalPersonlatyArchive(),
  ];
  void chaneScreen(index) {
    currentIndex = index;
    emit(ChangeNavBarState());
  }

  Future<int> GetsqfliteVesion() async {
    return await database!.getVersion();
  }

  List<Widget> listForBottmNavBar = const [
    Icon(
      Icons.person,
    ),
    Icon(Icons.medication_liquid),
    Icon(Icons.article_outlined),
    Icon(Icons.archive_outlined),
    Icon(Icons.abc),
  ];
  List<String> Alrts=[];
  void AddAlrts(String name, String time) {
    Alrts.add(name);
    Alrts.add(time);
  }

  Database? database;
  void createdatabase() {
    openDatabase('task.db', version: 1, onCreate: (database, version) {
      database.execute(
          'CREATE TABLE task(id INTEGER PRIMARY KEY  ,medname TEXT,medcount TEXT,medcountperday TEXT, startday TEXT ,endday TEXT,firstDrug Text )');
      database.execute(
          'CREATE TABLE profile(id INTEGER PRIMARY KEY  ,name TEXT,email TEXT,password TEXT,age TEXT)');
    }, onOpen: (database) {
      print('database opened');

      getdatafromdatabase(database);
    }).then((value) {
      database = value;

      emit(CreateDataBase());
    });
  }

  List<dynamic> medInfo = [];
  List<dynamic> healthNews = [];

  void DeleteDatabase({required int id}) {
    database!.rawUpdate('DELETE FROM task WHERE id = ?', [id]).then((value) {
      emit(DeleteFromDataBase());
      getdatafromdatabase(database);
    });
  }

  void getdatafromdatabase(database) {
    medInfo = [];
    database!
        .rawQuery(
            'SELECT id, medname,medcount,medcountperday,startday,endday,firstDrug FROM task')
        .then((List value) {
      emit(GetFromDataBase());
      value.forEach((element) {
        medInfo.add(element);
      });
    });
  }

  static calcAmoutofmedicine(
      String MedCount, String Medountperday, String Celender) {
    int medcount = int.parse(MedCount);
    int medAmountPerDay = int.parse(Medountperday);
    double days =
        (int.parse(MedCount) / int.parse(Medountperday)).floorToDouble();
    int intDays = days.toInt();
    DateTime startDay = DateTime.parse(Celender);
    var newDate = DateTime(
      startDay.year,
      startDay.month,
      startDay.day + intDays,
    );
    print("Start day " + newDate.day.toString());
    String nowDate = DateFormat("yyyy-MM-dd").format(newDate);

    return nowDate.toString();
  }

  inserttodatabase({
    required MedName,
    required MedCount,
    required Medountperday,
    required Celender,
    required firstDrug,
  }) async {
    await database!.transaction((txn) {
      return txn
          .rawInsert(
              // ignore: avoid_print
              'INSERT INTO task (medname,medcount,medcountperday,startday,endday,firstDrug) VALUES ("${MedName}","${MedCount}","${Medountperday}","${Celender}","${calcAmoutofmedicine(MedCount, Medountperday, Celender)}","${firstDrug}")')
          .then((value) {
        print('${value} DOne');

        getdatafromdatabase(database);
        emit(InsertToDataBase());
      }).catchError((error) => print(error));
    });
  }

  insertToProfileDatabase({
    required UserName,
    required UserEmail,
    required UserPasswoed,
    required UserAge,
  }) async {
    await database!.transaction((txn) {
      return txn
          .rawInsert(
              'INSERT INTO profile(name,email,password,age) VALUES ("a","b","c","d")')
          .then((value) {
        print('${value} DOne');

        emit(InsertToProfileDataBase());
      }).catchError((error) => print(error));
    });
  }

  // void GetHealthData() {
  //   emit(LoadingDataNews());
  //   DioHelper().GetData(path: 'v2/top-headlines', query: {
  //     'country': 'eg',
  //     'category': 'health',
  //     'apiKey': 'b1c8a54513fe4bb6ba6c4ef99167aff6'
  //   }).then((value) {
  //     healthNews = value.data['articles'];
  //     print(healthNews.length);
  //     print(healthNews[0]);
  //     emit(SuccefulGetHealthData());
  //   }).catchError((onError) {
  //     emit(ErrorGetHealthData(error: '${onError}'));
  //     print('xxx');
  //     print("error" + onError.toString());
  //   });
  // }
  void GetHealthData() async {
    emit(LoadingDataNews());
    try {
      final response = await DioHelper().GetData(
        path: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'health',
          'apiKey': 'b1c8a54513fe4bb6ba6c4ef99167aff6',
        },
      );
      healthNews = response.data['articles'];
      print(healthNews.length);
      print(healthNews[0]);
      emit(SuccefulGetHealthData());
    } catch (error) {
      emit(ErrorGetHealthData(error: '$error'));
      print('xxx');
      print('error: $error');
    }
  }

  void UpdateMedicine({required int id, required int medcount}) async {
    {
      await database!.rawUpdate('UPDATE task SET  medcount = ? WHERE id = ?',
          ['${medcount}', '${id}']).then((value) {
        getdatafromdatabase(database);
        emit(Updatedata());
      });
      print('updated');
    }

    void Search(String text) async {
      getdatafromdatabase(database);
      List<dynamic> allData = medInfo;

      if (allData.contains(text)) {
        print('');
      }
    }
  }
}

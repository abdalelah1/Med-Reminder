import 'package:intl/intl.dart';

class database {
  late List<dynamic> list;
  int currentIndex = 0;
  int GetsqfliteVesion() {
    return 1;
  }

  int chaneScreen(index) {
    currentIndex = index;
    return currentIndex;
  }

  inserttodatabase({
    required MedName,
    required MedCount,
    required Medountperday,
    required Celender,
    required firstDrug,
  }) {
    list = [
      'medname:${MedName}',
      'MedCount : ${MedCount}',
      'Medountperday:${Medountperday}',
      'Celender :${Celender}',
      'firstDrug:${firstDrug}'
    ];
    return list;
  }

  getdatafromdatabase() {
    return list;
  }

  calcAmoutofmedicine(String MedCount, String Medountperday, String Celender) {
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

  DeleteFromDatabase(List<dynamic> list1) {
    list.clear();
    return list;
  }
}

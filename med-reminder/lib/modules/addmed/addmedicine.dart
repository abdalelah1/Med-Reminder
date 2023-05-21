import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../shared/Components/Componenet.dart';
import '../../shared/cubit/Cubit.dart';
import '../../shared/cubit/srates.dart';

class AddMedicine extends StatelessWidget {
  AddMedicine({Key? key}) : super(key: key);

  TextEditingController medicalNameController = TextEditingController();
  TextEditingController medicalCountController = TextEditingController();
  TextEditingController medicalCountPerDayController = TextEditingController();
  TextEditingController TimeOfFirstDrugController = TextEditingController();
  TextEditingController drugEveryHour = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MedRemindCubit, MedRemindStates>(
      listener: (context, state) {},
      builder: (context, state) => SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            Container(
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(width: 1))),
                child: Text(
                  "Add New Drug ",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                child: Container(
                  child: Row(children: [
                    const Text('add med :       ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: defultformfiel(
                          controller: medicalNameController,
                          type: TextInputType.text,
                          prefix: Icon(Icons.medication_rounded),
                          validate: (value) {
                            if (value.toString() != null &&
                                medicalNameController.text != null) {
                              return '';
                            } else
                              return 'U cant';
                          }),
                    )
                    // Expanded
                    //   child: TextFormField(
                    //     keyboardType: TextInputType.text,

                    //   ),
                  ]),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    const SizedBox(
                      height: 0,
                    ),
                    const Text('Count of mid :',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: defultformfiel(
                          controller: medicalCountController,
                          type: TextInputType.number,
                          prefix: Icon(Icons.medication_rounded),
                          validate: (value) {
                            if (value.toString() != null &&
                                medicalCountController.text != null) {
                              return '';
                            } else
                              return 'U cant';
                          }),
                    )
                    // Expanded
                    //   child: TextFormField(
                    //     keyboardType: TextInputType.text,

                    //   ),
                  ]),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    const SizedBox(
                      height: 0,
                    ),
                    const Text('med per day : ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: defultformfiel(
                          controller: medicalCountPerDayController,
                          type: TextInputType.number,
                          prefix: Icon(Icons.medication_rounded),
                          validate: (value) {
                            if (value.toString() != null &&
                                medicalCountPerDayController.text != null) {
                              return '';
                            } else
                              return 'U cant';
                          }),
                    )
                    // Expanded
                    //   child: TextFormField(
                    //     keyboardType: TextInputType.text,

                    //   ),
                    ,
                  ]),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    const SizedBox(
                      height: 0,
                    ),
                    const Text('First Drug: ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    const SizedBox(
                      width: 55,
                    ),
                    Expanded(
                      child: defultformfiel(
                          controller: TimeOfFirstDrugController,
                          type: TextInputType.number,
                          prefix: Icon(Icons.medication_rounded),
                          onTap: () => showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay(hour: 12, minute: 00))
                              .then((value) => TimeOfFirstDrugController.text =
                                  value!.format(context)),
                          validate: (value) {
                            if (value.toString() != null &&
                                medicalCountPerDayController.text != null) {
                              return '';
                            } else
                              return 'U cant';
                          }),
                    ),
                    // Expanded
                    //   child: TextFormField(
                    //     keyboardType: TextInputType.text,

                    //   ),
                  ]),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    const SizedBox(
                      height: 0,
                    ),
                    const Text('Every hour :   ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: defultformfiel(
                          controller: drugEveryHour,
                          type: TextInputType.number,
                          prefix: Icon(Icons.medication_rounded),
                          validate: (value) {
                            if (value.toString() != null &&
                                medicalCountPerDayController.text != null) {
                              return '';
                            } else
                              return 'U cant';
                          }),
                    )
                    // Expanded
                    //   child: TextFormField(
                    //     keyboardType: TextInputType.text,

                    //   ),
                    ,
                  ]),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: 120,
              height: 50,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(100.0)),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {
                  String nowDate =
                      DateFormat("yyyy-MM-dd").format(DateTime.now());
                  MedRemindCubit.get(context).inserttodatabase(
                      MedName: medicalNameController.text.toString(),
                      MedCount: medicalCountController.text.toString(),
                      Medountperday:
                          medicalCountPerDayController.text.toString(),
                      Celender: nowDate.toString(),
                      firstDrug: TimeOfFirstDrugController.text.toString());
                  void showAlertAtTime(String time, String medname) {
                    final now = DateTime.now();
                    final scheduledTime = DateTime(
                      now.year,
                      now.month,
                      now.day,
                      int.parse(time.split(':')[0]),
                      int.parse(time.split(':')[1]),
                    );

                    final timeDifference = scheduledTime.difference(now);

                    Future.delayed(timeDifference).then((_) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Alert'),
                            content: Text('this time for medicine.${medname}'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    });
                  }

                  showAlertAtTime(TimeOfFirstDrugController.text.toString(),
                      medicalNameController.text.toString());
                  MedRemindCubit.get(context).AddAlrts(
                      TimeOfFirstDrugController.text.toString(),
                      medicalNameController.text.toString());

                  print(MedRemindCubit.get(context).medInfo);
                },
                child: const Text(
                  'Add med',
                  style: TextStyle(color: Colors.white),
                ),
                color: Color.fromARGB(255, 129, 115, 188),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

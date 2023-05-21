import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:try_app2/shared/cubit/Cubit.dart';
import '../../shared/Components/Componenet.dart';
import '../../shared/cubit/Cubit.dart';

import '../../shared/cubit/srates.dart';


class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    MedRemindCubit cubeit = MedRemindCubit.get(context);
    TextEditingController newcontroller = TextEditingController();
    List list = MedRemindCubit.get(context).medInfo;

    return BlocConsumer<MedRemindCubit, MedRemindStates>(
        listener: (context, state) => {},
        builder: (context, state) => Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: const [
                    CircleAvatar(
                      backgroundImage: AssetImage('lib/assets/images/med.jpeg'),
                      radius: 25.0,
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Text(
                      'Abdalelah Taleb',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ],
                ),
            const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Age = 25',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),

                // defultformfiel(
                //     controller: newcontroller,
                //     type: TextInputType.text,
                //     prefix: Icon(Icons.search)),
                // defultButton(function: () {}, text: 'Search'),
                // const SizedBox(
                //   height: 60,
                // ),

                const SizedBox(
                  height: 10,
                ),

                const SizedBox(
                  height: 20.0,
                ),

                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'Daily Medicine : ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration:
                      BoxDecoration(border: Border.all(), color: Colors.white),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0; i < list.length / 2; i++)
                          buildMedInfo(list[i], context),
                      ],
                    ),
                  ),
                ),

                // Container(
                //   width: 120,
                //   height: 50,
                //   decoration:
                //       BoxDecoration(borderRadius: BorderRadius.circular(100.0)),
                //   child: MaterialButton(
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(20.0)),
                //     onPressed: () =>
                //         NavigateTo(const MedicalPersonlatyArchive(), context),
                //     color: const Color.fromARGB(255, 129, 115, 188),
                //     child: const Text(
                //       'Medicine',
                //       style: TextStyle(color: Colors.white),
                //     ),
                //   ),
                // )
              ],
            )));
  }
}

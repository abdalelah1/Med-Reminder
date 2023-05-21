import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:try_app2/layout/MedMind%20-LogIn%20interface-1/Screens/Welcome/welcome_screen.dart';
import 'package:try_app2/layout/MedMind%20-LogIn%20interface-1/constants.dart';
import 'package:try_app2/layout/homePage.dart';
import 'package:try_app2/shared/Components/DioHelper.dart';
import 'package:try_app2/shared/cubit/Cubit.dart';
import 'package:try_app2/shared/cubit/bloc_observe.dart';
import 'package:try_app2/shared/cubit/srates.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main()async {
    await Hive.initFlutter();
    
      DioHelper.init();
      Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => MedRemindCubit()
                ..createdatabase()
                ..GetHealthData())
        ],
        child: BlocConsumer<MedRemindCubit, MedRemindStates>(
            listener: (state, context) {},
            builder: (state, context) => MaterialApp(
               theme: ThemeData(
            textTheme: const TextTheme(
              headline1: TextStyle(color: Colors.black),
              headline2: TextStyle(color: Colors.black),
              bodyText2: TextStyle(color: Colors.black),
              subtitle1: TextStyle(color: Colors.black),
            ),

            primaryTextTheme: TextTheme(),
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: Colors.white,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                primary: kPrimaryColor,
                shape: const StadiumBorder(),
                maximumSize: const Size(double.infinity, 56),
                minimumSize: const Size(double.infinity, 56),
              ),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              fillColor: kPrimaryLightColor,
              iconColor: kPrimaryColor,
              prefixIconColor: kPrimaryColor,
              contentPadding: EdgeInsets.symmetric(
              horizontal: defaultPadding, vertical: defaultPadding),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide.none,
              ),
            ),
            appBarTheme:
                AppBarTheme(backgroundColor: Colors.deepPurple.shade200),
            iconTheme: const IconThemeData(color: Colors.white),
            //   bottomNavigationBarTheme: BottomNavigationBarThemeData(
            //       selectedItemColor: Colors.black,
            //       backgroundColor: Color.fromARGB(255, 187, 62, 209)),
            // ),
          ),
          debugShowCheckedModeBanner: false,
                  home:const WelcomeScreen(),
                )));
  }
}

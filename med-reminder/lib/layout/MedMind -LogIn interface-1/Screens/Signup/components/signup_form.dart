import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:try_app2/shared/cubit/Cubit.dart';
import '../../../../../shared/cubit/srates.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Login/login_screen.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late Box box1;
    TextEditingController emillController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    void createBox() async
    {
      box1= await Hive.openBox('LoginData');
    }

    var box =  Hive.openBox('testBox');
    createBox();
    return BlocConsumer<MedRemindCubit,MedRemindStates>(

      listener: (context, state) {},
      builder:(context, state) =>Form(
        child: Column(
          children: [
            TextFormField(
              controller: emillController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (email) {},
              decoration: const InputDecoration(
                hintText: "Your email",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.person),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: TextFormField(
                controller: passwordController,
                textInputAction: TextInputAction.done,
                obscureText: true,
                cursorColor: kPrimaryColor,
                decoration: const InputDecoration(
                  hintText: "Your password",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.lock),
                  ),
                ),
              ),
            ),
            const SizedBox(height: defaultPadding / 2),
            TextFormField(
              controller: ageController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (email) {},
              decoration: const InputDecoration(
                hintText: "Your Age",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.person),
                ),
              ),
            ),
            const SizedBox(height: defaultPadding / 2),
            ElevatedButton(

              onPressed: () async {


                // Map<dynamic,dynamic> login=  {
                //   [{ "email":"${emillController.text}",
                //     "password":"${passwordController.text}",
                //     "Age":"${ageController.text}"}],
                //
                //                 } as Map;

               box1.put('email', emillController.text);
               box1.put('password', passwordController.text);
               box1.put('age', ageController.text);
               // var allinfo= box1.get({'email','password','age'});
               var email= box1.get('email');
               var password=box1.get('password');
               var age= box1.get('age');

               print(email +","+ password +"," +age);


                /*final SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();

                sharedPreferences.setString(
                    'email', emillController.text.toString());
                sharedPreferences.setString(
                    'password', passwordController.text.toString());
                print(sharedPreferences.get('email'));*/

              },
              child: Text("Sign Up".toUpperCase()),

            ),
            const SizedBox(height: defaultPadding),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ), 

    );
  }
}

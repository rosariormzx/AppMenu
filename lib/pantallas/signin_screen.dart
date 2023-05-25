


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menu/pantallas/home_screen.dart';
import 'package:menu/pantallas/signup_screen.dart';
import 'package:menu/utils/color_utils.dart';

import '../reusable_widgets/reusable_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextControler=TextEditingController();
  TextEditingController _emailTextControler=TextEditingController();
  @override
  Widget build(BuildContext context) {

    Row signUpOption() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("crear cuentas",
              style: TextStyle(color: Colors.white70)),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SignUpScreen()));
            },
            child: const Text(
              " Registro",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ],
      );
    }

    return Scaffold (
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        decoration: BoxDecoration(
            gradient: LinearGradient(colors:[toColor("F85E06"),toColor("F8CC06"),toColor("F81106") ],
                begin: Alignment.topCenter,end: Alignment.bottomCenter
            )),
        child:SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.2,20,0),child: Column(children: <Widget>[
              logoWidget("assets/images/orange.png"),
            SizedBox(height:30,
            ),
            reusableTextField("Ingrese el usuario por", Icons.person_outline, false, _emailTextControler),
            SizedBox(
              height: 20,
            ),
            reusableTextField("Ingrese la contraseña", Icons.lock, true, _passwordTextControler),
            SizedBox(
              height: 20,
            ),
            signInSignUpButtton(context, true, (){
              FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: _emailTextControler.text,
                  password: _passwordTextControler.text)
                  .then((value){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>HomeScreen()));
              }).onError((error, stackTrace) {
                print("Error ${error.toString()}");
              });

            }),
            signUpOption()
          ],
          ),
          ),
        ) ,
      ),
    );

  }
}




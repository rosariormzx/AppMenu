
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:menu/pantallas/administrador_screen.dart';
import 'package:menu/reusable_widgets/reusable_widget.dart';

import '../utils/color_utils.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextControler=TextEditingController();
  TextEditingController _emailTextControler=TextEditingController();
  TextEditingController _userNameControler=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Registro de usuarios",
          style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,

          decoration: BoxDecoration(
              gradient: LinearGradient(colors:[toColor("F85E06"),toColor("F8CC06"),toColor("F81106") ],
                  begin: Alignment.topCenter,end: Alignment.bottomCenter
              )),
          child: SingleChildScrollView(
              child: Padding(
                padding:  EdgeInsets.fromLTRB(20,120,20,0),
                child:Column(children:<Widget> [
                  const SizedBox(height: 20),
                  reusableTextField("Ingrese el nombre de usuario", Icons.person_outline, false, _userNameControler),
                  const SizedBox(height: 20),
                  reusableTextField("Ingrese email", Icons.person_outline, false, _emailTextControler),
                  const SizedBox(height: 20),
                  reusableTextField("Ingrese contraseña", Icons.lock_outline, false, _passwordTextControler),
                  const SizedBox(height: 20),
                  signInSignUpButtton(context, false, (){
                    FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: _emailTextControler.text,
                        password: _passwordTextControler.text
                    ).then((value){
                      print("Se creo una nueva cuenta");
                      Navigator.push(context,
                          MaterialPageRoute(builder:(context)=>AdministradorScreen()));
                    }).onError((error, stackTrace)  {
                      print("Error ${error.toString()}");
                    });

                  })
                ],
                ) ,
              )
          )
      ),
    );
  }
}
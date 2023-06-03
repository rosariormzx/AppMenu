
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menu/pantallas/home_screen.dart';
import 'package:menu/pantallas/photo_upload.dart';
import 'package:menu/pantallas/login_user.dart';
import 'package:menu/pantallas/signup_screen.dart';

import 'comida_screen.dart';

class AdministradorScreen extends StatefulWidget {
  const AdministradorScreen({Key? key}) : super(key: key);

  @override
  State<AdministradorScreen> createState() => _AdministradorScreenState();
}

class _AdministradorScreenState extends State<AdministradorScreen> {
  @override
  Widget build(BuildContext context) {
    String title = "Administrador";
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Color.fromARGB(255, 206, 105, 66),
      ),
      body: const Center(
        child: Text('Opciones de administrador'),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 233, 120, 75),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              IconButton(
                icon: Icon(Icons.add_a_photo),
                iconSize: 40,
                color: Colors.purple,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PhotoUpload();
                  }));
                },
              )
            ],
          ),
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            Container(

              child: const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(2255, 206, 105, 66),
                ),
                child: Text(
                  'Bienvenidos',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListTile(
              title: const Text('Comida'),
              leading: Icon(Icons.fastfood),
              onTap: () {
                // Update the state of the app
                Navigator.push(context,MaterialPageRoute(builder: (context)=>ComidaScreen()));
              },
            ),
            ListTile(
              title: const Text('Crear usuario'),
              leading: Icon(Icons.local_drink),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SignUpScreen ()));
              },
            ),
            ListTile(
              title: const Text('cerrar sesion'),
              leading: Icon(Icons.logout),
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) {
                  print("Cerrar sesion");
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
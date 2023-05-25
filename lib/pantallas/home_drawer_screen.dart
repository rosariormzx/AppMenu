import 'package:flutter/material.dart';
import 'package:menu/pantallas/signin_screen.dart';

import 'home_screen.dart';

class Home_Drawer extends StatelessWidget {
  const Home_Drawer({super.key});

  static const appTitle = 'Menú';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      color: Color.fromARGB(2255, 206, 105, 66),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Color.fromARGB(2255, 206, 105, 66),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              const Text('Productos'),
              SizedBox(height: 20),
              //imagen aqui
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
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(2255, 206, 105, 66),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/orange.png'),
                  ),
                  Text(
                    'Bienvenidos',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Comidas'),
              leading: Icon(Icons.fastfood),
              onTap: () {
                // Update the state of the app
                // Navigator.push(context,
                //   MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            ListTile(
              title: const Text('Bebidas'),
              leading: Icon(Icons.local_drink),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                //Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Iniciar sesion'),
              leading: Icon(Icons.login),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

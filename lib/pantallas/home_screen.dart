import 'package:flutter/material.dart';
import 'package:menu/pantallas/bebidas_screen.dart';
import 'package:menu/pantallas/login_user.dart';

import '../utils/color_utils.dart';
import 'administrador_screen.dart';
import 'comida_screen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const appTitle = 'Menù';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      color: Colors.lime,
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
      backgroundColor: Colors.amber,
      appBar: AppBar(title: Text(title),
        backgroundColor: Color.fromARGB(255, 206, 105, 66),
      ),
      body:  Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors:[toColor("F85E06"),toColor("F8CC06"),toColor("F81106") ],
                  begin: Alignment.topCenter,end: Alignment.bottomCenter
              )),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget> [
                Center(
                  child: Image.asset("assets/images/orange.png",
                    width: MediaQuery.of(context).size.width/2,
                    height: 200,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 70)),
                FloatingActionButton.extended(
                  // shape: CircleBorder(),
                  label: const Text('Bienvenidos'),
                  icon: const Icon(Icons.thumb_up),
                  backgroundColor: Colors.pink,
                  onPressed: (){
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Hola Bienvenido, a tu izquierda encontraras las opciones  del menù"))
                    );
                  },
                ),
                Positioned(
                    child:Align(
                      alignment: FractionalOffset.bottomRight,
                      child: Container(
                        padding: const EdgeInsets.only(right: 15,left: 15,top: 50,bottom: 50),
                        decoration: const BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(200)
                          )
                        ),
                        child: const RotatedBox(
                          quarterTurns: 3,
                          child: Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "La mejor comida ",style: TextStyle(
                              color: Colors.amberAccent,
                              fontStyle: FontStyle.italic,
                              fontSize: 20,
                              letterSpacing: 5
                            ),
                            ),
                          ),
                        ),
                      ),
                    ) ,
                ),

                
              ],
            )
          ],
        )
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
                color: Color.fromARGB(255, 206, 105, 66),
              ),
              child: Text('Bienvenidos',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

            ),
            ListTile(
              title: const Text('Alimentos'),
              leading: Icon(Icons.fastfood),
              onTap: () {
                // Update the state of the app
                Navigator.push(context,MaterialPageRoute(builder: (context)=>ComidaScreen()));
              },
            ),
            ListTile(
              title: const Text('Bebidas'),
              leading: Icon(Icons.local_drink),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(context,MaterialPageRoute(builder: (context)=>BebidasScreen()));
              },
            ),
            ListTile(
              title: const Text('Iniciar sesion'),
              leading: Icon(Icons.login),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginUser()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ComidaScreen extends StatefulWidget {
  const ComidaScreen({Key? key}) : super(key: key);

  @override
  State<ComidaScreen> createState() => _ComidaScreenState();
}

class _ComidaScreenState extends State<ComidaScreen> {
  bool loading=true;
  late String imageUrl="";
  late String imageUrl1="";
  late String imageUrl2="";
  late String imageUrl3="";
  late String imageUrl4="";
  late String imageUrl5="";
  late String imageUrl6="";
  late String imageUrl7="";
  late String imageUrl8="";
  late String imageUrl9="";
  final storage = FirebaseStorage.instance;
  @override
  void initState(){
    super.initState();
    imageUrl="";
    imageUrl1="";
    imageUrl2="";
    imageUrl3="";
    imageUrl4="";
    imageUrl5="";
    imageUrl6="";
    imageUrl7="";
    imageUrl8="";
    imageUrl9="";
    getImageUrl();
  }

  Future<void> getImageUrl() async{
    final ref= storage.ref().child("cereal.jpg");
    final ref1=storage.ref().child("chilaquiles.jpg");
    final ref2= storage.ref().child("empanadas.jpg");
    final ref3=storage.ref().child("ensalada.jpg");
    final ref4= storage.ref().child("ensaladafruta.jpg");
    final ref5=storage.ref().child("espagueti.jpg");
    final ref6= storage.ref().child("hamburguesa.jpeg");
    final ref7=storage.ref().child("huevosRancheros.jpg");
    final ref8= storage.ref().child("pizza.jpg");
    final ref9=storage.ref().child("tacos.jpg");

    final url=await ref.getDownloadURL();
    final url1=await ref1.getDownloadURL();
    final url2=await ref2.getDownloadURL();
    final url3=await ref3.getDownloadURL();
    final url4=await ref4.getDownloadURL();
    final url5=await ref5.getDownloadURL();
    final url6=await ref6.getDownloadURL();
    final url7=await ref7.getDownloadURL();
    final url8=await ref8.getDownloadURL();
    final url9=await ref9.getDownloadURL();

    setState(() {
      imageUrl=url;
      imageUrl1=url1;
      imageUrl2=url2;
      imageUrl3=url3;
      imageUrl4=url4;
      imageUrl5=url5;
      imageUrl6=url6;
      imageUrl7=url7;
      imageUrl8=url8;
      imageUrl9=url9;
      loading=false;
    });
  }

  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return Scaffold(
      appBar: AppBar(
        title:Text( "Comida publicada",),
        backgroundColor: Color.fromARGB(255, 206, 105, 66),

      ),
      body:loading ==true ?  Center(
        child: Container(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(),
        ),
      ) : ListView(
        children: [
          SizedBox(
            height: 300,
            child: Image(
              image: NetworkImage(imageUrl,scale: 1),
              fit: BoxFit.cover,

            ),
          ),

        SizedBox(
          height: 300,
          child: Image(
            image: NetworkImage(imageUrl1,scale: 1),
            fit: BoxFit.cover,
          ),),

          SizedBox(
            height: 300,
            child: Image(
              image: NetworkImage(imageUrl2,scale: 1),
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(
            height: 300,
            child: Image(
              image: NetworkImage(imageUrl3,scale: 1),
              fit: BoxFit.cover,
            ),),
          SizedBox(
            height: 300,
            child: Image(
              image: NetworkImage(imageUrl4,scale: 1),
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(
            height: 300,
            child: Image(
              image: NetworkImage(imageUrl5,scale: 1),
              fit: BoxFit.cover,
            ),),

          SizedBox(
            height: 300,
            child: Image(
              image: NetworkImage(imageUrl6,scale: 1),
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(
            height: 300,
            child: Image(
              image: NetworkImage(imageUrl7,scale: 1),
              fit: BoxFit.cover,
            ),),
          SizedBox(
            height: 300,
            child: Image(
              image: NetworkImage(imageUrl8,scale: 1),
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(
            height: 300,
            child: Image(
              image: NetworkImage(imageUrl9,scale: 1),
              fit: BoxFit.cover,
            ),),
        ],
      ),
    );
  }
}

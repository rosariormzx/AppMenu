
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class BebidasScreen extends StatefulWidget {
  const BebidasScreen({Key? key}) : super(key: key);

  @override
  State<BebidasScreen> createState() => _BebidasScreenState();
}

class _BebidasScreenState extends State<BebidasScreen> {
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
    final ref= storage.ref().child("agua.jpg");
    final ref1=storage.ref().child("naranjada.jpg");
    final ref2= storage.ref().child("cafe.jpg");
    final ref3=storage.ref().child("coca.jpg");
    final ref4= storage.ref().child("pepsi.jpg");
    final ref5=storage.ref().child("manzana.jpg");
    final ref6= storage.ref().child("naranja.jpg");
    final ref7=storage.ref().child("arandano.jpg");
    final ref8= storage.ref().child("guayaba.jpg");
    final ref9=storage.ref().child("piña.jpg");

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
    return Scaffold(
      appBar: AppBar(
        title:Text( "Bebidas publicadas",),
        backgroundColor: Color.fromARGB(255, 206, 105, 66),

      ),
      body: loading ==true ?  Center(
        child: Container(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(),
        ),
      ) :ListView(
        children: [

          Card(
            child: Expanded(
                child: Image(
                  image: NetworkImage(imageUrl,scale: 1),
                  fit: BoxFit.cover,
                ),
              ),
          ),


             Card(
               child: Expanded(
                child: Image(
                  image: NetworkImage(imageUrl1,scale: 1),
                  fit: BoxFit.cover,
                ),),
             ),



          Card(
            child: Expanded(
            child: Image(
                image: NetworkImage(imageUrl2,scale: 1),
                fit: BoxFit.cover,
              ),
            ),
          ),


          Card(
            child: Expanded(
            child: Image(
                image: NetworkImage(imageUrl3,scale: 1),
                fit: BoxFit.cover,
              ),),
          ),
          
          Card(
            child: Expanded(
              child: Image(
                image: NetworkImage(imageUrl4,scale: 1),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Card(
            child: Expanded(
            child: Image(
                image: NetworkImage(imageUrl5,scale: 1),
                fit: BoxFit.cover,
              ),),
          ),

          Card(
            child: Expanded(
              child: Image(
                image: NetworkImage(imageUrl6,scale: 1),
                fit: BoxFit.cover,
              ),
            ),
          ),


          Card(
            child: Expanded(
            child: Image(
                image: NetworkImage(imageUrl7,scale: 1),
                fit: BoxFit.cover,
              ),),
          ),

          Card(
            child: Expanded(
            child: Image(
                image: NetworkImage(imageUrl8,scale: 1),
                fit: BoxFit.cover,
              ),
            ),
          ),


          Card(
            child: Expanded(
            child: Image(
                image: NetworkImage(imageUrl9,scale: 1),
                fit: BoxFit.cover,
              ),),
          ),
        ],
      ),
    );
  }
}

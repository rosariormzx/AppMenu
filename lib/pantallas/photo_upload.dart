import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../utils/select_images.dart';

class PhotoUpload extends StatefulWidget {
  PhotoUpload({Key? key}) : super(key: key);

  @override
  State<PhotoUpload> createState() => _PhotoUploadState();
}

class _PhotoUploadState extends State<PhotoUpload> {
  late XFile? sampleImage = null;
  late String _myavalue;
  late final File? _imagen;
  final FirebaseStorage storage = FirebaseStorage.instance;
  final formKey = GlobalKey<FormState>();
  final myController = TextEditingController();

  @override
  void dispose() {
    // Limpia el controlador cuando el Widget se descarte

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cargar imagenes"),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
      ),
      body: Center(
        child:
            sampleImage == null ? Text("Seleccionar imagen") : enableUpload(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: "Add imagen",
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  Future<XFile?> getImage() async {
    final ImagePicker picker = ImagePicker();
    var tempImage = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      sampleImage = tempImage;
      _imagen = File(sampleImage!.path);
    });
  }

  Widget enableUpload() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15.0,
              ),
              _imagen != null
                  ? Image.file(_imagen!)
                  : Container(
                      margin: EdgeInsets.all(10),
                      height: 200,
                      width: double.infinity,
                      color: Colors.yellow,
                    ),
              SizedBox(
                height: 15.0,
              ),
              TextField(
                controller: myController,
              ),
              SizedBox(
                height: 15,
              ),
              FloatingActionButton.extended(
                onPressed: uploadImage,
                label: const Text('Subir imagen'),
                icon: const Icon(Icons.thumb_up),
                backgroundColor: Colors.pink,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> uploadImage() async {
    print(_imagen?.path);
    final String namefile = _imagen!.path.split("/").last;
    final Reference ref = storage.ref().child("imagenes").child(namefile);
    final UploadTask uploadTask = ref.putFile(_imagen!);
    print(uploadTask);
    final TaskSnapshot snapshot = await uploadTask.whenComplete(() => true);
    final String url = await snapshot.ref.getDownloadURL();
    print(url);

    if (snapshot.state == TaskState.success) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Imagen subida corectamente")));
      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Imagen no se subio algun tipo de error")));
      return false;
    }
  }

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}//fin dee clase



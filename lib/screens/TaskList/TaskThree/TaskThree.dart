import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class TaskThree extends StatefulWidget {
  const TaskThree({Key? key}) : super(key: key);

  @override
  State<TaskThree> createState() => _TaskThreeState();
}

class _TaskThreeState extends State<TaskThree> {
  String selectedImagePath = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Three'),
        backgroundColor: Colors.amberAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            selectedImagePath == ''
                ?Image.asset('assets/image_placeholder.png', height: 200, width: 200, fit: BoxFit.fill,)
                :Image.file(File(selectedImagePath), height: 200, width: 200, fit: BoxFit.fill,),
            ElevatedButton(
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      )
                  )
              ),
              onPressed:()async{
                selectImage();
              },
              child: Text(
                  "Select Image".toUpperCase(),
                  style: const TextStyle(fontSize: 14)
              ),
            )
          ],
        ),
      ),
    );
  }

  Future selectImage() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: SizedBox(
            height: 160,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      'Select Image From !',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            Permission permissionP = Permission.storage;
                            final statusP = await permissionP.request();
                            if(statusP.isGranted){
                              selectedImagePath = await selectImageFromGallery();
                              if (selectedImagePath != '') {
                                // ignore: use_build_context_synchronously
                                Navigator.pop(context);
                                setState(() {});
                              }
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Permission is not Granted")));
                            }
                          },
                          child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/gallery.png',
                                      height: 60,
                                      width: 60,
                                    ),
                                    const Text('Gallery'),
                                  ],
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () async {
                            Permission permissionC = Permission.camera;
                            final statusC = await permissionC.request();
                            if(statusC.isGranted){
                              selectedImagePath = await selectImageFromCamera();
                              if (selectedImagePath != '') {
                                // ignore: use_build_context_synchronously
                                Navigator.pop(context);
                                setState(() {});
                              }
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Permission is not Granted")));
                            }
                          },
                          child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/camera.png',
                                      height: 60,
                                      width: 60,
                                    ),
                                    const Text('Camera'),
                                  ],
                                ),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },

    );
  }

  selectImageFromGallery() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }

  selectImageFromCamera() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }
}



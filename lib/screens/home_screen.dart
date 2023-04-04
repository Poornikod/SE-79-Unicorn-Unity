import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:seed_snap_app/screens/sugest.dart';
import 'image.dart';
import 'location.dart';

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);


   // void navigateLocation(BuildContext ctx){
   //   Navigator.of(ctx).push(MaterialPageRoute(builder: (_){
   //     return MyPage();
   //  }));
   // }

   // void navigateNotePage(BuildContext ctx){
   //   Navigator.of(ctx).push(MaterialPageRoute(builder: (_){
   //     return const NotesHomeScreen();
   //   }));
   // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/pic1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>  MyPage()),
                );
              },
                child: ElevatedButton.icon(
                  onPressed: () {
                    _openCamera(context);
                  },
                  icon: Image.asset(
                    'assets/camera.png', width: 100.0, height: 80.0,),
                  label: const Text('Camera',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
            ),
                const SizedBox(height: 40),
                 GestureDetector(
                   onTap: () {
                     Navigator.push(
                       context,
                       MaterialPageRoute(
                           builder: (context) => const MapSample()),
                     );
                   },
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MapSample(),
                      ),
                    );
                  },
                  icon: Image.asset(
                    'assets/map.png', width: 100.0, height: 80.0,),
                  label: const Text('Plant For You',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                 ),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AnswerPopup()),
                    );
                  },
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AnswerPopup(),
                        ),
                      );
                    },
                    icon: Image.asset(
                      'assets/download.png', width: 100.0, height: 80.0,),
                    label: const Text('Zones',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

  void _openCamera(BuildContext context) async {
    final image = await ImagePicker().getImage(source: ImageSource.camera);

    // Do something with the captured image, e.g. display it on a new screen
    if (image != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyImageScreen(imagePath: image.path)),
      );
    }
  }


class MyImageScreen extends StatelessWidget {
  final String imagePath;

  const MyImageScreen({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Captured Image'),
      ),
      body: Center(
        child: Image.file(File(imagePath)),
      ),
    );
  }
}
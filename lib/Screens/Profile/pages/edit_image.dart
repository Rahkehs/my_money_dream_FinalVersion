import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import '../user/user_data.dart';
import '../widgets/appbar_widget.dart';

class EditImagePage extends StatefulWidget {
  const EditImagePage({Key? key}) : super(key: key);

  @override
  _EditImagePageState createState() => _EditImagePageState();
}

class _EditImagePageState extends State<EditImagePage> {
  var user = UserData.myUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(0.0, 0.0),
              end: Alignment.bottomRight,
              stops: [0.04, 10],
              colors: [Colors.black, Colors.white]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
                width: 330,
                child: const Text(
                  "\t\t\t\t\t\t\t\t\t\tEdit Profile Picture",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: SizedBox(
                    width: 330,
                    child: GestureDetector(
                      onTap: () async {
                        final image = await ImagePicker.pickImage(
                            source: ImageSource.gallery);

                        if (image == null) return;

                        final location =
                            await getApplicationDocumentsDirectory();
                        final name = basename(image.path);
                        final imageFile = File('${location.path}/$name');
                        final newImage =
                            await File(image.path).copy(imageFile.path);
                        setState(
                            () => user = user.copy(imagePath: newImage.path));
                      },
                      child: Image.network(user.image),
                    ))),
            Padding(
                padding: EdgeInsets.only(top: 40),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 110,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.white,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Update',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}

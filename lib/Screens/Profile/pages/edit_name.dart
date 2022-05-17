import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

import '../../../constants.dart';
import '../user/user_data.dart';
import '../widgets/appbar_widget.dart';

// This class handles the Page to edit the Name Section of the User Profile.
class EditNameFormPage extends StatefulWidget {
  const EditNameFormPage({Key? key}) : super(key: key);

  @override
  EditNameFormPageState createState() {
    return EditNameFormPageState();
  }
}

class EditNameFormPageState extends State<EditNameFormPage> {
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();
  var user = UserData.myUser;

  @override
  void dispose() {
    firstNameController.dispose();
    super.dispose();
  }

  void updateUserValue(String name) {
    user.name = name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        backgroundColor: Colors.black,
        body: Form(
          key: _formKey,
          child: Container(
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
                      "What's Your Name?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 40, 16, 0),
                        child: SizedBox(
                            height: 100,
                            width: 150,
                            child: TextFormField(
                              autofocus: false,
                              decoration: textInputDecoration.copyWith(
                                  fillColor: Colors.white,
                                  hintText: "eg: John ",
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                  ),
                                  labelText: 'First Name',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18),
                                      borderSide: BorderSide())),
                              // Handles Form Validation for First Name
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your first name';
                                } else if (!isAlpha(value)) {
                                  return 'Only Letters Please';
                                }
                                return null;
                              },

                              controller: firstNameController,
                            ))),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 40, 16, 0),
                        child: SizedBox(
                            height: 100,
                            width: 150,
                            child: TextFormField(
                              autofocus: false,
                              decoration: textInputDecoration.copyWith(
                                  fillColor: Colors.white,
                                  hintText: "eg: Citizen",
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                  ),
                                  labelText: 'Last Name',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18),
                                      borderSide: BorderSide())),
                              // Handles Form Validation for Last Name
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your last name';
                                } else if (!isAlpha(value)) {
                                  return 'Only Letters Please';
                                }
                                return null;
                              },

                              controller: secondNameController,
                            )))
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(top: 150),
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
                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate() &&
                                  isAlpha(firstNameController.text +
                                      secondNameController.text)) {
                                updateUserValue(firstNameController.text +
                                    " " +
                                    secondNameController.text);
                                Navigator.pop(context);
                              }
                            },
                            child: const Text(
                              'Update',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                          ),
                        )))
              ],
            ),
          ),
        ));
  }
}

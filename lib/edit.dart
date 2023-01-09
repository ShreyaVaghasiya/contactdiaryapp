import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'globals.dart';
import 'package:image_picker/image_picker.dart';

import 'homepage.dart';
class Edit extends StatefulWidget {
  int index1;
   Edit({Key? key, required this.index1}) : super(key: key);

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  String? FirstName;
  String? LastName;
  String? PhoneNo;
  String? Email;
  @override
  Widget build(BuildContext context) {
    // Map<String, dynamic> m = {
    //   'firstname': FirstName,
    //   'lastname': LastName,
    //   'phoneno': PhoneNo,
    //   'email': Email,
    // };
    getImage() async {
      XFile? pic = await ImagePicker().pickImage(source: ImageSource.camera);

      if (pic != null) {
        setState(() {
          Globals.dp = File(pic.path);
        });
      }
    }
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(10),
          child: GestureDetector(
            onTap: () {
              setState(() {
                Navigator.of(context).pop();
              });
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 30,
              color: (Globals.isTheme) ? Colors.black : Colors.white,
            ),
          ),
        ),
        actions: [

          Container(
            height: 50,
            width: 50,
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    Globals.contacts[widget.index1] = {
                      'firstname' : FirstName,
                      'lastname'  : LastName,
                      'phoneno' : PhoneNo,
                      'email' : Email,
                    };
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Home()), (route) => route.isFirst);
                  });
                },
                child: Icon(Icons.check,
                    size: 35,
                    color: (Globals.isTheme)
                        ? Colors.black
                        : Colors.white),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Icon(
                Icons.menu,
                size: 30,
                color: (Globals.isTheme) ? Colors.black : Colors.white,
              ),
            ),
          ),

        ],
        title: Text("EditContacts",
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: (Globals.isTheme) ? Colors.black : Colors.white,
                ))),
        backgroundColor: (Globals.isTheme) ? Colors.white : Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [

          Padding(padding: EdgeInsets.all(20)),
          Stack(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor:
                (Globals.isTheme) ? Colors.black45 : Colors.white24,
                child: (Globals.dp == null)
                    ? Text("Edit",
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: (Globals.isTheme)
                            ? Colors.black
                            : Colors.white,
                      ),
                    ))
                    : CircleAvatar(
                  radius: 60,
                  backgroundImage: FileImage(Globals.dp!),
                ),
              ),
              GestureDetector(
                child: Positioned(
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: FloatingActionButton(
                      backgroundColor: (Globals.isTheme)
                          ? Colors.black54
                          : Colors.white70,
                      onPressed: () {
                        setState(() {
                          getImage();
                        });
                      },
                      child: Icon(
                        Icons.add,
                        color: (Globals.isTheme)
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Form(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("       First Name",
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: (Globals.isTheme)
                                ? Colors.black
                                : Colors.white70,
                          ),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Container(
                      height: 50,
                      width: 400,
                      decoration: BoxDecoration(
                          color: (Globals.isTheme)
                              ? Colors.grey
                              : Colors.white24,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        initialValue: Globals.contacts[widget.index1]['firstname'],
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: (Globals.isTheme)
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                        autofocus: true,
                        onChanged: (value) {
                          setState(() {
                            if(value==null){
                              FirstName =  Globals.contacts[widget.index1]['firstname'];
                            }
                            else
                            {
                              FirstName = value;
                            }
                          });
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("       Last Name",
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: (Globals.isTheme)
                                ? Colors.black
                                : Colors.white70,
                          ),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Container(
                      height: 50,
                      width: 400,
                      decoration: BoxDecoration(
                          color: (Globals.isTheme)
                              ? Colors.grey
                              : Colors.white24,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        initialValue: Globals.contacts[widget.index1]['lastname'],
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: (Globals.isTheme)
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                        autofocus: true,
                        onChanged: (value) {
                          setState(() {
                            if(value==null){
                              LastName =  Globals.contacts[widget.index1]['lastname'];
                            }
                            else
                              {
                                LastName = value;
                              }
                          });
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("       Phone Number",
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: (Globals.isTheme)
                                ? Colors.black
                                : Colors.white70,
                          ),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Container(
                      height: 50,
                      width: 400,
                      decoration: BoxDecoration(
                          color: (Globals.isTheme)
                              ? Colors.grey
                              : Colors.white24,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        initialValue: Globals.contacts[widget.index1]['phoneno'],
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: (Globals.isTheme)
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                        autofocus: true,
                        onChanged: (value) {
                          setState(() {
                            PhoneNo = value;
                          });
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("       Email",
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: (Globals.isTheme)
                                ? Colors.black
                                : Colors.white70,
                          ),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Container(
                      height: 50,
                      width: 400,
                      decoration: BoxDecoration(
                          color: (Globals.isTheme)
                              ? Colors.grey
                              : Colors.white24,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        initialValue: Globals.contacts[widget.index1]['email'],
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: (Globals.isTheme)
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                        autofocus: true,
                        onChanged: (value) {
                          setState(() {

                            Email = value;
                          });
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
          ),
        ],
      ),
      backgroundColor: (Globals.isTheme) ? Colors.white : Colors.black,
      resizeToAvoidBottomInset: false,
    );
  }
}

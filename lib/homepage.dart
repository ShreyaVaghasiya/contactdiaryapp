import 'dart:io';
import 'dart:math';
import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'globals.dart';
import 'info.dart';
class Home extends StatefulWidget {
 Home({Key? key}) : super(key: key);



  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController mycontrol = TextEditingController();

  
  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      themeMode: (Globals.isTheme) ? ThemeMode.light : ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: (Globals.isTheme) ? Brightness.light : Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar: AppBar(
          actions: [
            Container(
              margin: EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {
                 setState(() {

                 });
                },
                child: Image(
                  image: AssetImage('assets/myimages/refreshing.png'),
                  height: 30,
                  width: 30,
                  color: (Globals.isTheme) ? Colors.black : Colors.white,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    Globals.isTheme = !Globals.isTheme;
                  });
                },
                child: Icon(
                  Icons.album_rounded,
                  size: 30,
                  color: (Globals.isTheme) ? Colors.black : Colors.white,
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
          title: Text("Contacts",
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: (Globals.isTheme) ? Colors.black : Colors.white,
              ))),
          backgroundColor: (Globals.isTheme) ? Colors.white : Colors.black,
          elevation: 0,
        ),
        body: (Globals.contacts.isEmpty)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Image(
                    image: const AssetImage('assets/myimages/box.png'),
                    height: 300,
                    width: 300,
                    color: (Globals.isTheme) ? Colors.black : Colors.white,
                  )),
                  Text("You have No Contacts Yet",
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color:
                            (Globals.isTheme) ? Colors.black54 : Colors.white,
                      )))
                ],
              )
            : ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: Globals.contacts.length,
                itemBuilder: (context, i) => GestureDetector(
                  onTap: (){
                    setState(() {
                   Navigator.of(context).push(
                       MaterialPageRoute(builder: (context) => Info(index : i))
                   );
                    });
                  },
                  child: ListTile(
                    title: Text(
                        "${Globals.contacts[i]['firstname']} ${Globals.contacts[i]['lastname']}",
                        style: GoogleFonts.ibmPlexMono(
                            textStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color:
                              (Globals.isTheme) ? Colors.black87 : Colors.white,
                        ))),
                    subtitle: Text("${Globals.contacts[i]['phoneno']}",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color:
                              (Globals.isTheme) ? Colors.black54 : Colors.white38,
                        ))),

                    trailing: Container(
                      margin: const EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () {
                          setState(() async{
                            final Uri call1 = Uri(
                                scheme: 'tel', path: '+91${Globals.contacts[i]['phoneno']}');
                            await launchUrl(call1);
                          });
                        },
                        child: Icon(
                          Icons.phone,
                          size: 35,
                          color: (Globals.isTheme) ? Colors.green.shade800 : Colors.lightGreenAccent,
                        ),
                      ),
                    ) ,
                  ),
                ),
                separatorBuilder: (BuildContext context, int i) => Divider(
                  thickness: 4,
                  color: (Globals.isTheme) ? Colors.black38 : Colors.white24,
                ),
              ),
        floatingActionButton: FloatingActionButton(
          child: GestureDetector(
              child: const Icon(
            Icons.add,
            color: Colors.black,
          )),
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor:
                    (Globals.isTheme) ? Colors.black26 : Colors.black54,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                  top: Radius.circular(15),
                )),
                context: context,
                builder: (context) {
                  return const Demo();
                });
          },
        ),
        backgroundColor: (Globals.isTheme) ? Colors.white : Colors.black,
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  getImage() async {
    XFile? pic = await ImagePicker().pickImage(source: ImageSource.camera);

    if (pic != null) {
      setState(() {
        Globals.dp = File(pic.path);
      });
    }
  }
  String? FirstName;
  String? LastName;
  String? PhoneNo;
  String? Email;


  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> m = {
      'firstname': FirstName,
      'lastname': LastName,
      'phoneno': PhoneNo,
      'email': Email,
    };
    return DraggableScrollableSheet(
        initialChildSize: 0.85,
        expand: false,
        builder: (_, controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: 500,
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          Globals.contacts.add(m);
                          Navigator.pop(context);
                        });
                      },
                      child: Icon(Icons.check,
                          size: 30,
                          color: (Globals.isTheme)
                              ? Colors.white54
                              : Colors.white),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(5)),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor:
                          (Globals.isTheme) ? Colors.white : Colors.white24,
                      child: (Globals.dp == null)
                          ? Text("Add",
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
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: (Globals.isTheme)
                                  ? Colors.white
                                  : Colors.white70,
                            ),
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      child: Container(
                        height: 50,
                        width: 400,
                        decoration: BoxDecoration(
                            color: (Globals.isTheme)
                                ? Colors.white70
                                : Colors.white24,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: (Globals.isTheme)
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                          autofocus: true,
                          onChanged: (value) {
                            setState(() {
                             FirstName = value;
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
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: (Globals.isTheme)
                                  ? Colors.white
                                  : Colors.white70,
                            ),
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      child: Container(
                        height: 50,
                        width: 400,
                        decoration: BoxDecoration(
                            color: (Globals.isTheme)
                                ? Colors.white70
                                : Colors.white24,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: (Globals.isTheme)
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                          autofocus: true,
                          onChanged: (value) {
                            setState(() {
                            LastName = value;
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
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: (Globals.isTheme)
                                  ? Colors.white
                                  : Colors.white70,
                            ),
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      child: Container(
                        height: 50,
                        width: 400,
                        decoration: BoxDecoration(
                            color: (Globals.isTheme)
                                ? Colors.white70
                                : Colors.white24,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 15,
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
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: (Globals.isTheme)
                                  ? Colors.white
                                  : Colors.white70,
                            ),
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      child: Container(
                        height: 50,
                        width: 400,
                        decoration: BoxDecoration(
                            color: (Globals.isTheme)
                                ? Colors.white70
                                : Colors.white24,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 15,
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
                ))
              ],
            ),
          );
        });
  }
}

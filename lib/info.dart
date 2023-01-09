import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'edit.dart';
import 'globals.dart';

class Info extends StatefulWidget {
  int index;

  Info({Key? key, required this.index}) : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  Future<void> MakeCall() async {
    final Uri call = Uri(
        scheme: 'tel', path: '+91${Globals.contacts[widget.index]['phoneno']}');
    await launchUrl(call);
  }

  Future<void> Makesms() async {
    final Uri Sms = Uri(
        scheme: 'sms', path: '+91${Globals.contacts[widget.index]['phoneno']}');
    await launchUrl(Sms);
  }

  Future<void> Makemail() async {
    final Uri mail = Uri(
        scheme: 'mailto', path: '${Globals.contacts[widget.index]['email']}');
    await launchUrl(mail);
  }

  @override
  Widget build(BuildContext context) {

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
            margin: const EdgeInsets.all(10),
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
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding:
                  (Globals.isTheme) ? EdgeInsets.all(40) : EdgeInsets.all(20)),
          Align(
              child: CircleAvatar(
                  radius: Globals.isTheme ? 80 : 150,
                  backgroundColor:
                      (Globals.isTheme) ? Colors.white : Colors.black,
                  child: Image(
                    image: (Globals.isTheme)
                        ? AssetImage('assets/myimages/accountlogo.png')
                        : AssetImage('assets/myimages/blackaccount.png'),
                  ))),
          Padding(
              padding:
                  (Globals.isTheme) ? EdgeInsets.all(15) : EdgeInsets.all(0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${Globals.contacts[widget.index]['firstname']}  ${Globals.contacts[widget.index]['lastname']}",
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: (Globals.isTheme) ? Colors.black : Colors.white,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  Globals.contacts.remove(widget.index);
                  Globals.contacts.removeAt(widget.index);
                },
                child: Icon(
                  Icons.delete,
                  size: 30,
                  color: (Globals.isTheme) ? Colors.black : Colors.white,
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              GestureDetector(
                onTap: (){
                  setState(() {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Edit(index1:widget.index))
                    );
                  });
                },
                child: Icon(
                  Icons.edit,
                  size: 30,
                  color: (Globals.isTheme) ? Colors.black : Colors.white,
                ),
              )
            ],
          ),
          Padding(padding: EdgeInsets.all(15)),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "      +91 ${Globals.contacts[widget.index]['phoneno']}",
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: (Globals.isTheme) ? Colors.black : Colors.white,
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(15)),
          Container(
              height: 100,
              width: 400,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          width: 3,
                          color:
                              (Globals.isTheme) ? Colors.black : Colors.white),
                      bottom: BorderSide(
                          width: 3,
                          color: (Globals.isTheme)
                              ? Colors.black
                              : Colors.white))),
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.all(3)),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        MakeCall();
                      });
                    },
                    child: CircleAvatar(
                        radius: 30,
                        backgroundColor: (Globals.isTheme)
                            ? Colors.green.shade900
                            : Colors.lightGreen,
                        child: Icon(Icons.phone,
                            size: 30,
                            color: (Globals.isTheme)
                                ? Colors.white
                                : Colors.black87)),
                  ),
                  Padding(padding: EdgeInsets.all(25)),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Makesms();
                      });
                    },
                    child: CircleAvatar(
                        radius: 30,
                        backgroundColor: (Globals.isTheme)
                            ? Colors.orange.shade800
                            : Colors.orangeAccent,
                        child: Icon(Icons.message,
                            size: 30,
                            color: (Globals.isTheme)
                                ? Colors.white
                                : Colors.black87)),
                  ),
                  Padding(padding: EdgeInsets.all(25)),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Makemail();
                      });
                    },
                    child: CircleAvatar(
                        radius: 30,
                        backgroundColor: (Globals.isTheme)
                            ? Colors.lightBlue
                            : Colors.lightBlue.shade300,
                        child: Icon(Icons.email,
                            size: 30,
                            color: (Globals.isTheme)
                                ? Colors.white
                                : Colors.black87)),
                  ),
                  Padding(padding: EdgeInsets.all(25)),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Share.share(
                            "Name : ${Globals.contacts[widget.index]['firstname']}  ${Globals.contacts[widget.index]['lastname']}\nContact No :${Globals.contacts[widget.index]['phoneno']}");
                      });
                    },
                    child: CircleAvatar(
                        radius: 30,
                        backgroundColor: (Globals.isTheme)
                            ? Colors.blue.shade700
                            : Colors.blue.shade800,
                        child: Icon(Icons.share,
                            size: 30,
                            color: (Globals.isTheme)
                                ? Colors.white
                                : Colors.black87)),
                  )
                ],
              )),
        ],
      ),
      backgroundColor: (Globals.isTheme) ? Colors.white : Colors.black,
      resizeToAvoidBottomInset: false,
    );
  }
}

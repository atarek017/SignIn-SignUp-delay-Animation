import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var now = new DateTime.now();
  DateTime _date = DateTime.now();
  DateTime dateTime = DateTime.now();
  DateTime dateT = DateTime(2010);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
        ),
        backgroundColor: Color(0xFF36BA7A),
        centerTitle: true,
        title: Text("Hello!"),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          firstText(),
          SizedBox(
            height: 30,
          ),
          name("Name"),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: TextField(),
          ),
          SizedBox(
            height: 20,
          ),
          name("Gender"),
          SizedBox(
            height: 10,
          ),
          gender_row(),
          SizedBox(
            height: 10,
          ),
          name("Born in"),
          SizedBox(
            height: 10,
          ),
          datePicker(),
          flotButton()
        ],
      ),
    );
  }

  Widget firstText() {
    return Center(
      child: Text(
        "First things first!",
        style: TextStyle(color: Colors.grey, fontSize: 16),
      ),
    );
  }

  Widget name(String text) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Text(
        text,
        style: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget gender_row() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 10,
            color: Colors.green,
            child: FlatButton(
              child: Container(
                width: 110,
                height: 90,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Icon(Icons.person),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "mail",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              onPressed: () {},
            )),
        SizedBox(
          width: 10,
        ),
        Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 10,
            color: Colors.white,
            child: FlatButton(
              child: Container(
                width: 110,
                height: 90,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Icon(Icons.pregnant_woman),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "Femail",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
              onPressed: () {},
            )),
      ],
    );
  }

  Widget datePicker() {
    return Container(
      width: 250,
      height: 150,
      child: CupertinoDatePicker(
        initialDateTime: now,
        minimumYear: 2011,
        maximumYear: 2019,
        maximumDate: now,
        minimumDate: dateT,
        mode: CupertinoDatePickerMode.date,
        onDateTimeChanged: (value) {
          _date = value;
        },
      ),
    );
  }

  Widget flotButton() {
    return FlatButton(
      child: Container(
        width: 200,
        height: 30,
        color: Colors.green,
        child: Center(
            child: Text(
          "NEXT",
          style: TextStyle(
            color: Colors.black,
          ),
        )),
      ),
      onPressed: () {},
    );
  }
}

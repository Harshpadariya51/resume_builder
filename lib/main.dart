import 'package:flutter/material.dart';
import 'package:resume/screen/achievements.dart';
import 'package:resume/screen/declaration.dart';
import 'package:resume/screen/education.dart';
import 'package:resume/screen/experiences.dart';
import 'package:resume/screen/interest_hobbies.dart';
import 'package:resume/screen/projects.dart';
import 'package:resume/screen/reaume.dart';
import 'package:resume/screen/references.dart';
import 'package:resume/screen/technical_skills.dart';

import 'screen/Carrier.dart';
import 'screen/Personal_Detail.dart';
import 'screen/contact.dart';
import 'screen/page_2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'Homepage': (context) => Homepage(),
        'Page_2': (context) => Page_2(),
        'contact': (context) => Contact_Info(),
        'Carrier': (context) => Carrier(),
        'Personal_Details': (context) => Personal_Details(),
        'education': (context) => education(),
        'experiences': (context) => experiences(),
        'technical_skills': (context) => technical_skills(),
        'projects': (context) => projects(),
        'achievements': (context) => achievements(),
        'references': (context) => references(),
        'declaration': (context) => declaration(),
        'interest_hobbies': (context) => interest_hobbies(),
        'resume': (context) => Resume(),
      },
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                color: Colors.blue,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 50, left: 80),
            child: Container(
              height: 40,
              width: 200,
              color: Colors.blue,
              child: Center(
                  child: Text(
                "Resume Builder",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 140, left: 100),
            child: Container(
              height: 40,
              width: 150,
              color: Colors.blue,
              child: Center(
                  child: Text(
                " Resumes ",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 300,
                ),
                child: Container(
                  child: Image.asset(
                    "img/open-cardboard-box.png",
                  ),
                  height: 50,
                  width: 100,
                  color: Colors.white10,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 45),
                child: Container(
                    height: 20,
                    width: 350,
                    color: Colors.white10,
                    child: Text("No Resumes + Create new Resume.")),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('Page_2');
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

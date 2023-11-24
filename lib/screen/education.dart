import 'package:flutter/material.dart';
import 'package:resume/screen/util.dart';

class education extends StatefulWidget {
  const education({super.key});

  @override
  State<education> createState() => _educationState();
}

class _educationState extends State<education> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController courseController = TextEditingController();
  TextEditingController schoolController = TextEditingController();
  TextEditingController cgpaController = TextEditingController();
  TextEditingController passingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(top: 30, left: 50),
          child: Text(
            "Education",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.blue,
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.topCenter,
              child: Container(
                // height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Colors.white),
                child: SingleChildScrollView(
                  child: Form(
                    key: globalKey,
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Course/Degree',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Enter Your Name ...';
                              }
                              return null;
                            },
                            onSaved: (val) {
                              Global.courseDegree = val!;
                            },
                            onFieldSubmitted: (val) {},
                            controller: courseController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: "B. Tech Information Technology",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1))),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'School/College/Institute',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Enter Your Name ...';
                              }
                              return null;
                            },
                            onSaved: (val) {
                              Global.schoolColIns = val!;
                            },
                            onFieldSubmitted: (val) {},
                            controller: schoolController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: "Bhagavn Mahavir University",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1))),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'School/College/Institute',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Enter Your Name ...';
                              }
                              return null;
                            },
                            onSaved: (val) {
                              Global.cgpa = val!;
                            },
                            onFieldSubmitted: (val) {},
                            controller: cgpaController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: "70 % (or) 7.0 CGPA",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1))),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Year of Pass',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Enter Your Name ...';
                              }
                              return null;
                            },
                            onSaved: (val) {
                              Global.passingYear = val!;
                            },
                            onFieldSubmitted: (val) {},
                            controller: passingController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: "2019",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1))),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(13),
                                child: SizedBox(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      globalKey.currentState!.reset();

                                      courseController.clear();
                                      passingController.clear();
                                      schoolController.clear();
                                      cgpaController.clear();

                                      Global.courseDegree = '';
                                      Global.schoolColIns = '';
                                      Global.cgpa = '';
                                      Global.passingYear = '';

                                      setState(() {});
                                    },
                                    child: const Text(
                                      "Clear",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (globalKey.currentState!.validate()) {
                                      globalKey.currentState!.save();

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          content: Text('Saves done....'),
                                          backgroundColor: Colors.green,
                                        ),
                                      );
                                      Navigator.of(context)
                                          .pushNamed('experiences');
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          content:
                                              Text('Pleas fill all Fields..'),
                                          backgroundColor:
                                              Colors.deepOrangeAccent,
                                        ),
                                      );
                                    }
                                  },
                                  child: const Text(
                                    "Next",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:resume/screen/util.dart';

class experiences extends StatefulWidget {
  const experiences({super.key});

  @override
  State<experiences> createState() => _experiencesState();
}

class _experiencesState extends State<experiences> {
  String genderVal = '';
  bool switchVal = false;
  bool isTrue = true;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController comNameController = TextEditingController();
  TextEditingController sCIController = TextEditingController();
  TextEditingController rolesController = TextEditingController();
  TextEditingController joinController = TextEditingController();
  TextEditingController endController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(top: 30, left: 40),
          child: Text(
            "Experience",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: globalKey,
          child: Column(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                color: Colors.blue,
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  Container(
                    height: 650,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Company Name",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.blue),
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Enter Your Company Name ...';
                                }
                                return null;
                              },
                              onSaved: (val) {
                                Global.comName = val!;
                              },
                              onFieldSubmitted: (val) {},
                              controller: comNameController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: "New Enterprise, San Francisco",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "School/College/lnstitute",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.blue),
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Enter Your Role Name ...';
                                }
                                return null;
                              },
                              onSaved: (val) {
                                Global.sCI = val!;
                              },
                              onFieldSubmitted: (val) {},
                              keyboardType: TextInputType.text,
                              controller: sCIController,
                              decoration: InputDecoration(
                                hintText: "Quality Test Engineer",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Roles (optional)",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.blue),
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Enter Your Roles Detail ...';
                                }
                                return null;
                              },
                              onSaved: (val) {
                                Global.roles = val!;
                              },
                              onFieldSubmitted: (val) {},
                              controller: rolesController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                hintText:
                                    'Working with  team Memebers to come up with new concepts and product analysis... ',
                              ),
                              style: TextStyle(fontSize: 15),
                              maxLines: 3,
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Employed Status",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  color: Colors.black54),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: RadioListTile(
                                    title: const Text(
                                      'previously Employed',
                                      style: TextStyle(fontSize: 9),
                                    ),
                                    value: 'Other',
                                    groupValue: genderVal,
                                    onChanged: (val) {
                                      setState(() {
                                        genderVal = val!;
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: RadioListTile(
                                    title: const Text(
                                      'Currently Employed',
                                      style: TextStyle(fontSize: 9),
                                    ),
                                    value: 'Other',
                                    groupValue: genderVal,
                                    onChanged: (val) {
                                      setState(() {
                                        genderVal = val!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 2,
                              width: double.infinity,
                              color: Colors.black54,
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        "Date Joined",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.blue),
                                      ),
                                      TextFormField(
                                        validator: (val) {
                                          if (val!.isEmpty) {
                                            return 'Enter Your Joining Date ...';
                                          }
                                          return null;
                                        },
                                        onSaved: (val) {
                                          Global.joinDate = val!;
                                        },
                                        onFieldSubmitted: (val) {},
                                        keyboardType: TextInputType.datetime,
                                        controller: joinController,
                                        decoration: InputDecoration(
                                          hintText: "DD/MM/YYYY",
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(width: 1),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        "Date Exit",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.blue),
                                      ),
                                      TextFormField(
                                        validator: (val) {
                                          if (val!.isEmpty) {
                                            return 'Enter Your Ending Date ...';
                                          }
                                          return null;
                                        },
                                        onSaved: (val) {
                                          Global.exitDate = val!;
                                        },
                                        onFieldSubmitted: (val) {},
                                        keyboardType: TextInputType.datetime,
                                        decoration: InputDecoration(
                                          hintText: "DD/MM/YYYY",
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(width: 1),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(13),
                                  child: Container(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        globalKey.currentState!.reset();

                                        comNameController.clear();
                                        sCIController.clear();
                                        rolesController.clear();
                                        joinController.clear();
                                        endController.clear();

                                        Global.comName = '';
                                        Global.sCI = '';
                                        Global.roles = '';
                                        Global.joinDate = '';
                                        Global.exitDate = '';

                                        setState(() {});
                                      },
                                      child: const Text(
                                        "Clear",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
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
                                            .pushNamed('technical_skills');
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

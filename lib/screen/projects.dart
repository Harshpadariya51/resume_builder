import 'package:flutter/material.dart';
import 'package:resume/screen/util.dart';

class projects extends StatefulWidget {
  const projects({super.key});

  @override
  State<projects> createState() => _projectsState();
}

class _projectsState extends State<projects> {
  TextEditingController proTitleController = TextEditingController();
  TextEditingController techController = TextEditingController();
  TextEditingController proRolesController = TextEditingController();
  TextEditingController proTechExController = TextEditingController();
  TextEditingController proDescController = TextEditingController();

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  List<Map<String, dynamic>> hobby = [
    {
      'isSelect': false,
      'hobbyName': 'C Programming',
    },
    {
      'isSelect': false,
      'hobbyName': 'C++',
    },
    {
      'isSelect': false,
      'hobbyName': 'Flutter',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        elevation: 0,
        // title: Padding(
        //   padding: EdgeInsets.only(top: 30, left: 40),
        //   child: Text(
        //     "Experience",
        //     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        //   ),
        // ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: 23,
                ),
                child: Center(
                  child: Text(
                    "Projects",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              height: 100,
              width: double.infinity,
              color: Colors.blue,
            ),
            SizedBox(height: 5),
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.topCenter,
              child: Container(
                height: 500,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Colors.white),
                child: SingleChildScrollView(
                  child: SizedBox(
                    // height: 750,
                    child: Form(
                      key: globalKey,
                      child: Padding(
                        padding: const EdgeInsets.all(25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Project Title',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            SizedBox(height: 5),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Enter Your Project Title ...';
                                }
                                return null;
                              },
                              onSaved: (val) {
                                Global.proTitle = val!;
                              },
                              onFieldSubmitted: (val) {},
                              controller: proTitleController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  hintText: "Resume Builder App",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1))),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Technologies',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            SizedBox(height: 5),
                            ...Global.technologiesList.map((e) {
                              return CheckboxListTile(
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                title: Text('${e['langName']}'),
                                value: e['isSelect'],
                                onChanged: (val) {
                                  setState(() {
                                    e['isSelect'] = val!;
                                  });
                                },
                              );
                            }),
                            SizedBox(height: 10),
                            Text(
                              'Roles (optional)',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            SizedBox(height: 5),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Enter Your Project In Roles ...';
                                }
                                return null;
                              },
                              onSaved: (val) {
                                Global.proRoles = val!;
                              },
                              onFieldSubmitted: (val) {},
                              controller: proRolesController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText:
                                    'Organize team members, Code Analysis',
                              ),
                              style: TextStyle(fontSize: 20),
                              maxLines: 2,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Technologies',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            SizedBox(height: 5),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Enter Your Project In uses Lang...';
                                }
                                return null;
                              },
                              onSaved: (val) {
                                Global.technologiesEx = val!;
                              },
                              onFieldSubmitted: (val) {},
                              controller: proTechExController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  hintText: "5 - Programmers",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1))),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Projects Description',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            SizedBox(height: 5),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Enter Your Project Description ...';
                                }
                                return null;
                              },
                              onSaved: (val) {
                                Global.proDesc = val!;
                              },
                              onFieldSubmitted: (val) {},
                              controller: proDescController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  hintText: "Enter Your Project Description",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1))),
                            ),
                            SizedBox(height: 15),
                            // Buttons ..................
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      globalKey.currentState!.reset();

                                      proTitleController.clear();
                                      proRolesController.clear();
                                      proTechExController.clear();
                                      proDescController.clear();

                                      Global.proTitle = '';
                                      Global.proDesc = '';
                                      Global.proDesc = '';

                                      setState(() {});
                                    },
                                    child: const Text(
                                      "Clear",
                                      style: TextStyle(fontSize: 20),
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
                                            .pushNamed('achievements');
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
              ),
            )
          ],
        ),
      ),
    );
  }
}

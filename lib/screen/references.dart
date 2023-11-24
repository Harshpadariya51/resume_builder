import 'package:flutter/material.dart';
import 'package:resume/screen/util.dart';

class references extends StatefulWidget {
  const references({super.key});

  @override
  State<references> createState() => _referencesState();
}

class _referencesState extends State<references> {
  TextEditingController refNameController = TextEditingController();
  TextEditingController refDesiController = TextEditingController();
  TextEditingController refOrgController = TextEditingController();

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        elevation: 0,
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
                    "References",
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
            SizedBox(height: 20),
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
                  child: SizedBox(
                    // height: 400,
                    child: Form(
                      key: globalKey,
                      child: Padding(
                        padding: const EdgeInsets.all(25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'References Name',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Enter Reference Name ...';
                                }
                                return null;
                              },
                              onSaved: (val) {
                                Global.refName = val!;
                              },
                              onFieldSubmitted: (val) {},
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  hintText: "Suresh Shah",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1))),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Designation',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            TextFormField(
                              controller: refDesiController,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Enter designation ...';
                                }
                                return null;
                              },
                              onSaved: (val) {
                                Global.designation = val!;
                              },
                              onFieldSubmitted: (val) {},
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: "Marketing Manager, ID-342332",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Organization/Institute',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            TextFormField(
                              controller: refOrgController,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Enter Organization Name ...';
                                }
                                return null;
                              },
                              onSaved: (val) {
                                Global.orgInstName = val!;
                              },
                              onFieldSubmitted: (val) {},
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: "Green Energy Pvt. Ltd",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        globalKey.currentState!.reset();

                                        refNameController.clear();
                                        refDesiController.clear();
                                        refOrgController.clear();

                                        Global.refName = '';
                                        Global.designation = '';
                                        Global.orgInstName = '';

                                        setState(() {});
                                      },
                                      child: const Text(
                                        "Clear",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (globalKey.currentState!
                                            .validate()) {
                                          globalKey.currentState!.save();

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              content: Text('Saves done....'),
                                              backgroundColor: Colors.green,
                                            ),
                                          );
                                          Navigator.of(context)
                                              .pushNamed('declaration');
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              content: Text(
                                                  'Pleas fill all Fields..'),
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

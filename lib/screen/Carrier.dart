import 'package:flutter/material.dart';
import 'package:resume/screen/util.dart';

class Carrier extends StatefulWidget {
  const Carrier({super.key});

  @override
  State<Carrier> createState() => _CarrierState();
}

class _CarrierState extends State<Carrier> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  TextEditingController descController = TextEditingController();
  TextEditingController currentDesignationC = TextEditingController();

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
              height: 100,
              width: double.infinity,
              color: Colors.blue,
              child: Padding(
                padding: EdgeInsets.only(left: 80),
                child: Text(
                  "Carrier Objective",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              height: 900,
              width: double.infinity,
              child: Form(
                key: globalKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        // height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: Text(
                                  "Career Objective",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              // Career Objective ..............................
                              TextFormField(
                                controller: descController,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return 'Enter Career Objective...';
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  Global.careerObj = val!;
                                },
                                onFieldSubmitted: (val) {},
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: 'Description',
                                ),
                                maxLines: 8,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 360,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: Text(
                                  "Current Designation (Experienced Candidate)",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              TextFormField(
                                controller: currentDesignationC,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return 'Enter Your Address(state name and Pin code)...';
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  Global.currentDesignation = val!;
                                },
                                onFieldSubmitted: (val) {},
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 50),
                                  ),
                                  hintText: 'Software Engineer',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  globalKey.currentState!
                                                      .reset();

                                                  descController.clear();
                                                  currentDesignationC.clear();

                                                  Global.careerObj = '';
                                                  Global.currentDesignation =
                                                      '';
                                                  setState(() {});
                                                },
                                                child: const Text(
                                                  "Clear",
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            Container(
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  if (globalKey.currentState!
                                                      .validate()) {
                                                    globalKey.currentState!
                                                        .save();

                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      const SnackBar(
                                                        behavior:
                                                            SnackBarBehavior
                                                                .floating,
                                                        content: Text(
                                                            'Saves done....'),
                                                        backgroundColor:
                                                            Colors.green,
                                                      ),
                                                    );
                                                    Navigator.of(context)
                                                        .pushNamed(
                                                            'Personal_Details');
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      const SnackBar(
                                                        behavior:
                                                            SnackBarBehavior
                                                                .floating,
                                                        content: Text(
                                                            'Pleas feel all Fields..'),
                                                        backgroundColor: Colors
                                                            .deepOrangeAccent,
                                                      ),
                                                    );
                                                  }
                                                },
                                                child: const Text(
                                                  "Next",
                                                  style:
                                                      TextStyle(fontSize: 20),
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
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

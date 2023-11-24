import 'package:flutter/material.dart';
import 'package:resume/screen/util.dart';

class technical_skills extends StatefulWidget {
  const technical_skills({super.key});

  @override
  State<technical_skills> createState() => _technical_skillsState();
}

class _technical_skillsState extends State<technical_skills> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  int skillLimit = 1;
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
                    "Technical Skills",
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
              height: 500,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Form(
                  key: globalKey,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 420,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        color: Colors.white,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 50),
                            Text(
                              'Enter Your Skills',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            SizedBox(height: 10),
                            ...Global.Skills.map(
                              (e) => Row(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: TextField(
                                        controller: e,
                                        decoration: InputDecoration(
                                          hintText: 'Enter hobby',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          skillLimit--;
                                          Global.Skills.remove(e);
                                          print('Remove : ${Global.Skills}');
                                        });
                                      },
                                      icon: const Icon(Icons.delete),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // ........................................
                            SizedBox(height: 20),
                            // Button Add ...........
                            ((skillLimit < 10) && (skillLimit > -1))
                                ? Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          skillLimit++;
                                          Global.Skills.add(
                                              TextEditingController());
                                          print('Add : ${Global.Skills}');
                                        });
                                      },
                                      child: Container(
                                        height: 50,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1, color: Colors.grey)),
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 40,
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: SizedBox(
                                height: 50,
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
                                          .pushNamed('projects');
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

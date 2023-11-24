import 'package:flutter/material.dart';
import 'package:resume/screen/util.dart';

class achievements extends StatefulWidget {
  const achievements({super.key});

  @override
  State<achievements> createState() => _achievementsState();
}

class _achievementsState extends State<achievements> {
  TextEditingController achievController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  int skillLimit = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 23,
              ),
              child: Center(
                child: Text(
                  "Achievements",
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
            height: 450,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                height: 600,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: globalKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 50),
                        Text(
                          'Enter Achievements',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                        SizedBox(height: 20),
                        ...Global.Achivements.map(
                          (e) => Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: TextField(
                                    controller: e,
                                    decoration: InputDecoration(
                                        hintText: 'Exceed sales 17% average',
                                        hintStyle: TextStyle(fontSize: 20)),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      skillLimit--;
                                      Global.Achivements.remove(e);
                                    });
                                  },
                                  icon: const Icon(Icons.delete),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        ((skillLimit < 10) && (skillLimit > -1))
                            ? Padding(
                                padding: const EdgeInsets.all(20),
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      skillLimit++;
                                      Global.Achivements.add(
                                          TextEditingController());
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
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (globalKey.currentState!.validate()) {
                                  globalKey.currentState!.save();

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      behavior: SnackBarBehavior.floating,
                                      content: Text('Saves done....'),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                  Navigator.of(context).pushNamed('references');
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      behavior: SnackBarBehavior.floating,
                                      content: Text('Pleas fill all Fields..'),
                                      backgroundColor: Colors.deepOrangeAccent,
                                    ),
                                  );
                                }
                              },
                              child: const Text(
                                "Next",
                                style: TextStyle(fontSize: 25),
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
          )
        ],
      ),
    );
  }
}

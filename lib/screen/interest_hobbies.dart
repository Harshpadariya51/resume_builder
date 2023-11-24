import 'package:flutter/material.dart';

class interest_hobbies extends StatefulWidget {
  const interest_hobbies({super.key});

  @override
  State<interest_hobbies> createState() => _interest_hobbiesState();
}

class _interest_hobbiesState extends State<interest_hobbies> {
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
                    "Interest/Hobbies",
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
              height: 340,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Enter Your Skills",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: TextFormField(
                            maxLines: 1,
                            decoration: InputDecoration(
                              hintText: "C Programming, Web Technical",
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Icon(Icons.delete),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: TextFormField(
                            maxLines: 1,
                            decoration: InputDecoration(
                              hintText: "C Programming, Web Technical",
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Icon(Icons.delete),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: "+",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            var globalKey;
                            if (globalKey.currentState!.validate()) {
                              globalKey.currentState!.save();
                              Navigator.of(context).pushNamed('Carrier');
                            }
                          },
                          child: const Text("Clear"),
                        ),
                        SizedBox(width: 30),
                        ElevatedButton(
                          onPressed: () {
                            var globalKey;
                            if (globalKey.currentState!.validate()) {
                              globalKey.currentState!.save();
                              Navigator.of(context).pushNamed('Carrier');
                            }
                          },
                          child: const Text("Save"),
                        ),
                      ],
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

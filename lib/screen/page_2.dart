import 'package:flutter/material.dart';
import 'package:resume/screen/util.dart';

class Page_2 extends StatefulWidget {
  const Page_2({super.key});

  @override
  State<Page_2> createState() => _Page_2State();
}

class _Page_2State extends State<Page_2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Resume Workspace",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('resume');
              },
              child: Icon(Icons.menu),
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.blue,
              child: Center(
                child: Text(
                  "Build Options",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            ...categoryName.map((e) {
              return Container(
                height: 65,
                width: double.infinity,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Image.asset(
                      'img/${e['img']}',
                      height: 40,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      '${e['name']}',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('${e['page']}');
                      },
                      icon: const Icon(Icons.navigate_next),
                      splashRadius: 20,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

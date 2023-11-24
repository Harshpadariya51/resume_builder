import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import 'package:resume/screen/util.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';

class Resume extends StatefulWidget {
  const Resume({super.key});

  @override
  State<Resume> createState() => _ResumeState();
}

class _ResumeState extends State<Resume> {
  final pdf = pw.Document();
  final image = pw.MemoryImage(
    Global.imgPic!.readAsBytesSync(),
  );

  @override
  void initState() {
    super.initState();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Column(
            children: [
              // User pic,name,email
              pw.Expanded(
                flex: 1,
                child: pw.Container(
                  padding: pw.EdgeInsets.all(10),
                  color: PdfColors.blueGrey,
                  child: pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      // User Pic
                      pw.Align(
                        alignment: pw.Alignment(0, 0),
                        child: pw.SizedBox(
                          height: 280,
                          child: pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                            children: [
                              (Global.imgPic != null)
                                  ? pw.Image(
                                      image,
                                      fit: pw.BoxFit.cover,
                                      height: 150,
                                      width: 150,
                                    )
                                  : pw.Image('img/user.png' as pw.ImageProvider,
                                      fit: pw.BoxFit.cover, height: 30),

                              //     ? CircleAvatar(
                              //   radius: 70,
                              //   backgroundColor: Colors.grey,
                              //   backgroundImage:
                              //   FileImage(Global.imgPic!),
                              // )
                              //     : CircleAvatar(
                              //     radius: 70,
                              //     backgroundColor: Colors.blueGrey,
                              //     backgroundImage:
                              //     AssetImage('img/pic2.png')),
                            ],
                          ),
                        ),
                      ),
                      pw.SizedBox(
                        width: 35,
                      ),
                      // User Name & Email
                      pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            Global.name ??
                                '', // ignore: dead_null_aware_expression
                            style: pw.TextStyle(
                                fontSize: 17,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.white),
                          ),
                          pw.SizedBox(height: 10),
                          pw.Text(
                            Global.currentDesignation,
                            style: pw.TextStyle(
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.SizedBox(height: 5),
                          pw.Container(
                            height: 1,
                            width: 150,
                            decoration: pw.BoxDecoration(
                                border: pw.Border.all(
                                    width: 1, color: PdfColors.black)),
                          ),
                          pw.SizedBox(height: 5),
                          pw.Text(
                            ' ${Global.email}',
                            style: pw.TextStyle(fontSize: 10),
                          ),
                          pw.SizedBox(height: 5),
                          pw.Text(
                            '${Global.add1} , ${Global.add2}, \n${Global.add3}',
                            style: pw.TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              pw.Expanded(
                flex: 3,
                child: pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    // Left Side Bar .......................................
                    pw.Expanded(
                      flex: 6,
                      child: pw.Container(
                        padding: pw.EdgeInsets.all(9),
                        decoration: pw.BoxDecoration(
                          color: PdfColors.blueGrey200,
                        ),
                        child: pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: <pw.Widget>[
                            // Language
                            pw.Expanded(
                              flex: 5,
                              child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    'Personal Details',
                                    style: pw.TextStyle(
                                        fontSize: 11,
                                        fontWeight: pw.FontWeight.bold,
                                        color: PdfColors.black),
                                  ),
                                  pw.Row(
                                    children: [
                                      pw.Text(
                                        'Mo : ',
                                        style: pw.TextStyle(
                                            fontWeight: pw.FontWeight.bold,
                                            fontSize: 10),
                                      ),
                                      pw.Text(
                                        Global.phone,
                                        style: pw.TextStyle(fontSize: 11),
                                      ),
                                    ],
                                  ),
                                  pw.Row(
                                    children: [
                                      pw.Text(
                                        'DOB : ',
                                        style: pw.TextStyle(
                                            fontWeight: pw.FontWeight.bold,
                                            fontSize: 10),
                                      ),
                                      pw.Text(Global.dob),
                                    ],
                                  ),
                                  pw.Row(
                                    children: [
                                      pw.Text(
                                        'Marital Status : ',
                                        style: pw.TextStyle(
                                            fontWeight: pw.FontWeight.bold,
                                            fontSize: 10),
                                      ),
                                      pw.Text(
                                        Global.maritalStatus,
                                        style: pw.TextStyle(fontSize: 10),
                                      ),
                                    ],
                                  ),
                                  pw.Row(
                                    children: [
                                      pw.Text(
                                        'Nationality : ',
                                        style: pw.TextStyle(
                                            fontWeight: pw.FontWeight.bold,
                                            fontSize: 10),
                                      ),
                                      pw.Text(Global.nationality),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // Language
                            pw.Expanded(
                              flex: 5,
                              child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    'Languages Known',
                                    style: pw.TextStyle(
                                        fontSize: 11,
                                        fontWeight: pw.FontWeight.bold,
                                        color: PdfColors.black),
                                  ),
                                  ...Global.lang.map((e) {
                                    if (e['isSelect'] == true) {
                                      return pw.Text(' ${e['langName']}');
                                    } else {
                                      return pw.Container();
                                    }
                                  }),
                                ],
                              ),
                            ),

                            // Education : ...........
                            pw.Expanded(
                              flex: 5,
                              child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text('Education',
                                      style: pw.TextStyle(
                                          fontSize: 11,
                                          fontWeight: pw.FontWeight.bold,
                                          color: PdfColors.black)),
                                  pw.Text('Degree/Course : ',
                                      style: pw.TextStyle(
                                          fontWeight: pw.FontWeight.bold,
                                          fontSize: 10)),
                                  pw.Text(Global.courseDegree),
                                  pw.Text('College : ',
                                      style: pw.TextStyle(
                                          fontWeight: pw.FontWeight.bold,
                                          fontSize: 10)),
                                  pw.Text(Global.schoolColIns),
                                  pw.Row(
                                    children: [
                                      pw.Text('Per/CGPA : ',
                                          style: pw.TextStyle(
                                              fontWeight: pw.FontWeight.bold,
                                              fontSize: 10)),
                                      pw.Text(Global.cgpa),
                                    ],
                                  ),
                                  pw.Row(
                                    children: [
                                      pw.Text('Passing Year : ',
                                          style: pw.TextStyle(
                                              fontWeight: pw.FontWeight.bold,
                                              fontSize: 10)),
                                      pw.Text(Global.passingYear),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            // Skills....
                            pw.Expanded(
                              flex: 5,
                              child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    'Skills',
                                    style: pw.TextStyle(
                                        fontSize: 11,
                                        fontWeight: pw.FontWeight.bold,
                                        color: PdfColors.black),
                                  ),
                                  ...Global.Skills.map((e) {
                                    return (e.text != null)
                                        ? pw.Text(e.text)
                                        : pw.Container();
                                  }),
                                ],
                              ),
                            ),

                            pw.Expanded(
                              flex: 4,
                              child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    'Achievements',
                                    style: pw.TextStyle(
                                        fontSize: 11,
                                        fontWeight: pw.FontWeight.bold,
                                        color: PdfColors.black),
                                  ),
                                  ...Global.Achivements.map((e) {
                                    return (e.text != null)
                                        ? pw.Text(e.text)
                                        : pw.Container();
                                  }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Right Side Bar .......................................
                    pw.Expanded(
                      flex: 10,
                      child: pw.Container(
                        padding: pw.EdgeInsets.all(10),
                        decoration: pw.BoxDecoration(
                          borderRadius: pw.BorderRadius.only(
                              bottomRight: pw.Radius.circular(50)),
                          color: PdfColors.blueGrey100,
                        ),
                        child: pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            // Carrier Objective.................
                            pw.Text(
                              'Carrier Objective',
                              style: pw.TextStyle(
                                  fontSize: 11,
                                  fontWeight: pw.FontWeight.bold,
                                  color: PdfColors.black),
                            ),
                            pw.Text(Global.careerObj),
                            // 'Historically, surnames evolved as a way to sort people into groups - by occupation, place of origin, clan affiliation, patronage, parentage, adoption, and even physical characteristics (like red hair). Many of the modern surnames in the dictionary can be traced back to Britain and Ireland.'),
                            pw.SizedBox(height: 10),
                            // Experience .........................
                            pw.Text(
                              'Work Experience',
                              style: pw.TextStyle(
                                  fontSize: 11,
                                  fontWeight: pw.FontWeight.bold,
                                  color: PdfColors.black),
                            ),
                            pw.Row(
                              children: [
                                pw.Text(
                                  'Starting : ',
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 10),
                                ),
                                pw.Text(Global.joinDate),
                                pw.SizedBox(
                                  width: 5,
                                ),
                                if (Global.EmployedStatus != true)
                                  pw.Row(
                                    children: [
                                      pw.Text(
                                        'Ending : ',
                                        style: pw.TextStyle(
                                            fontWeight: pw.FontWeight.bold,
                                            fontSize: 10),
                                      ),
                                      pw.Text(Global.exitDate),
                                    ],
                                  )
                                else
                                  pw.Container(),
                              ],
                            ),
                            // Currently ..................
                            (Global.EmployedStatus == true)
                                ? pw.Text(
                                    'Currently',
                                    style: pw.TextStyle(
                                        fontSize: 11,
                                        fontWeight: pw.FontWeight.bold,
                                        color: PdfColors.black),
                                  )
                                : pw.Container(),
                            pw.Text(
                              Global.comName,
                              style:
                                  pw.TextStyle(fontWeight: pw.FontWeight.bold),
                            ),
                            pw.Text(
                              Global.sCI,
                              style:
                                  pw.TextStyle(fontWeight: pw.FontWeight.bold),
                            ),
                            pw.Text(Global.roles),
                            pw.SizedBox(
                              height: 5,
                            ),
                            pw.Text(
                              'Projects',
                              style: pw.TextStyle(
                                  fontSize: 11,
                                  fontWeight: pw.FontWeight.bold,
                                  color: PdfColors.black),
                            ),
                            pw.Text(
                              'Project Title : ',
                              style: pw.TextStyle(
                                fontSize: 11,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                            pw.Text(
                              Global.proTitle,
                              style: pw.TextStyle(fontSize: 10),
                            ),
                            pw.Text(
                              'Technologies : ',
                              style: pw.TextStyle(
                                fontSize: 11,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                            ...Global.technologiesList.map((e) {
                              return pw.Text(
                                e['langName'],
                                style: pw.TextStyle(fontSize: 10),
                              );
                            }),
                            pw.Text(
                              'Roles : ',
                              style: pw.TextStyle(
                                fontSize: 11,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                            pw.Text(
                              Global.proRoles,
                              style: pw.TextStyle(fontSize: 10),
                            ),
                            pw.Text(
                              'Project Desc : ',
                              style: pw.TextStyle(
                                fontSize: 11,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                            pw.Text(
                              Global.proDesc,
                              style: pw.TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 850,
          width: double.infinity,
          color: Colors.black26,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // User pic,name,email
                Container(
                  height: 170,
                  padding: EdgeInsets.all(10),
                  color: Colors.blueGrey,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // User Pic
                      Align(
                        alignment: Alignment(0, 0),
                        child: SizedBox(
                          height: 280,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              (Global.imgPic != null)
                                  ? CircleAvatar(
                                      radius: 70,
                                      backgroundColor: Colors.grey,
                                      backgroundImage:
                                          FileImage(Global.imgPic!),
                                    )
                                  : CircleAvatar(
                                      radius: 70,
                                      backgroundColor: Colors.blueGrey,
                                      backgroundImage:
                                          AssetImage('img/pic2.png')),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      // User Name & Email
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Global.name ??
                                '', // ignore: dead_null_aware_expression
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          Text(
                            Global.currentDesignation,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            height: 1,
                            width: 150,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.black)),
                          ),
                          SizedBox(height: 5),
                          Text(
                            ' ${Global.email}',
                            style: TextStyle(fontSize: 10),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '${Global.add1} , ${Global.add2}, \n${Global.add3}',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left Side Bar .......................................
                    Expanded(
                      flex: 6,
                      child: Container(
                        padding: EdgeInsets.all(9),
                        height: 650,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black26,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            // Language
                            Text(
                              'Personal Details',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Mo : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                ),
                                Text(
                                  Global.phone,
                                  style: TextStyle(fontSize: 11),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'DOB : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                ),
                                Text(Global.dob),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Marital Status : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                ),
                                Text(
                                  Global.maritalStatus,
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Nationality : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                ),
                                Text(Global.nationality),
                              ],
                            ),
                            SizedBox(height: 10),
                            // Language
                            Text(
                              'Languages Known',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            ...Global.lang.map((e) {
                              if (e['isSelect'] == true) {
                                return Text(' ${e['langName']}');
                              } else {
                                return Container();
                              }
                            }),
                            SizedBox(height: 10),
                            // Education : ...........
                            Text('Education',
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            Text('Degree/Course : ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 10)),
                            Text(Global.courseDegree),
                            Text('College : ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 10)),
                            Text(Global.schoolColIns),
                            Row(
                              children: [
                                Text('Per/CGPA : ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10)),
                                Text(Global.cgpa),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Passing Year : ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10)),
                                Text(Global.passingYear),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            // Skills....
                            Text(
                              'Skills',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            ...Global.Skills.map((e) {
                              return (e.text != null)
                                  ? Text(e.text)
                                  : Container();
                            }),
                            // Text('1. C'),
                            // Text('2. C++'),
                            // Text('3. Java'),
                            // Text('4. PHP'),
                            // Text('5. Python'),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Achievements',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            ...Global.Achivements.map((e) {
                              return (e.text != null)
                                  ? Text(e.text)
                                  : Container();
                            }),
                            // Text('1. C Certificate'),
                            // Text('2. C++ Certificate'),
                            // Text('3. Java Certificate'),
                            // Text('4. PHP Certificate'),
                            // Text('5. Python Certificate'),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Right Side Bar .......................................
                    Expanded(
                      flex: 10,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        height: 650,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10)),
                          color: Colors.grey,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Carrier Objective.................
                            Text(
                              'Carrier Objective',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(Global.careerObj),
                            // 'Historically, surnames evolved as a way to sort people into groups - by occupation, place of origin, clan affiliation, patronage, parentage, adoption, and even physical characteristics (like red hair). Many of the modern surnames in the dictionary can be traced back to Britain and Ireland.'),
                            SizedBox(height: 10),
                            // Experience .........................
                            Text(
                              'Work Experience',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Starting : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                ),
                                Text(Global.joinDate),
                                SizedBox(
                                  width: 5,
                                ),
                                if (Global.EmployedStatus != true)
                                  Row(
                                    children: [
                                      Text(
                                        'Ending : ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10),
                                      ),
                                      Text(Global.exitDate),
                                    ],
                                  )
                                else
                                  Container(),
                              ],
                            ),
                            // Currently ..................
                            (Global.EmployedStatus == true)
                                ? Text(
                                    'Currently',
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )
                                : Container(),
                            Text(
                              Global.comName,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              Global.sCI,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(Global.roles),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Projects',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              'Project Title : ',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              Global.proTitle,
                              style: TextStyle(fontSize: 10),
                            ),
                            Text(
                              'Technologies : ',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ...Global.technologiesList.map((e) {
                              return Text(
                                e['langName'],
                                style: TextStyle(fontSize: 10),
                              );
                            }),
                            Text(
                              'Roles : ',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              Global.proRoles,
                              style: TextStyle(fontSize: 10),
                            ),
                            Text(
                              'Project Desc : ',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              Global.proDesc,
                              style: TextStyle(fontSize: 10),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() async {
                                      Directory? res =
                                          await getExternalStorageDirectory();

                                      String path = res!.path;

                                      File file = File('$path/resume.pdf');

                                      await file
                                          .writeAsBytes(await pdf.save())
                                          .then((value) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            backgroundColor: Colors.green,
                                            behavior: SnackBarBehavior.floating,
                                            content: Text("Saved successfully"),
                                          ),
                                        );
                                      });
                                    });
                                  },
                                  child: const Icon(Icons.download),
                                ),
                                SizedBox(width: 10),
                                FloatingActionButton(
                                  onPressed: () async {
                                    Printing.layoutPdf(onLayout: (format) {
                                      return pdf.save();
                                    });
                                  },
                                  child: const Icon(Icons.print),
                                ),
                              ],
                            ),
                          ],
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
    );
  }
}

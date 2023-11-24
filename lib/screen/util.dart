import 'dart:io';

import 'package:flutter/material.dart';
//

class Global {
  static String name = '';
  static String email = '';
  static String phone = '';
  static String add1 = '';
  static String add2 = '';
  static String add3 = '';
  static File? imgPic;

  static String careerObj = '';
  static String currentDesignation = '';

  static String dob = '';
  static String maritalStatus = 'Single';
  static String nationality = '';

  static String courseDegree = '';
  static String schoolColIns = '';
  static String cgpa = '';
  static String passingYear = '';

  static String comName = '';
  static String sCI = '';
  static String roles = '';
  static bool EmployedStatus = true;
  static String joinDate = '';
  static String exitDate = '';

  static List<TextEditingController> Skills = [TextEditingController()];
  static String proTitle = '';
  static List<Map<String, dynamic>> technologiesList = [
    {
      'isSelect': false,
      'langName': 'Flutter',
    },
    {
      'isSelect': false,
      'langName': 'Java',
    },
    {
      'isSelect': false,
      'langName': 'Python',
    },
  ];
  static String proRoles = '';
  static String technologiesEx = '';
  static String proDesc = '';

  static List<TextEditingController> Achivements = [TextEditingController()];
  static String refName = '';
  static String designation = '';
  static String orgInstName = '';

  static String declarationDesc = '';
  static String date_decl = '';
  static String placeIntCity = '';

  static List<Map<String, dynamic>> lang = [
    {
      'isSelect': false,
      'langName': 'English',
    },
    {
      'isSelect': false,
      'langName': 'Hindi',
    },
    {
      'isSelect': false,
      'langName': 'Gujarati',
    },
  ];
}

List<Map<String, dynamic>> categoryName = [
  {
    'img': 'handshake.png',
    'name': 'Contact Info',
    'page': 'contact',
  },
  {
    'img': 'briefcase.png',
    'name': 'Carrier Objective',
    'page': 'Carrier',
  },
  {
    'img': 'user.png',
    'name': 'Personal Detail',
    'page': 'Personal_Details',
  },
  {
    'img': 'mortarboard.png',
    'name': 'Education',
    'page': 'education',
  },
  {
    'img': 'thinking.png',
    'name': 'Experiences',
    'page': 'experiences',
  },
  {
    'img': 'declaration.png',
    'name': 'Technical_Skills',
    'page': 'technical_skills',
  },
  {
    'img': 'open-book.png',
    'name': 'Interest/Hobbies',
    'page': 'interest_hobbies',
  },
  {
    'img': 'project.png',
    'name': 'Projects',
    'page': 'projects',
  },
  {
    'img': 'achievement.png',
    'name': 'Achievements',
    'page': 'achievements',
  },
  {
    'img': 'handshake.png',
    'name': 'References',
    'page': 'references',
  },
  {
    'img': 'declaration.png',
    'name': 'Declaration',
    'page': 'declaration',
  },
];

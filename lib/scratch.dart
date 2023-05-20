import 'package:flutter/material.dart';
class Doctor {
  final String name;
  final String department;
  final double rate;
  final String imgPath;
  final bool isFav;
  final int salary;
  Doctor(
      {required this.name,
        required this.department,
        required this.rate,
        required this.imgPath,
        required this.isFav,
        required this.salary});
}

List<String> urlList = [
  'https://youtu.be/ILgVZvYM1WI',
  'https://youtu.be/U_WjSAsyh-8',
  'https://youtu.be/y6NUWq_AEvI',
  'https://youtu.be/hXa9QIEGQPg',
  'https://youtu.be/wN__vnhknJw',
  'https://youtu.be/raSJqKjjUv0',
  'https://youtu.be/QPFRYUlXR2I',
  'https://youtu.be/OexLzyW8tXM',
  'https://youtu.be/sDz7uY5JdYs',
  'https://youtu.be/v4U6YE_BX08',
  'https://youtu.be/7SpA_0jLC0g',
  'https://youtu.be/CCwMevUe7lc',
];

List<Doctor> drList = [
  Doctor(
      name: 'Dr. Fillerup Garb',
      department: 'Medicine Specialist',
      rate: 3.7,
      imgPath: 'https://as2.ftcdn.net/v2/jpg/02/82/72/13/1000_F_282721302_ASa8MKXhTukl1TnIxGl56eiOQkrvK5zL.jpg',
      isFav: false,
      salary: 25),
  Doctor(
      name: 'Dr. Blessing Ross',
      department: 'Dentist',
      rate: 4,
      imgPath: 'https://as2.ftcdn.net/v2/jpg/02/69/98/91/1000_F_269989145_sP2OHMejODs0zrlkLWpB2zADAmTwljkT.jpg',
      isFav: true,
      salary: 18),
  Doctor(
      name: 'Dr. Crick Bong',
      department: 'Oncologist',
      rate: 3.5,
      imgPath: 'https://as2.ftcdn.net/v2/jpg/01/70/97/49/1000_F_170974984_vTtMiYxyEyKgshyQqcdFLjQ0WkQFULEG.jpg',
      isFav: false,
      salary: 30),
  Doctor(
      name: 'Dr. Strain Oliver',
      department: 'Oncologist',
      rate: 4.8,
      imgPath: 'https://as1.ftcdn.net/v2/jpg/01/32/94/46/1000_F_132944601_TzKWWNgwnBBsShz9UwWiUjTpoydpB5cV.jpg',
      isFav: true,
      salary: 35),
  Doctor(
      name: 'Dr. Lachinet Hades',
      department: 'Medicine Specialist',
      rate: 2.9,
      imgPath: 'https://as2.ftcdn.net/v2/jpg/02/46/36/57/1000_F_246365778_4X1uXrRyBoFq79wr3flAMv3GDGdSjA6e.jpg',
      isFav: false,
      salary: 40),
];
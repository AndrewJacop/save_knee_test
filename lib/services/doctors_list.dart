import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/doctor_class.dart';

Future<List<Doctor>> getDrList() async {
  List<Doctor> doctorsList = [];
  final _firestore = FirebaseFirestore.instance;
  final _db = await _firestore.collection('doctors').get();
  for (var doc in _db.docs) {
    Doctor doctor = Doctor(
      name: doc['name'],
      email: doc['email'],
      rate: doc['rate'],
      imgPath: doc['imgPath'],
      isFav: doc['isFav'],
      salary: doc['salary'],
      phone: doc['phone'],
    );
    doctorsList.add(doctor);
  }
  return doctorsList;
}

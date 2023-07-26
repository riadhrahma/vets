import 'package:cloud_firestore/cloud_firestore.dart';

extension Collection on String {
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> get collection =>
      _firebaseFirestore.collection(
        this,
      );
}

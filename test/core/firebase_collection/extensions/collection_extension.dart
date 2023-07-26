import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';

extension Collection on String {
  static final FakeFirebaseFirestore _firebaseFirestore =
      FakeFirebaseFirestore();

  CollectionReference<Map<String, dynamic>> get collectionTest =>
      _firebaseFirestore.collection(
        this,
      );
}

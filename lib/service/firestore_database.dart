import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreDatabase {
  CollectionReference emp = FirebaseFirestore.instance.collection('Employee');
  Future addEmpDetails(Map<String, dynamic> empInfoMap, String id) async {
    return await emp.doc(id).set(empInfoMap);
  }

  Future<Stream<QuerySnapshot>> getEmpDetails() async {
    return emp.snapshots();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreDatabase {
  Future addEmpDetails(Map<String, dynamic> empInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection('Employee')
        .doc(id)
        .set(empInfoMap);
  }
}

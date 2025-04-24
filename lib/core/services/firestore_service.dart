import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hub/core/services/database_service.dart';

class FireStoreService implements DatabaseService {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? id,
  }) async {
    if (id != null) {

      await fireStore.collection(path).doc(id).set(data);
      return;
    } else {
      await fireStore.collection(path).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String path,
    required String id,
  }) async {
    var data = await fireStore.collection(path).doc(id).get();
    return data.data() as Map<String, dynamic>;
  }

  @override
  Future<bool> isUserExist({
    required String path,
    required String id,
  }) async {
    var data = await fireStore.collection(path).doc(id).get();
    return data.exists;
  }
}

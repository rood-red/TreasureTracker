import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:treasure_tracker/services/models/user_details_model.dart';

class FirestoreService extends GetxService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<UserDetails>> fetchUsers() async {
    try {
      QuerySnapshot querySnapshot = await _db.collection('user_details').get();

      List<UserDetails> users = querySnapshot.docs.map((doc) {
        return UserDetails.fromFirestore(doc.data() as Map<String, dynamic>);
      }).toList();

      return users;
    } catch (e) {
      throw Exception('Error fetching users: $e');
    }
  }

  Future<bool> firebaseLogin(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}

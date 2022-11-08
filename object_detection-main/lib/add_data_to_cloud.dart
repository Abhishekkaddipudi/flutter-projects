import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> addToCloud(String displayname, String email) async {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  FirebaseAuth _auth = FirebaseAuth.instance;
  String uid = _auth.currentUser.uid.toString();
  users.add({'uid': uid, 'displayName': displayname, 'email': email});

  return;
}

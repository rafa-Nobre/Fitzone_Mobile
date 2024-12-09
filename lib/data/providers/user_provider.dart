import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitzone_app/core/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  UserModel? _currentUser;

  UserModel? get currentUser => _currentUser;

  Future<void> setCurrentUser() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await FirebaseFirestore.instance.collection('users').where('email', isEqualTo: auth.currentUser!.email).get().then((value) {
      var user = value.docs.first.data();
      _currentUser = UserModel.fromJson(user);
    });
    notifyListeners();
  }
}
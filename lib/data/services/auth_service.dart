import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitzone_app/common/constants/responses.dart';

import '../../core/models/user_model.dart';

class AuthService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signUp({required String email, required String password, required String name, required String cpf, required String nickname}) async {
    late String responseMessage;

    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      UserModel newUser = UserModel(id: credential.user!.uid, registrationId: '${DateTime.now().year}/$cpf', name: name, nickName: nickname, email: email, cpf: cpf, password: password, registrationDate: DateTime.now(), points: 0, activities: [], events: []);
      _firestore.collection("users").doc(credential.user!.uid).set(newUser.toJson());
      responseMessage = sucessMessage;
    } catch (_) {
      responseMessage = errorMessage;
    }
    return responseMessage;
  }

  Future<String> signIn({required String email, required String password}) async {
    late String responseMessage;

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      responseMessage = sucessMessage;
    } catch(_) {
      responseMessage = errorMessage;
    }

    return responseMessage;
  }

  Future<String> resetPassword({required String email}) async {
    late String responseMessage;

    try {
      await _auth.sendPasswordResetEmail(email: email);
      responseMessage = sucessMessage;
    } catch(_) {
      responseMessage = errorMessage;
    }

    return responseMessage;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
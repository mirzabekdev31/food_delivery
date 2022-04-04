import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../model/user.dart';

class AuthViewModel extends ChangeNotifier {
  var _status = AuthStatus.NOT_SIGN_IN;

  String _errorMessage = "";
  MyUser? _currentUser;


  String get errorMessage {
    return _errorMessage;
  }

  AuthStatus get authStatus {
    return _status;
  }

  set authStatus(status) {
    _status = status;
  }

  MyUser? get currentUser {
    return _currentUser;
  }



  createUser(name, email, pass) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pass)
          .then((current) {
        MyUser user = MyUser(
            id: current.user?.uid,
            fullName: name,
            email: email,
            userRole: 'user',);
        saveCredentials(user, pass: pass);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        _errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        _errorMessage = 'The account already exists for that email.';
      }
    } catch (e) {
      _errorMessage = e.toString();
      //print(e);
    }
  }
  saveCredentials(MyUser user, {pass, credential}) async {
    final CollectionReference userCollections =
    FirebaseFirestore.instance.collection('users');
    try {
      final userDoc = userCollections.doc(user.id);
      await userDoc.set(user.toJson());
      signIn(user.email, pass);
      notifyListeners();
    } catch (e) {
      print("user-collection-exception: $e");
    }
  }


  signIn(email, pass) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass)
          .then((value) {
        _status = AuthStatus.COMPLETED;
        notifyListeners();
      });
    } on FirebaseAuthException catch (e) {

      if (e.code == 'user-not-found') {
        _errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        _errorMessage = 'Wrong password provided for that user.';
      }
    } catch (e) {
      _errorMessage = e.toString();
    }
  }

   getCurrentUser() async {
    final id = FirebaseAuth.instance.currentUser?.uid;
    var currentUser =
    await FirebaseFirestore.instance.collection('users').doc(id).get();

    final userData = currentUser.data();

    currentUser = MyUser.fromData(userData!) as DocumentSnapshot<Map<String, dynamic>>;
    notifyListeners();
  }

}

enum AuthStatus { NOT_SIGN_IN, LOADING, COMPLETED, ERROR }

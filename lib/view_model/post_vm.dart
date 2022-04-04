import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../model/food_model.dart';

class PizzaViewModel extends ChangeNotifier {
  MyFood? _currentPost;

  MyFood? get currentPost {
    return _currentPost;
  }

  getCurrentPost() async {
    final id = FirebaseAuth.instance.currentUser?.uid;
    final currentUser =
    await FirebaseFirestore.instance.collection('pizza_foods').doc(id).get();

    final userData = currentUser.data();

    _currentPost = MyFood.fromJson(userData!);
    notifyListeners();
  }

  CollectionReference<MyFood> fetchPosts() {
    return FirebaseFirestore.instance
        .collection('pizza_foods')
        .withConverter<MyFood>(
      fromFirestore: (snapshots, _) => MyFood.fromJson(snapshots.data()!),
      toFirestore: (post, _) => post.toJson(),
    );
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../models/user_model.dart';

class UserProvider with ChangeNotifier {
  UserModel currentData = UserModel(
    userEmail: '',
    userImage: '',
    userName: '',
    userUid: '',
  );

  UserProvider() {
    // Call getUserData when creating an instance of UserProvider
    getUserData();
  }

  Future<void> addUserData({
    required User currentUser,
    required String userName,
    required String userEmail,
    required String userImage,
  }) async {
    await FirebaseFirestore.instance
        .collection("usersData")
        .doc(currentUser.uid)
        .set(
      {
        "userName": userName,
        "userEmail": userEmail,
        "userImage": userImage,
        "userUid": currentUser.uid,
      },
    );
  }

  Future<void> getUserData() async {
    var value = await FirebaseFirestore.instance
        .collection("usersData")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();

    if (value.exists) {
      UserModel userModel = UserModel(
        userEmail: value.get('userEmail'),
        userImage: value.get('userImage'),
        userName: value.get('userName'),
        userUid: value.get('userUid'),
      );
      currentData = userModel;
      notifyListeners();
    }
  }

  UserModel get currentUserData {
    return currentData;
  }
}

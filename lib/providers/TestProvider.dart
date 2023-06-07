import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/TestModel.dart';

class TestProvider with ChangeNotifier {
  List<TestModel> premiumAdsList = [];

  Future<void> fetchPremiumAdsData() async {
    List<TestModel> newList = [];

    QuerySnapshot querySnapshotValue = await FirebaseFirestore.instance
        .collectionGroup("YourPremiumAds")
        .orderBy('timestamp', descending: true)
        .where("adminApproved", isEqualTo: false)
        .get();

    querySnapshotValue.docs.forEach((element) {
      TestModel test = TestModel(
        id: element.id,
        description: element.get("description"),
        phoneNumber: element.get("phoneNumber"),
        imageURL: element.get("imageURL"),
        adminApproved: element.get("adminApproved"),
        timestamp: element.get("timestamp").toDate(),
      );

      newList.add(test);
    });

    premiumAdsList = newList;
    notifyListeners();
  }

  List<TestModel> get fetchPremiumAdsDataList {
    return premiumAdsList;
  }
}

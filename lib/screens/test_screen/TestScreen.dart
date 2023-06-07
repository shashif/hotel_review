import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../models/TestModel.dart';
import '../../providers/TestProvider.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TestProvider>(
      builder: (context, testProvider, _) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: testProvider.fetchPremiumAdsDataList.length,
          itemBuilder: (context, index) {
            TestModel ad = testProvider.fetchPremiumAdsDataList[index];
            return Container(
              color: Colors.grey[200],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(ad.description),
                  Text(ad.phoneNumber),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

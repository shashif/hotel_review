import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/user_model.dart';
import '../../providers/user_provider.dart';



class CurrentUserHomeScreen extends StatelessWidget {
  const CurrentUserHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    UserModel currentUser = userProvider.currentUserData;

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome, ${currentUser.userName}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text('Email: ${currentUser.userEmail}'),
            SizedBox(height: 10),
            Text('UID: ${currentUser.userUid}'),
            SizedBox(height: 10),
            // You can display additional user data as needed
            // such as user image, etc.
          ],
        ),
      ),
    );
  }
}

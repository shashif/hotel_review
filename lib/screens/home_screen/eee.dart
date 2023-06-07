import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/user_model.dart';
import '../../providers/user_provider.dart';



class ShowCurrentUserScreen extends StatelessWidget {
  const ShowCurrentUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    UserModel currentUserData = userProvider.currentUserData;

    return Scaffold(
      appBar: AppBar(
        title: Text('Current User Data'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('User Name: ${currentUserData.userName}'),
          Text('User Email: ${currentUserData.userEmail}'),
          Text('User Image: ${currentUserData.userImage}'),
        ],
      ),
    );
  }
}

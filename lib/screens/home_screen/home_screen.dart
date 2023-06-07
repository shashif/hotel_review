import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel_review/providers/ads_provider.dart';
import 'package:hotel_review/widgets/color_widget.dart';

import 'package:provider/provider.dart';

import '../../providers/BasicInfoProvider.dart';
import '../../providers/user_provider.dart';
import '../../widgets/drawer_widget.dart';
import '../../widgets/global_var.dart';
import '../../widgets/homepage_premimum_ads.dart';
import '../free_post_screen/free_post_screen.dart';
import '../google_map/LocationScreen.dart';
import '../google_map/google_map.dart';
import '../profile_screen/profile_screen.dart';
import '../search_product/search_product.dart';
import '../splash_screen/splash_screen.dart';
import '../test_screen/TestScreen.dart';
import 'CurrentUserHomeScreen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String userName = '', userEmail = '', userImage = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      AdsProvider initadsProvider = Provider.of(context, listen: false);
      initadsProvider.fetchPremiumAdsData();

      BasicInfoProvider basicInfoProvider =
      Provider.of(context, listen: false);
      basicInfoProvider.addBasicAppInfo();
      basicInfoProvider.readBasicAppInfo();

      getUserData();
    });
  }

  getUserData() {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance
        .collection('usersData')
        .doc(uid)
        .get()
        .then((value) async {
      if (value.exists) {
        setState(() {
          userName = value.data()!['userName'];
          userEmail = value.data()!['userEmail'];
          userImage = value.data()!['userImage'];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of(context);
    userProvider.getUserData();
    var userData = userProvider.currentUserData;

    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: primaryColor,
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontFamily: 'Lobster',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) =>  ProfileScreen(userData:userData)));
            },
            child: Icon(Icons.person_outline, color: Colors.black54),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SearchProduct()),
              );
            },
            child: Icon(Icons.search_outlined, color: Colors.black54),
          ),
          TextButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SplashScreen()),
              );
            },
            child: Icon(Icons.login_outlined, color: Colors.black54),
          ),
        ],
      ),
      drawer: DrawerWidget(),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Post',
        child: Icon(Icons.cloud_upload),
        backgroundColor: primaryColor,
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => FreePostScreen(userData: userData),
            ),
          );
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HomePagePremiumAds(),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TestScreen(),
                      ),
                    );
                  },
                  child: Text('Test screen'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CurrentUserHomeScreen(),
                      ),
                    );
                  },
                  child: Text('Current user screen'),
                ),
                Text(userName),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

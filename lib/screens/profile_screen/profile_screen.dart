// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../models/user_model.dart';
// import '../../providers/user_provider.dart';
// import '../../widgets/color_widget.dart';
// import '../../widgets/drawer_widget.dart';
//
//
// class ProfileScreen extends StatefulWidget {
//   UserModel userData;
//
//   ProfileScreen({required this.userData});
//
//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//   Widget listTile({required IconData icon, required String title}) {
//     return Column(
//       children: [
//         Divider(
//           height: 1,
//         ),
//         ListTile(
//           leading: Icon(icon),
//           title: Text(title),
//           trailing: Icon(Icons.arrow_forward_ios),
//         )
//       ],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     UserProvider userProvider = Provider.of(context);
//     userProvider.getUserData();
//     return Scaffold(
//       backgroundColor: primaryColor,
//       appBar: AppBar(
//         backgroundColor: primaryColor,
//         elevation: 0.0,
//         title: Text(
//           'My Profile',
//           style: TextStyle(
//             fontSize: 18,
//             color: textColor,
//             fontFamily:'Lobster',
//           ),
//         ),
//       ),
//       drawer: DrawerWidget(userProvider: userProvider),
//       body: Stack(
//         children: [
//           Column(
//             children: [
//               Container(
//                 height: 100,
//                 color: primaryColor,
//               ),
//               Container(
//                 height: 548,
//                 width: double.infinity,
//                 padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                 decoration: BoxDecoration(
//                   color: scaffoldBackgroundColor,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(30),
//                     topRight: Radius.circular(30),
//                     bottomLeft: Radius.circular(30),
//                     bottomRight: Radius.circular(30),
//                   ),
//                 ),
//                 child: ListView(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Container(
//                           width: 250,
//                           height: 80,
//                           padding: EdgeInsets.only(left: 20),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(widget.userData.userName,
//                                       style: TextStyle(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.bold,
//                                         color: textColor,
//                                       )),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Text(widget.userData.userEmail),
//                                 ],
//                               ),
//                               CircleAvatar(
//                                 radius: 15,
//                                 backgroundColor: primaryColor,
//                                 child: CircleAvatar(
//                                   radius: 12,
//                                   child: Icon(
//                                     Icons.edit,
//                                     color: primaryColor,
//                                   ),
//                                   backgroundColor: scaffoldBackgroundColor,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     listTile(icon: Icons.shop, title: 'My Order'),
//                     listTile(
//                         icon: Icons.location_on_outlined,
//                         title: 'My Delivery Address'),
//                     listTile(
//                         icon: Icons.person_outline, title: 'Refer a friend'),
//                     listTile(
//                         icon: Icons.file_copy_outlined,
//                         title: 'Terms & Conditions'),
//                     listTile(
//                         icon: Icons.policy_outlined, title: 'Privacy Policy'),
//                     listTile(icon: Icons.add_chart_outlined, title: 'About'),
//                     listTile(icon: Icons.exit_to_app_outlined, title: 'Logout'),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 40, left: 30),
//             child: CircleAvatar(
//               radius: 50,
//               backgroundColor: primaryColor,
//               child: CircleAvatar(
//                 backgroundImage: NetworkImage(widget.userData.userImage??""),
//                 radius: 45,
//                 backgroundColor: scaffoldBackgroundColor,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
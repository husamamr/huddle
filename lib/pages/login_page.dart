// import 'package:flutter/material.dart';
// import 'package:huddle/components/Text_Field.dart';
// class login_page extends StatelessWidget {
//   const login_page({Key? key}) : super(key: key);
//   final usernameController = TextEditingController();
//   final passwordController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.orange,
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             children: const [
//               SizedBox(height: 50,),
//               Text(
//                   "Huddle --alpha",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontWeight: FontWeight.bold ),
//
//               ),
//               SizedBox(height: 50,),
//               text_field(
//                 controller: usernameController,
//                 hintText: "user name",
//                 obsecureText: false,
//               ),
//               SizedBox(height: 10,),
//               text_field(
//                 controller: passwordController,
//                 hintText: "password",
//                 obsecureText: true,
//               ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

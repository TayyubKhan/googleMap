// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_geocoder/geocoder.dart';
//
// class SecondScreen extends StatefulWidget {
//   const SecondScreen({super.key});
//
//   @override
//   State<SecondScreen> createState() => _SecondScreenState();
// }
//
// class _SecondScreenState extends State<SecondScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           InkWell(
//             onTap: () async {
//               final coordinates = Coordinates(30.122490, 77.717216);
//               var address = await Geocoder.local
//                   .findAddressesFromCoordinates(coordinates);
//               var first = address.first;
//               if (kDebugMode) {
//                 print(first.adminArea);
//               }
//             },
//             child: Container(
//               height: 50,
//               decoration: const BoxDecoration(color: Colors.blueAccent),
//               child: const Center(child: Text('Convert')),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

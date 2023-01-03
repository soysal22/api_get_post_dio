// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_api/post_model.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   // List<PostModel>? _itemsListe;

//   // Future<void> postGet() async {
//   //   final connection =
//   //       await Dio().get('https://jsonplaceholder.typicode.com/posts');

//   //   final veri = connection.statusCode;

//   //   if (veri == HttpStatus.ok) {
//   //     var datas = connection.data;
//   //     if (datas is List) {
//   //       setState(() {
//   //         _itemsListe = datas.map((e) => PostModel.fromJson(e)).toList();
//   //       });
//   //     }
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('I am a Rich But \nI dont have a money'),
//         centerTitle: true,
//       ),
//       body: ListView.builder(
//         itemCount: _itemsListe?.length ?? 0,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
//             child: Card(
//               color: Colors.amber,
//               shape: const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(30),
//                       bottomRight: Radius.circular(30))),
//               child: ListTile(
//                 title: Text(
//                   _itemsListe?[index].title ?? '',
//                   style: Theme.of(context)
//                       .textTheme
//                       .subtitle1
//                       ?.copyWith(color: Colors.red),
//                 ),
//                 subtitle: Text(_itemsListe?[index].body ?? ''),
//                 leading: Text(_itemsListe?[index].id.toString() ?? ''),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class PostCard extends StatelessWidget {
//   const PostCard({
//     Key? key,
//     required PostModel? liste,
//   })  : _liste = liste,
//         super(key: key);

//   final PostModel? _liste;
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.only(top: 20),
//         child: ListTile(
//           title: Text(
//             _liste?.title ?? '',
//             style: Theme.of(context)
//                 .textTheme
//                 .subtitle1
//                 ?.copyWith(color: Colors.red),
//           ),
//           subtitle: Text(_liste?.body ?? ''),
//           leading: Text(_liste?.id.toString() ?? ''),
//         ),
//       ),
//     );
//   }
// }

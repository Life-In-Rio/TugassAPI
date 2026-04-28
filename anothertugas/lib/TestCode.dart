// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class MainPage extends StatefulWidget {
//   const MainPage({super.key});

//   @override
//   State<MainPage> createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   List products = [];
//   bool isLoading = true;
//   String search = '';

//   @override
//   void initState() {
//     super.initState();
//     fetchProducts();
//   }

//   Future fetchProducts() async {
//     final response = await http.get(
//       Uri.parse('https://dummyjson.com/products'),
//     );

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       setState(() {
//         products = data['products'];
//         isLoading = false;
//       });
//     } else {
//       throw Exception('Gagal ambil data');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final filtered = products.where((item) {
//       return item['title'].toLowerCase().contains(search.toLowerCase());
//     }).toList();
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 80,
//         backgroundColor: const Color.fromARGB(255, 246, 73, 20),
//         title: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Expanded(
//               child: Container(
//                 height: 45,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.1),
//                       blurRadius: 8,
//                       offset: Offset(0, 3),
//                     ),
//                   ],
//                 ),
//                 child: TextField(
//                   onChanged: (value) {
//                     setState(() {
//                       search = value;
//                     });
//                   },
//                   decoration: const InputDecoration(
//                     hintText: "Search...",
//                     prefixIcon: Icon(Icons.search),
//                     suffixIcon: Icon(Icons.camera_alt),
//                     border: InputBorder.none,
//                   ),
//                 ),
//               ),
//             ),

//             const SizedBox(width: 20),

//             Container(
//               padding: EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 shape: BoxShape.circle, // 🔥 bikin bulat
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.1),
//                     blurRadius: 6,
//                   ),
//                 ],
//               ),
//               child: Icon(Icons.shopping_cart_outlined),
//             ),
//             const SizedBox(width: 20),
//             Container(
//               padding: EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 shape: BoxShape.circle, // 🔥 bikin bulat
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.1),
//                     blurRadius: 6,
//                   ),
//                 ],
//               ),
//               child: Icon(Icons.chat_bubble_outline),
//             ),
//           ],
//         ),
//       ),
//       body: isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: GridView.builder(
//                 itemCount: filtered.length,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 8,
//                   mainAxisSpacing: 8,
//                   childAspectRatio: 0.7,
//                 ),
//                 itemBuilder: (context, index) {
//                   final item = filtered[index];

//                   return Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(12),
//                       border: Border.all(color: Colors.grey.shade300),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // gambar dari API
//                         Expanded(
//                           flex: 8,
//                           child: ClipRRect(
//                             borderRadius: const BorderRadius.vertical(
//                               top: Radius.circular(12),
//                             ),
//                             child: Image.network(
//                               item['thumbnail'],
//                               fit: BoxFit.cover,
//                               width: double.infinity,
//                             ),
//                           ),
//                         ),

//                         // text area
//                         Expanded(
//                           flex: 4,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   item['title'],
//                                   maxLines: 2,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 4),
//                                 Text(
//                                   "\$ ${item['price']}",
//                                   style: const TextStyle(color: Colors.red),
//                                 ),
//                                 Text(
//                                   (item['brand'] ?? '').toString(),
//                                   style: const TextStyle(color: Colors.grey),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//     );
//   }
// }

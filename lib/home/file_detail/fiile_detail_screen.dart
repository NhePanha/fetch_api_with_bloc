import 'package:flutter/material.dart';
import 'package:auth_with_api/model/file_product_list.dart';
class FileDetailScreen extends StatefulWidget {
  final Datum products;
  const FileDetailScreen({super.key, required this.products});
  @override
  State<FileDetailScreen> createState() => _FileDetailScreenState();
}
class _FileDetailScreenState extends State<FileDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity, //color: Colors.amber,
          ),
          Positioned(
            top: 300,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              width: double.infinity,
              height: 800,
            ),
            
          ),
          Positioned(
            top: 70,left: 150,right: 150,
            child: Container(
            width: 150,height: 150,color: Colors.pink,
            child: Center(
              child: Image.network(widget.products.image,width: 100,height: 100,fit: BoxFit.cover,),
            ),
          ))
        ],
      ),
    );
  }
}
// appBar: AppBar(
//         title: Text(widget.products.productName ?? 'Product Detail'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               widget.products.productName ?? 'No Name',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Text(widget.products.description ?? 'No Description'),
//             // Add more product fields here if available
//           ],
//         ),
//       ),
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class ProductDetailPage extends StatefulWidget {
  final dynamic item;
  const ProductDetailPage({Key? key,required this.item}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item['title'].toString()),
        backgroundColor: Colors.grey,
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
          Container(child: widget.item['image'] != null ? Image.network( widget.item['image']) : null,),
          Text(widget.item['title'].toString(),style:AppTextStyle.heading1,),
          Text(widget.item['price'].toString()),
          Text(widget.item['description'].toString()),
          Text(widget.item['category'].toString()),
        
        
        ],),
      )
      
    );
  }
}
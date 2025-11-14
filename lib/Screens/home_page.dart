import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:theme/components/product_detail_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

List products = [];
bool isLoading = false;

void initState() {
  super.initState();
  loadProducts();
}


Future<void> loadProducts() async {
  try{
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      setState(() {
        products = json.decode(response.body);
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  } catch (e) {
    setState(() {
      isLoading = false;
    });
  }
}
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: isLoading ? CircularProgressIndicator()
         : ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final item = products[index];
            return ProductListCard(item);
          },
        ),
      ),
    );
  }

  Widget ProductListCard(dynamic item){
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(item:item))),
      child: Card(
        elevation: 5,
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.hardEdge,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: item['image'] != null ? Image.network(item['image']) : null,
            title: Text(item['title'], style: TextStyle(overflow: TextOverflow.ellipsis),),
            subtitle: Text(item['price'].toString()),
          ),
        ),
       
      )
      );
  }
}
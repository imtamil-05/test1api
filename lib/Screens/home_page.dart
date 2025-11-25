import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:theme/Provider/cart_provider.dart';
import 'package:theme/Screens/cart_page.dart';
import 'dart:convert';
import 'package:theme/components/product_detail_page.dart';
import 'package:theme/Model/ProductModel.dart';
import 'package:theme/servies/api_services.dart';
class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

List<Productmodel> _shows = [];
bool isLoading = true;

void initState() {
  super.initState();
  loadshows();
}


Future<void> loadshows() async {
  _shows =await ApiServices.fetchshows();
  setState(() {
    isLoading = false;
  });
}


// Future<void> loadProducts() async {
//   try{
//     final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
//     if (response.statusCode == 200) {
//       setState(() {
//         products = json.decode(response.body);
//         isLoading = false;
//       });
//     } else {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   } catch (e) {
//     setState(() {
//       isLoading = false;
//     });
//   }
// }
  
  
  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage())),
              ),
              if(cart.items.isNotEmpty)
               Positioned(
                top: 10,
                right: 10,
                child:CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.red,
                  child: Text(cart.items.length.toString(),
                  style: TextStyle(fontSize:8, color: Colors.white),),
                  ),
              )
          ])
        ],
      ),
      body: isLoading 
      ? Center(child: CircularProgressIndicator())
      : ListView.builder(
        itemCount: _shows.length,
        itemBuilder: (context, index) {
          final item = _shows[index];
          return ProductListCard(item);
        },
      )
      // body: Center(
      //   child: isLoading ? CircularProgressIndicator()
      //    : ListView.builder(
      //     itemCount: products.length,
      //     itemBuilder: (context, index) {
      //       final item = products[index];
      //       return ProductListCard(item);
      //     },
      //   ),
      // ),
    );
  }

  Widget ProductListCard(Productmodel item){
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(item: item))),
      child: Card(
        elevation: 5,
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.hardEdge,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: item.image != null ? Image.network(item.image) : null,
            title: Text(item.name, style: TextStyle(overflow: TextOverflow.ellipsis),),
            subtitle: Text(item.price.toString()),
          ),
        ),
       
      )
      );
  }
}
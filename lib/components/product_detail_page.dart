import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme/Model/ProductModel.dart';
import 'package:theme/Provider/cart_provider.dart';
import 'package:theme/Screens/cart_page.dart';
import 'package:theme/theme.dart';

class ProductDetailPage extends StatefulWidget {
  final Productmodel item;
  const ProductDetailPage({Key? key,required this.item}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {

  @override
  Widget build(BuildContext context) {
    var cart =context.watch<CartProvider>();
    final size=MediaQuery.of(context).size;
    final screenheight=size.height;
    final screenwidth=size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.name),

        backgroundColor: Colors.grey,
      ),
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
            Container(
              height: screenheight*0.3,
              width: screenwidth,
              child: widget.item.image!= null ? Image.network(widget.item.image) : null,),
            SizedBox(height: screenheight*0.02,),
            Text(widget.item.name.toString(),style:AppTextStyle.heading1,),
            SizedBox(height: screenheight*0.02,),
            Text("${widget.item.price.toStringAsFixed(2)}"),
            SizedBox(height: screenheight*0.02,),
            Text(widget.item.summary.toString(),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style:TextStyle(fontSize: screenwidth*0.05),),
            SizedBox(height: screenheight*0.02,),
            Text(widget.item.category.toString()),
            SizedBox(height: screenheight*0.02,),
          
          ],),
        ),
      ),
      bottomNavigationBar: Padding(padding: EdgeInsets.all(screenwidth*0.05),
      child: ElevatedButton(onPressed: (){
        cart.addToCart(widget.item);
        Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Added to cart")));
      }, 
    
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Add to Cart",
          style: TextStyle(fontSize: screenwidth*0.05,fontWeight: FontWeight.bold),
          ), 
          Icon(Icons.add_shopping_cart),
        ],
      )),),
    );
  }
}
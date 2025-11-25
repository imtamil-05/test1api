import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme/Provider/cart_provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({ Key? key }) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    var cart =context.watch<CartProvider>();
    var items=cart.items.values.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),),

      body:items.isEmpty?Center(child: Text("Cart is empty"),):ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          final qty=cart.quantities[item.id]!;
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              leading: item.image != null ? Image.network(item.image) : null,
              title: Text(items[index].name.toString()),
              subtitle: Text("${items[index].price} * $qty= ${items[index].price * qty}".toString()),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: ()=>cart.decreaseQty(item.id), icon: Icon(Icons.remove)),
                  Text(qty.toString()),
                  IconButton(onPressed: ()=>cart.increaseQty(item.id), icon: Icon(Icons.add)),
                ],




              ),
            ),
          );
        },
        
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("Total: ${cart.totalPrice}"),
            ElevatedButton(onPressed: (){}, child: Text("Checkout")),

          ],
        ),
      ),
    );
  }
}
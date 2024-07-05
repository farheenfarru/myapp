import 'package:flutter/material.dart';

// Define a class for CartItem
class CartItem {
  final String name;
  final String imageUrl;

  CartItem({required this.name, required this.imageUrl});
}

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Example list of items in cart with images
  List<CartItem> items = [
    CartItem(
      name: 'Item 1',
      imageUrl: 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2021/02/05/Baked-Feta-Pasta-4_s4x3.jpg.rend.hgtvcom.1280.960.suffix/1615916524567.jpeg',
    ),
    CartItem(
      name: 'Item 2',
      imageUrl: 'https://www.subbuskitchen.com/wp-content/uploads/2014/01/Veg-Noodles.jpg',
    ),
    CartItem(
      name: 'Item 3',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpFP_jVGR4lAKi1VTsgNmh2wrUTwZq_o935w&s',
    ),
    CartItem(
      name: 'Item 4',
      imageUrl: 'https://i.ytimg.com/vi/naf0rfUjr_A/maxresdefault.jpg',
    ),
  ];

  void removeItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index].name),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(items[index].imageUrl),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => removeItem(index),
            ),
          );
        },
      ),
    );
  }
}

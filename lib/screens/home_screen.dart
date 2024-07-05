import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../widgets/product_item.dart';

class HomeScreen extends StatelessWidget {
  final List<Product> loadedProducts = [
    Product(
      id: 'p1',
      title: 'Burger',
      imageUrl: 'https://www.allrecipes.com/thmb/5JVfA7MxfTUPfRerQMdF-nGKsLY=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/25473-the-perfect-basic-burger-DDMFS-4x3-56eaba3833fd4a26a82755bcd0be0c54.jpg',
      price: 5.99,
    ),
    Product(
      id: 'p2',
      title: 'Pizza',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFb-QOETAw_2smnhPtCqsh8A1KTeBnpYEBTQ&s',
      price: 9.99,
    ),
    Product(
      id: 'p3',
      title: 'Pasta',
      imageUrl: 'https://images.immediate.co.uk/production/volatile/sites/30/2021/04/Pasta-alla-vodka-f1d2e1c.jpg',
      price: 7.99,
    ),
    Product(
      id: 'p4',
      title: 'Salad',
      imageUrl: 'https://cdn.jwplayer.com/v2/media/wGEqBtuf/thumbnails/qSXwlEH3.jpg',
      price: 4.99,
    ),
    Product(
      id: 'p5',
      title: 'Sandwich',
      imageUrl: 'https://staticcookist.akamaized.net/wp-content/uploads/sites/22/2021/12/egg1-1200x675.jpg',
      price: 6.99,
    ),
    Product(
      id: 'p6',
      title: 'Sushi',
      imageUrl: 'https://cdn.britannica.com/52/128652-050-14AD19CA/Maki-zushi.jpg',
      price: 12.99,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Text(
            'Available Orders',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: loadedProducts.length,
            itemBuilder: (ctx, i) => ProductItem(
              loadedProducts[i].id,
              loadedProducts[i].title,
              loadedProducts[i].imageUrl,
              loadedProducts[i].price,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
          ),
        ),
      ],
    );
  }
}

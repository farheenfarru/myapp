import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../models/product_model.dart';
import '../widgets/product_item.dart';

class CategoriesScreen extends StatelessWidget {
  final List<String> imageUrls = [
    'https://img.freepik.com/free-vector/flat-design-food-sale-background_23-2149173813.jpg', // Placeholder URL 1
    'https://s.tmimgcdn.com/scr/1200x750/301900/food-web-banner-social-media-cover-banner-food-discount-sale-offer-template-social-media-design_301900-original.jpg', // Placeholder URL 2
    'https://scr.templatemonster.com/301900/301901-original.jpg', // Placeholder URL 3
  ];

  final List<Product> categoryProducts = [
    Product(
      id: 'p1',
      title: 'Sushi',
      imageUrl: 'https://cdn.britannica.com/52/128652-050-14AD19CA/Maki-zushi.jpg',
      price: 14.99,
    ),
    Product(
      id: 'p2',
      title: 'Steak',
      imageUrl: 'https://www.inspiredtaste.net/wp-content/uploads/2023/06/Grilled-Steak-1-1200.jpg',
      price: 19.99,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Text(
            'Offers of the Month',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 200,
          child: CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 16 / 9,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
            ),
            items: imageUrls.map((imageUrl) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Text(
            'Recent Searches',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        GridView.builder(
          padding: const EdgeInsets.all(10.0),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: categoryProducts.length,
          itemBuilder: (ctx, i) => ProductItem(
            categoryProducts[i].id,
            categoryProducts[i].title,
            categoryProducts[i].imageUrl,
            categoryProducts[i].price,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
        ),
      ],
    );
  }
}

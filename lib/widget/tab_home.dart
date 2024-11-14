import 'package:flutter/material.dart';
import 'package:kioway/models/product.dart';
import 'package:kioway/models/shop_by_category.dart';
import 'product_cart.dart';

class HomeTab extends StatelessWidget {
  final List<ShopByCategory> product;

  const HomeTab({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final products = product.expand((shop) => shop.products).toList();
    for (var p in products) {
      print('Product Name: ${p..name}, Price: ${p.price}');
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Best Sellings',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      'See More',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
                children: product[0].products.map((product) {
                  return ProductCart(
                    id: product.id,
                    name: product.name,
                    shopId: product.shopId,
                    price: product.price,
                    rating: product.rating,
                    isFavorite: product.isFavorite,
                    disCountAmount: product.disCountAmount,
                    imageUrl: product.imageUrl,
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Trending Product',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      'See More',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
                children: product[0].products.map((product) {
                  return ProductCart(
                    id: product.id,
                    name: product.name,
                    shopId: product.shopId,
                    price: product.price,
                    rating: product.rating,
                    isFavorite: product.isFavorite,
                    disCountAmount: product.disCountAmount,
                    imageUrl: product.imageUrl,
                  );
                }).toList(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'All Product',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
                children: product[0].products.map((product) {
                  return ProductCart(
                    id: product.id,
                    name: product.name,
                    shopId: product.shopId,
                    price: product.price,
                    rating: product.rating,
                    isFavorite: product.isFavorite,
                    disCountAmount: product.disCountAmount,
                    imageUrl: product.imageUrl,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:kioway/models/product.dart';

class ShopByCategory {
  final int id;
  final int categoryId;
  final String shopName;
  final String imageUrl;
  List<Product> products;
  ShopByCategory({
    required this.id,
    required this.categoryId,
    required this.shopName,
    required this.imageUrl,
    required this.products,
  });

  static List<ShopByCategory> shopByCategoryList = [
    ShopByCategory(
      id: 1,
      categoryId: 1,
      shopName: 'Nisa Shop',
      imageUrl:
          'https://static.vecteezy.com/system/resources/previews/016/693/155/non_2x/modern-beauty-logo-design-free-png.png',
      products:
          Product.productList.where((product) => product.shopId == 1).toList(),
    ),
    ShopByCategory(
      id: 2,
      categoryId: 2,
      shopName: 'Frida Shop',
      imageUrl:
          'https://cdna.artstation.com/p/assets/images/images/020/118/278/large/tp-graphics-logo-core-day-1-alison-cosmetics-01.jpg?1566433091',
      products: [],
    ),
  ];
}

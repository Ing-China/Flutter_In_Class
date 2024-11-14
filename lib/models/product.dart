class Product {
  final int id;
  final String name;
  final int shopId;
  final String price;
  final String rating;
  final int isFavorite;
  final String disCountAmount;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.shopId,
    required this.price,
    required this.rating,
    required this.isFavorite,
    required this.disCountAmount,
    required this.imageUrl,
  });

  static List<Product> productList = [
    Product(
      id: 1,
      name: 'Product 1',
      shopId: 1,
      price: '29.99',
      rating: '4.5',
      isFavorite: 1,
      disCountAmount: '5',
      imageUrl:
          'https://www.aptoskincare.com/cdn/shop/products/Coconut-Water-Toner_Shadow_800x.png?v=1663074134',
    ),
    Product(
      id: 2,
      name: 'Product 2',
      shopId: 1,
      price: '49.99',
      rating: '4.0',
      isFavorite: 0,
      disCountAmount: '10',
      imageUrl:
          'https://www.aptoskincare.com/cdn/shop/products/Orange-Blossom-Cleanser_Shadow_1_800x.png?v=1672681969',
    ),
    Product(
      id: 3,
      name: 'Product 3',
      shopId: 1,
      price: '39.99',
      rating: '4.8',
      isFavorite: 1,
      disCountAmount: '15',
      imageUrl:
          'https://www.kbeautymakeup.com/cdn/shop/products/product_images_1621694156.20190927_nukki_organience_water1634848111_69401968-cb9a-4b95-ab28-3e2821e19559.png?v=1634848472',
    ),
    Product(
      id: 4,
      name: 'Product 4',
      shopId: 1,
      price: '19.99',
      rating: '4.2',
      isFavorite: 0,
      disCountAmount: '20',
      imageUrl:
          'https://www.kbeautymakeup.com/cdn/shop/products/product_images_1621694102.nukki_men_organience_treatment_water1634848065.png?v=1634848558',
    ),
    Product(
      id: 5,
      name: 'Product 5',
      shopId: 1,
      price: '59.99',
      rating: '4.7',
      isFavorite: 1,
      disCountAmount: '10',
      imageUrl:
          'https://www.kbeautymakeup.com/cdn/shop/products/product_images_1621694156.20190927_nukki_organience_water1634848111_69401968-cb9a-4b95-ab28-3e2821e19559.png?v=1634848472',
    ),
    Product(
      id: 6,
      name: 'Product 6',
      shopId: 1,
      price: '69.99',
      rating: '4.4',
      isFavorite: 0,
      disCountAmount: '5',
      imageUrl:
          'https://www.aptoskincare.com/cdn/shop/files/AHASeaweedGel_Shadow_1200x.png?v=1691084460',
    ),
    Product(
      id: 7,
      name: 'Product 7',
      shopId: 1,
      price: '89.99',
      rating: '4.6',
      isFavorite: 1,
      disCountAmount: '25',
      imageUrl:
          'https://vitaminscollection.com/wp-content/uploads/2024/05/CeraVePMFacialMoisturizingLotion59mL-removebg-preview-Copy.png',
    ),
    Product(
      id: 8,
      name: 'Product 8',
      shopId: 1,
      price: '79.99',
      rating: '4.3',
      isFavorite: 0,
      disCountAmount: '10',
      imageUrl:
          'https://jayessentielle.com/cdn/shop/products/www.cerave.com_5_pm-facial-moisturizing-lotion-3oz_front_v2_clnt.png?v=1596468859',
    ),
    Product(
      id: 9,
      name: 'Product 9',
      shopId: 1,
      price: '99.99',
      rating: '4.9',
      isFavorite: 1,
      disCountAmount: '30',
      imageUrl:
          'https://geologie.com/cdn/shop/files/Anti-Aging_Eye_Cream_9d5ec759-9cf8-421e-aad1-09969920d2cd.png?v=1715782428&width=350',
    ),
    Product(
      id: 10,
      name: 'Product 10',
      shopId: 1,
      price: '109.99',
      rating: '4.1',
      isFavorite: 0,
      disCountAmount: '5',
      imageUrl:
          'https://www.ceraveindia.com/-/media/project/loreal/brand-sites/cerave/americas/in/scx/products/thumbnail/hydrating-cleanser-thumb.png?rev=-1?w=150&hash=E4CB2F170A7AC7520F76ED14E4B0234D',
    ),
  ];
}

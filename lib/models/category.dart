class Category {
  final int id;
  final String name;
  final String imageUrl;
  Category({required this.id, required this.name, required this.imageUrl});

  static List<Category> categoryList = [
    Category(id: 1, name: 'Cosmetic', imageUrl: 'assets/images/cosmetics.png'),
    Category(id: 2, name: 'Fashion', imageUrl: 'assets/images/woman.png'),
    Category(
        id: 3, name: 'Restaurant', imageUrl: 'assets/images/restaurant.png'),
    Category(id: 4, name: 'Taxi Service', imageUrl: 'assets/images/taxi.png'),
    Category(
        id: 5,
        name: 'Food Grocery',
        imageUrl: 'assets/images/shopping-bag.png'),
    Category(id: 5, name: 'Pacel', imageUrl: 'assets/images/box.png'),
  ];
}

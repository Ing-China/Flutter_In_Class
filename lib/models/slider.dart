class Slider {
  final int id;
  final String imageUrl;
  Slider({required this.id, required this.imageUrl});

  static List<Slider> sliderList = [
    Slider(
        id: 1,
        imageUrl:
            'https://media.slidesgo.com/storage/200571/conversions/0-miniqe-cosmetics-thumb.jpg'),
    Slider(
        id: 2,
        imageUrl:
            'https://www.experian.com/blogs/news/wp-content/uploads/2016/01/beauty.png'),
    Slider(
        id: 3,
        imageUrl:
            'https://www.slideegg.com/image/catalog/704636-Cosmetic_PPT_Template_Free_Download.png'),
  ];
}

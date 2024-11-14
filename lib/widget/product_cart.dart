import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCart extends StatefulWidget {
  final int id;
  final String name;
  final int shopId;
  final String price;
  final String rating;
  final int isFavorite;
  final String disCountAmount;
  final String imageUrl;

  const ProductCart({
    required this.id,
    required this.name,
    required this.shopId,
    required this.price,
    required this.rating,
    required this.isFavorite,
    required this.disCountAmount,
    required this.imageUrl,
    super.key,
  });

  @override
  _ProductCartState createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite == 1;
  }

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      width: MediaQuery.of(context).size.width / 2.5,
      decoration: _boxDecoration(),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildImage(),
                _buildProductName(),
                _buildPrice(),
                _buildRatingAndIcon(),
              ],
            ),
          ),
          _buildFavoriteIcon(),
        ],
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 1),
        ),
      ],
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        widget.imageUrl,
        fit: BoxFit.contain,
        width: double.infinity,
        height: 190,
      ),
    );
  }

  Widget _buildProductName() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        widget.name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildPrice() {
    return Text(
      '\$${widget.price}',
      style: const TextStyle(color: Colors.red),
    );
  }

  Widget _buildRatingAndIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.star, color: Colors.yellow, size: 20),
            Text(widget.rating),
          ],
        ),
        _buildIconContainer(),
      ],
    );
  }

  Widget _buildIconContainer() {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: SvgPicture.asset(
          'assets/icons/Bag.svg',
          width: 18,
          height: 18,
        ),
      ),
    );
  }

  Widget _buildFavoriteIcon() {
    return Positioned(
      right: 0,
      top: 0,
      child: IconButton(
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: isFavorite ? Colors.red : Colors.grey,
        ),
        onPressed: _toggleFavorite,
      ),
    );
  }
}

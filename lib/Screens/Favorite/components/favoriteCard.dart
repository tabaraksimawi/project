import 'package:flutter/material.dart';

import '../../Core/core.dart';
import '../../../data/Models/ProductModel.dart';
import '../../ProductDetailScreen.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({
    @required this.product,
    @required this.isSelected,
    @required this.onCheckBoxValueChanged,
  });

  final ProductModel product;
  final bool isSelected;
  final Function(bool) onCheckBoxValueChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailScreen(
                      product: product,
                      heroTag: product.productImage,
                    )));
      },
      child: Row(
        children: [
          SizedBox(
            width: 88,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Hero(
                  tag: product.productImage,
                  child: LoadImage(url: product.productImage),
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.productName,
                style: TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 2,
              ),
              SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  text: "\$${product.price}",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: DefaultElements.kPrimaryColor),
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            children: [
              Transform.scale(
                scale: 1.2,
                child: Checkbox(
                  value: isSelected,
                  visualDensity: VisualDensity.comfortable,
                  activeColor: DefaultElements.kPrimaryColor,
                  side: BorderSide(width: 0),
                  shape: CircleBorder(),
                  onChanged: onCheckBoxValueChanged,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

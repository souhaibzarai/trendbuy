import 'package:flutter/material.dart';
import 'package:trendbuy/utils/constants/constants.dart';
import 'package:trendbuy/utils/theme/app_colors.dart';

class TopSelling extends StatelessWidget {
  const TopSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          constraints: BoxConstraints(
            maxHeight: 300, //
          ),
          child: Products(),
        ),
      ],
    );
  }
}

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      separatorBuilder: (context, index) => SizedBox(width: 10),
      itemBuilder:
          (context, index) => Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Constants.border),
                child: Image.network(
                  'https://i.imgur.com/Y1xm56W.jpeg',
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: productDetails(), //
              ),
              Positioned(
                left: 0,
                top: 010,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Constants.border,
                      bottomRight: Constants.border,
                    ),
                    color: AppColors.tertiaryColor.withAlpha(150),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  child: Text(
                    'Discount 50%',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
    );
  }

  Container productDetails() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.tertiaryColor.withAlpha(150),
        borderRadius: BorderRadius.only(
          bottomRight: Constants.border,
          bottomLeft: Constants.border,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Product',
                style: TextStyle(
                  fontSize: 11,
                  color: AppColors.primaryColor.withAlpha(255),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Product',
                style: TextStyle(
                  fontSize: 11,
                  color: AppColors.primaryColor.withAlpha(255),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Product',
                style: TextStyle(
                  fontSize: 11,
                  color: AppColors.primaryColor.withAlpha(255),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Product',
                style: TextStyle(
                  fontSize: 11,
                  color: AppColors.primaryColor.withAlpha(255),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

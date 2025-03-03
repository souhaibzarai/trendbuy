import 'package:flutter/material.dart';
import 'package:trendbuy/common/widgets/appbar/custom_app_bar.dart';
import 'package:trendbuy/features/products/domain/entities/product.dart';
import 'package:trendbuy/features/products/presentation/widgets/product_price.dart';
import 'package:trendbuy/features/products/presentation/widgets/product_title.dart';

import '../../../../utils/constants/constants.dart';
import '../widgets/images_view.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    super.key,
    required ProductEntity productEntity, //
  }) : _product = productEntity;

  final ProductEntity _product;

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(hideBackButton: false),
      body: SingleChildScrollView(
        padding: AppConstants.padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImagesView(
              productEntity: _product, //
            ),
            ProductTitle(product: _product,),
            const SizedBox(height: 15),
            ProductPrice(product: _product),
          ],
        ),
      ), //
    );
  }
}

import 'package:flutter/material.dart';
import '../widgets/add_to_bag.dart';
import '../widgets/product_color.dart';
import '../widgets/product_size.dart';
import '../widgets/product_quantity.dart';
import '../../../../utils/theme/app_colors.dart';
import '../../../../common/widgets/appbar/custom_app_bar.dart';
import '../../domain/entities/product.dart';
import '../widgets/product_price.dart';
import '../widgets/product_title.dart';

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
      appBar: const CustomAppBar(hideBackButton: false),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        color: AppColors.fillColor,
        child: const AddToBag(),
      ),
      body: SingleChildScrollView(
        padding: AppConstants.padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImagesView(productEntity: _product),
            const SizedBox(height: 10),
            ProductTitle(product: _product),
            const SizedBox(height: 15),
            ProductPrice(product: _product),
            const SizedBox(height: 15),
            const ProductSize(),
            const SizedBox(height: 15),
            const ProductColor(),
            const SizedBox(height: 15),
            const ProductQuantity(),
          ],
        ),
      ), //
    );
  }
}

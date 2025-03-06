import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/product_quantity_cubit.dart';
import '../widgets/add_to_bag.dart';
import '../widgets/selected_color.dart';
import '../widgets/product_size.dart';
import '../widgets/product_quantity.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductQuantityCubit()), //
      ],
      child: Scaffold(
        appBar: const CustomAppBar(hideBackButton: false),
        bottomNavigationBar: BottomAppBar(
          height: 70,
          color: const Color.fromRGBO(36, 50, 70, 1),
          child: AddToBag(product: _product),
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
              const SelectedSize(),
              const SizedBox(height: 15),
              const SelectedColor(),
              const SizedBox(height: 15),
              const ProductQuantity(),
            ],
          ),
        ), //
      ),
    );
  }
}

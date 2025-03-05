import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendbuy/features/products/presentation/bloc/product_quantity_cubit.dart';
import 'package:trendbuy/features/products/presentation/widgets/custom_product_detail_row.dart';
import 'package:trendbuy/utils/theme/app_colors.dart';

class ProductQuantity extends StatelessWidget {
  const ProductQuantity({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductQuantityCubit()), //
      ],
      child: CustomProductDetailRow(
        title: 'Quantity',
        child: SizedBox(
          width: 130,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Builder(
                builder: (context) {
                  final isQuantityOne =
                      context.watch<ProductQuantityCubit>().state == 1;
                  return customIcon(
                    onPressed:
                        isQuantityOne
                            ? null
                            : () {
                              context
                                  .read<ProductQuantityCubit>()
                                  .decrementQuantity();
                            },
                    icon: Icons.remove,
                    isNotEnabled: isQuantityOne,
                  );
                },
              ),
              BlocBuilder<ProductQuantityCubit, int>(
                builder: (context, state) {
                  return Text(
                    state.toString(),
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  );
                },
              ),
              Builder(
                builder: (context) {
                  return customIcon(
                    onPressed: () {
                      context.read<ProductQuantityCubit>().incrementQuantity();
                    },
                    icon: Icons.add,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget customIcon({
  required IconData icon,
  required VoidCallback? onPressed,
  bool isNotEnabled = false,
}) {
  return Builder(
    builder: (context) {
      return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isNotEnabled ? AppColors.whiteColor : AppColors.tertiaryColor,
        ),
        width: 40,
        height: 40,
        child: Center(
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(icon, color: AppColors.fillColor),
          ),
        ),
      );
    },
  );
}

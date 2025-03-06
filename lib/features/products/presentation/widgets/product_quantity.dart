import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/product_quantity_cubit.dart';
import 'custom_product_detail_row.dart';
import '../../../../utils/theme/app_colors.dart';

class ProductQuantity extends StatelessWidget {
  const ProductQuantity({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomProductDetailRow(
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
                  onPressed: () {
                    context.read<ProductQuantityCubit>().decrementQuantity();
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
            onPressed: isNotEnabled ? null : onPressed,
            icon: Icon(icon, color: AppColors.fillColor),
          ),
        ),
      );
    },
  );
}

import 'package:flutter/material.dart';
import 'package:trendbuy/features/order/domain/entities/cart_orders.dart';
import 'package:trendbuy/utils/theme/app_colors.dart';

class OrderedProductItem extends StatelessWidget {
  const OrderedProductItem({super.key, required CartOrdersEntity ordersEntity})
    : _ordersEntity = ordersEntity;

  final CartOrdersEntity _ordersEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.tertiaryColor,
      ),
      clipBehavior: Clip.hardEdge,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [
          Column(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(_ordersEntity.productImageUrl),
                radius: 35,
              ),
            ],
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    _ordersEntity.productTitle,
                    style: TextStyle(fontSize: 13), //
                  ),
                  Text(_ordersEntity.productSize),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_ordersEntity.productColor),
                  Text(_ordersEntity.productQuantity.toString()),
                ],
              ),
            ],
          ),
          Column(children: [

          ],),
        ],
      ),
    );
  }
}

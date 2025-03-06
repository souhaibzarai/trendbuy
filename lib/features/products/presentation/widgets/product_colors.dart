import 'package:flutter/material.dart';
import 'package:trendbuy/utils/helpers/navigator/app_navigator.dart';

class ProductColors extends StatelessWidget {
  const ProductColors({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,
            child: Stack(
              children: [
                Center(
                  child: Text(
                    'Color',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      AppNavigator.pop(context);
                    },
                    icon: Icon(Icons.close, color: Colors.white, size: 22),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}

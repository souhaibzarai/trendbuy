import 'package:flutter/material.dart';
import 'package:trendbuy/common/widgets/buttons/basic_app_button.dart';

class AddToBag extends StatelessWidget {
  const AddToBag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: basicAppButton(
        onPressed: () {},
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('data'), //
            Text('data'),
          ],
        ), //
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/theme/app_colors.dart';
import '../../cubit/button/button_state.dart';
import '../../cubit/button/button_state_cubit.dart';

class BasicReactiveAppButton extends StatelessWidget {
  final VoidCallback onPressed;

  final Widget content;

  const BasicReactiveAppButton({
    super.key,
    required this.onPressed,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonStateCubit, ButtonState>(
      builder: (context, state) {
        if (state is ButtonLoadingState) {
          return _loading();
        }
        return _initial();
      },
    );
  }

  Widget _loading() {
    return OutlinedButton(
      onPressed: null,
      style: OutlinedButton.styleFrom(
        enableFeedback: false,
        backgroundColor: AppColors.tertiaryColor,
        foregroundColor: Colors.white,
        fixedSize: const Size(340, 50),
        alignment: AlignmentDirectional.center,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25), //
        ),
      ),
      child: const CircularProgressIndicator.adaptive(),
    );
  }

  Widget _initial() {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        enableFeedback: false,
        backgroundColor: AppColors.tertiaryColor,
        foregroundColor: Colors.white,
        fixedSize: const Size(340, 50),
        alignment: AlignmentDirectional.center,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25), //
        ),
      ),
      child: content,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/constants/images_path.dart';
import '../../../../utils/helpers/navigator/app_navigator.dart';
import '../../../auth/presentation/screens/sign_in.dart';
import '../../../home/presentation/screens/home.dart';
import '../bloc/splash_cubit.dart';
import '../bloc/splash_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listenWhen: (current, prev) => current != prev,
      listener: (context, state) {
        if (state is UnAuthenticated) {
          AppNavigator.pushReplacement(
            context,
            widget: SignInScreen(), //
          );
        }
        if (state is Authenticated) {
          AppNavigator.pushReplacement(
            context,
            widget: const HomeScreen(), //
          );
        }
      },
      child: Scaffold(
        body: Center(
          child: Image.asset(
            ImagesPath.splashImage,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

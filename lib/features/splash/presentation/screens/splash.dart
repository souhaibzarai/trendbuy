import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendbuy/features/auth/presentation/screens/sign_in.dart';
import 'package:trendbuy/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:trendbuy/features/splash/presentation/cubit/splash_state.dart';
import 'package:trendbuy/utils/constants/images_path.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listenWhen: (current, prev) => current != prev,
      listener: (context, state) {
        if (state is UnAuthenticated) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const SignInScreen()),
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

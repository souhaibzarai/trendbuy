import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../auth/presentation/screens/sign_in.dart';
import '../cubit/splash_cubit.dart';
import '../cubit/splash_state.dart';
import '../../../../utils/constants/images_path.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listenWhen: (current, prev) => current != prev,
      listener: (context, state) {
        if (state is UnAuthenticated) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => SignInScreen()),
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

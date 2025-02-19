import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendbuy/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:trendbuy/features/splash/presentation/screens/splash.dart';
import 'package:trendbuy/utils/theme/app_theme.dart';

void main() {
  runApp(const TrendBuy());
}

class TrendBuy extends StatelessWidget {
  const TrendBuy({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..appStarted(),
      child: MaterialApp(
        theme: AppTheme.theme,
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

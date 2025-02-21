import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendbuy/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:trendbuy/features/splash/presentation/screens/splash.dart';
import 'package:trendbuy/firebase_options.dart';
import 'package:trendbuy/utils/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, //
  );

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

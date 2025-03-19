import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'features/splash/presentation/screens/splash.dart';
import 'firebase_options.dart';
import 'service_locator.dart';
import 'utils/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initDependencies();

  runApp(const TrendBuy());
}

class TrendBuy extends StatelessWidget {
  const TrendBuy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

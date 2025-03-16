import 'package:firebase_core/firebase_core.dart';
import 'package:fixitbhai/firebase_options.dart';
import 'package:fixitbhai/routes/app.routes.dart';
import 'package:fixitbhai/utils/themes/app.dimensions.dart';
import 'package:fixitbhai/utils/themes/app.theme.dart';

import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    DevicePreview(
      builder: (context) => FixitBhaii(),
    ),
  );
}

class FixitBhaii extends StatelessWidget {
  const FixitBhaii({super.key});

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context); // Initialize dimensions here
    final AppRouter appRouter = AppRouter();
    return MaterialApp.router(
      routerConfig: appRouter.config(),
      title: 'FixitBhaii',
      theme: MyTheme.lightTheme(context),
      themeMode: ThemeMode.system,
      darkTheme: MyTheme.darkTheme(context),
      builder: DevicePreview.appBuilder,
      locale: DevicePreview.locale(context),
      debugShowCheckedModeBanner: false,
    );
  }
}

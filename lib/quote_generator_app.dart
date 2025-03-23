import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quote_generator_mobile_app/core/routing/app_router.dart';
import 'package:quote_generator_mobile_app/core/routing/routes.dart';
import 'package:quote_generator_mobile_app/core/theming/colors.dart';

class QuoteGeneratorApp extends StatelessWidget {
  const QuoteGeneratorApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Quote Generator',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'GemunuLibre',
          primaryColor: ColorsManager.vividViolet,
        ),
        initialRoute: Routes.homeScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}

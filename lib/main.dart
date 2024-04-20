import 'package:bmiapp/core/routes/approuter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp( MyApp(router: AppRouter(),));
}

class MyApp extends StatelessWidget {
  final AppRouter router;
  const MyApp({super.key,required this.router});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (_ , child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: router.generateRoute,
      );
    }
    );
  }
}



import 'package:bmiapp/core/routes/approuter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp(router: AppRouter(),));
}

class MyApp extends StatelessWidget {
  final AppRouter router;
  const MyApp({super.key,required this.router});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
    );
  }
}



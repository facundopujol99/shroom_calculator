import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shroom_calculator/screens/home_screen.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: Size(1080, 2400), // base screen size
      builder: (_, child) => PsilosofiaApp(),
    ),
  );
}

class PsilosofiaApp extends StatelessWidget {
  const PsilosofiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Psilosofia',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: HomeScreen(),
    );
  }
}

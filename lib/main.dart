import 'package:flutter/material.dart';
import 'package:shroom_calculator/screens/home_screen.dart';

void main() {
  runApp(const PsilosofiaApp());
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

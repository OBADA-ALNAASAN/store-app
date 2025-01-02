import 'package:flutter/material.dart';
import 'package:store_app/screen/home_screen.dart';
import 'package:store_app/screen/update_product_screen.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        UpdateProductScreen.id: (context) => const UpdateProductScreen(),
      },
    );
  }
}

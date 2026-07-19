import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/cart_model.dart';
import 'pages/home.dart';

void main() {
  runApp(const Shamsu());
}

class Shamsu extends StatelessWidget {
  const Shamsu({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'shamsu',
        theme: ThemeData(
          fontFamily: 'FiraSansCondensed',
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 233, 88, 180),
          ),
        ),
        home: const Homepage(),
      ),
    );
  }
}

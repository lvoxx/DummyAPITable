import 'package:flutter/material.dart';

import 'package:doing_with_api/pages/all_page.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/product': (context) => ProductPage(),
      },
      title: 'Product API',
    ),
  );
}

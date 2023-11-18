import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product API'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/product');
                  },
                  icon: Icon(Icons.shop),
                  label: Text('To Product'))
            ]),
      ),
    );
  }
}

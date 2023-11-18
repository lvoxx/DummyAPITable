import 'package:doing_with_api/model/product_model.dart';
import 'package:doing_with_api/views/product_table.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late Future<List<ProductModel>> futureData;
  Future<List<ProductModel>> getDataFromAPI() async {
    Response response = await get(Uri.parse('https://dummyjson.com/products'));
    var outputJson = jsonDecode(response.body)['products'] as List;
    return outputJson.map((product) => ProductModel.fromJson(product)).toList();
  }

  @override
  void initState() {
    futureData = getDataFromAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<List<ProductModel>>(
            future: futureData,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case (ConnectionState.done):
                  {
                    if (snapshot.hasError) {
                      print('Error: ' + snapshot.error.toString());
                      return TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.warning,
                            color: Colors.amber,
                          ),
                          label: const Text('No such data found !'));
                    }
                    if (snapshot.hasData) {
                      return ProductTable(myListData: snapshot.data);
                    }
                  }
                default:
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      SizedBox(height: 14.0),
                      Text(
                        'Loading...',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  );
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}

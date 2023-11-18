import 'package:data_table_2/data_table_2.dart';
import 'package:doing_with_api/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductTable extends StatelessWidget {
  final List<ProductModel>? myListData;
  const ProductTable({super.key, required this.myListData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: DataTable2(
        columnSpacing: 15,
        horizontalMargin: 12,
        dataRowHeight: 65,
        minWidth: 1200,
        isHorizontalScrollBarVisible: true,
        columns: const [
          DataColumn2(label: Text('ID'), fixedWidth: 30.0),
          DataColumn2(label: Text('Title'), fixedWidth: 90.0),
          DataColumn2(label: Text('Description'), fixedWidth: 180.0),
          DataColumn2(label: Text('Price'), fixedWidth: 55.0),
          DataColumn2(label: Text('Discount Percentage'), fixedWidth: 75.0),
          DataColumn2(label: Text('Rating'), fixedWidth: 55.0),
          DataColumn2(label: Text('Stock'), fixedWidth: 55.0),
          DataColumn2(label: Text('Brand'), fixedWidth: 85.0),
          DataColumn2(label: Text('Category'), fixedWidth: 95.0),
        ],
        rows: List<DataRow>.generate(
          myListData!.length,
          (index) => DataRow(cells: [
            DataCell(Text('${myListData!.elementAt(index).id}')),
            DataCell(Text('${myListData!.elementAt(index).title}')),
            DataCell(Text('${myListData!.elementAt(index).description}')),
            DataCell(Text('${myListData!.elementAt(index).price}')),
            DataCell(
                Text('${myListData!.elementAt(index).discountPercentage}')),
            DataCell(Text('${myListData!.elementAt(index).rating}')),
            DataCell(Text('${myListData!.elementAt(index).stock}')),
            DataCell(Text('${myListData!.elementAt(index).brand}')),
            DataCell(Text('${myListData!.elementAt(index).category}')),
          ]),
        ),
      ),
    );
  }
}

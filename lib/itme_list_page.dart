import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_shpping/constants.dart';

class ItmeListPage extends StatefulWidget {
  const ItmeListPage({super.key});

  @override
  State<ItmeListPage> createState() => _ItmeListPageState();
}

class _ItmeListPageState extends State<ItmeListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main"),
      ),
      body: GridView.builder(
        itemCount: productList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 0.9,
        ),
        itemBuilder: (context, index) {
          return productContainer(
              productName: productList[index].productName ?? "",
              productImageUrl: productList[index].productImageUrl ?? "",
              price: productList[index].price ?? 0);
        },
      ),
    );
  }

  Widget productContainer({
    required String productName,
    required String productImageUrl,
    required double price,
  }) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          CachedNetworkImage(
            height: 150,
            fit: BoxFit.cover,
            imageUrl: productImageUrl,
            placeholder: (context, url) {
              return const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              );
            },
            errorWidget: (context, url, error) {
              return const Center(
                child: Text('오류 발생'),
              );
            },
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Text(productName),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Text("Price : ${numberFormat.format(price)}"),
          )
        ],
      ),
    );
  }
}

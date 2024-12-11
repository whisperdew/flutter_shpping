import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_shpping/constants.dart';
import 'package:flutter_shpping/item_details_page.dart';

class ItemListPage extends StatefulWidget {
  const ItemListPage({super.key});

  @override
  State<ItemListPage> createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main"),
      ),
      body: GridView.builder(
        itemCount: productList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.9,
        ),
        itemBuilder: (context, index) {
          return productContainer(
              productNo: productList[index].productNo ?? 0,
              productName: productList[index].productName ?? "",
              productImageUrl: productList[index].productImageUrl ?? "",
              price: productList[index].price ?? 0);
        },
      ),
    );
  }

  Widget productContainer({
    required int productNo,
    required String productName,
    required String productImageUrl,
    required double price,
  }) {
    return GestureDetector(
      child: Container(
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
              padding: const EdgeInsets.all(8),
              child: Text(productName),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Text("Price : ${numberFormat.format(price)}"),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return ItemDetailsPage(
              productNo: productNo,
              productName: productName,
              productImageUrl: productImageUrl,
              price: price);
        }));
      },
    );
  }
}

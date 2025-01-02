import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_productes.dart';
import 'package:store_app/widgets/custom_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String id = 'homescreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'New Trend',
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {},
            )
          ],
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.only(top: 80, left: 6, right: 6),
            child: FutureBuilder<List<ProductModel>>(
              future: GetAllProductes().getAllProducts(),
              builder: (context, snapshot) {
                
              
                if (snapshot.hasData) {
                  List<ProductModel> products = snapshot.data!;
                  return GridView.builder(
                    itemCount: products.length,
                    clipBehavior: Clip.none,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.6,
                            crossAxisSpacing: 6,
                            mainAxisSpacing: 80),
                    itemBuilder: (BuildContext context, int index) {
                      return CustomCard(
                        product: products[index],
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )));
  }
}

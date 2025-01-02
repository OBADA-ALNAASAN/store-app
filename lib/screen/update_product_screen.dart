import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/coustom_button.dart';
import 'package:store_app/widgets/coustomtextformfield.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key});
  static String id = 'update product';

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  @override
  Widget build(BuildContext context) {
    String? productName, description, image;
    String? price;
    bool isLoading = false;
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Update Product',
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              const SizedBox(
                height: 30,
              ),
              Coustomtextformfield(
                  onChange: (val) {
                    productName = val;
                  },
                  hintText: 'Product Name'),
              const SizedBox(
                height: 10,
              ),
              Coustomtextformfield(
                  onChange: (val) {
                    description = val;
                  },
                  hintText: 'description'),
              const SizedBox(
                height: 10,
              ),
              Coustomtextformfield(
                  inputType: TextInputType.number,
                  onChange: (val) {
                    price = val;
                  },
                  hintText: 'price'),
              const SizedBox(
                height: 10,
              ),
              Coustomtextformfield(
                  onChange: (val) {
                    image = val;
                  },
                  hintText: 'Image'),
              const SizedBox(
                height: 50,
              ),
              CoustomButton(
                  text: 'Update',
                  onTap: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                    await  updateProduct(
                          product, productName, price, description, image);
                      print('success');
                    } on Exception catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  })
            ],
          ),
        ),
      ),
    );
  }

 Future< void >updateProduct(ProductModel product, String? productName, String? price,
      String? description, String? image) async {
  await  UpdateProductServices().updateProduct(id: product.id,
      category: product.category,
      title: productName ?? product.title,
      price: price ?? product.price.toString(),
      description: description ?? product.description,
      image: image ?? product.image,
    );
  }
}

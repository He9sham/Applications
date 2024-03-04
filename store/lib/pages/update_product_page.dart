import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store/models/product_model.dart';
import 'package:store/pages/cubit/HomePage_cubit/store_cubit.dart';
import 'package:store/services/update_product.dart';
import 'package:store/widgets/Custom_Button.dart';
import 'package:store/widgets/Custome_TextField.dart';

class UpDateProductPage extends StatelessWidget {
  static String id = 'update product';
  String? ProductName, image, dec;

  String? price;
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    // ProductModel product =
    //     ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Update Product'),
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 120,
                ),
                // ignore: missing_required_param
                CustomTextField(
                  name: 'Product Name',
                  onchanged: (data) {
                    ProductName = data;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                // ignore: missing_required_param
                CustomTextField(
                  name: 'image',
                  onchanged: (data) {
                    image = data;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  keyboardtype: TextInputType.number,
                  name: 'price',
                  onchanged: (data) {
                    price = data;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                // ignore: missing_required_param
                CustomTextField(
                  name: 'category',
                  onchanged: (data) {
                    dec = data;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                // ignore: missing_required_param
                const SizedBox(
                  height: 70,
                ),
                BlocConsumer<StoreCubit, StoreState>(
                  listener: (context, state) {
                    if (state is StoreLoading) {
                      isloading = true;
                    }
                    if (state is StoreSuccess) {
                      BlocProvider.of<StoreCubit>(context).someMethod(context);
                      isloading = false;
                    }
                  },
                  builder: (context, state) {
                    return CustomButton(
                      Name: 'Update',
                      onTap: () async {
                        isloading = true;

                        // Retrieve the ProductModel object using someMethod
                        ProductModel product =
                            await BlocProvider.of<StoreCubit>(context)
                                .someMethod(context);

                        await BlocProvider.of<StoreCubit>(context)
                            .UpdateProductService(product);
                        isloading = false;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

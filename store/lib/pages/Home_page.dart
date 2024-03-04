import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store/models/product_model.dart';
import 'package:store/pages/cubit/HomePage_cubit/store_cubit.dart';
import 'package:store/widgets/Custom_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  static String id = 'HomePage';
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreCubit, StoreState>(
      listener: (context, state) {
        if (state is StoreLoading) {
          isloading = true;
        } else if (state is StoreSuccess) {
          BlocProvider.of<StoreCubit>(context).getAllProduct();
          isloading = false;
        } else if (state is StoreFaulier) {
          Center(
            child: Text('There is an unexpected error'),
          );
          isloading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isloading,
          child: Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(FontAwesomeIcons.cartPlus),
                ),
              ],
              backgroundColor: Colors.white,
              elevation: 0,
              title: const Text(
                'New Trend',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
              child: FutureBuilder(
                future: BlocProvider.of<StoreCubit>(context).getAllProduct(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    List<ProductModel> product = snapshot.data!;
                    return GridView.builder(
                      itemCount: product.length,
                      clipBehavior: Clip.none,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.5,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 100.0,
                      ),
                      itemBuilder: (context, index) {
                        return CustomCard(
                          product: product[index],
                        );
                      },
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

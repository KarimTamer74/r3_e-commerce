// features/products/presentation/screens/products_screen.dart
import 'dart:developer';

import 'package:first_app/features/products/data/data_source/remote_data_source.dart';
import 'package:first_app/features/products/presentation/cubits/categories_cubit.dart/categories_cubit.dart';
import 'package:first_app/features/products/presentation/cubits/categories_cubit.dart/categories_states.dart';
import 'package:first_app/features/products/presentation/cubits/products_cubit/products_cubit.dart';
import 'package:first_app/features/products/presentation/cubits/products_cubit/products_states.dart';
import 'package:first_app/features/products/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatefulWidget {
  @override
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  RemoteDataSource remoteDataSource = RemoteDataSource();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoriesCubit>(context).getCategories();
    BlocProvider.of<ProductsCubit>(context).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    log("Products Screen");
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        title: Text(
          "Products",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<CategoriesCubit, CategoriesStates>(
                builder: (context, state) {
                  if (state is CategoriesLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is CategoriesFailureState) {
                    return Text(state.errorMess);
                  } else if (state is CategoriesSuccessState) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.categories.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(
                                  state.categories[index]['image'],
                                ),
                              ),

                              Center(
                                child: Text(
                                  state.categories[index]['name'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 12,

                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                  return SizedBox.shrink();
                },
              ),
            ),
            Expanded(
              flex: 4,
              child: BlocConsumer<ProductsCubit, ProductsStates>(
                builder: (context, state) {
                  if (state is ProductsLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is ProductsFailureState) {
                    return Text(state.errorMess);
                  } else if (state is ProductsSuccessState) {
                    return GridView.builder(
                      itemCount: state.products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 2.6 / 3,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return ProductItem(
                          product: state.products[index],
                          onPressed: () async {
                            await BlocProvider.of<ProductsCubit>(
                              context,
                            ).deleteProduct(state.products[index].id);
                          },
                        );
                      },
                    );
                  }
                  return Container(
                    color: Colors.amber,
                    width: double.infinity,
                    height: 500,
                  );
                },
                listener: (context, state) {
                  if (state is DeleteProductLoading) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Center(child: CircularProgressIndicator());
                      },
                    );
                  } else if (state is DeleteProductSuccess) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Deleting Success"),
                        backgroundColor: Colors.green,
                      ),
                    );
                  } else if (state is DeleteProductFailure) {
                    Navigator.pop(context);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Deleting Failure"),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

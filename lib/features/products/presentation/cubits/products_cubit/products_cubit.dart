// features/products/presentation/cubits/products_cubit/products_cubit.dart
import 'dart:developer';

import 'package:first_app/features/products/data/data_source/remote_data_source.dart';
import 'package:first_app/features/products/presentation/cubits/products_cubit/products_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<ProductsStates> {
  ProductsCubit() : super(ProductsInitialState());

  RemoteDataSource remoteDataSource = RemoteDataSource();

  Future<void> getProducts() async {
    emit(ProductsLoadingState());
    await remoteDataSource.getProducts().then(
      (val) {
        log("Products: $val", name: 'Products Cubit');
        emit(ProductsSuccessState(products: val));
      },
      onError: (err) {
        log("Error: $err", name: 'Products Cubit');
        emit(ProductsFailureState(errorMess: err.toString()));
      },
    );
  }

  Future<void> deleteProduct(int id) async {
    emit(DeleteProductLoading());
    await remoteDataSource
        .deleteProduct(id)
        .then(
          (val) {
            log("Success in cubit");
            emit(DeleteProductSuccess());
            getProducts();
          },
          onError: (err) {
            log("Error in cubit: $err");
            emit(DeleteProductFailure());
          },
        );
  }
}

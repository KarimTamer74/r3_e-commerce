// features/products/presentation/cubits/categories_cubit.dart/categories_cubit.dart
import 'dart:developer';

import 'package:first_app/features/products/data/data_source/remote_data_source.dart';
import 'package:first_app/features/products/presentation/cubits/categories_cubit.dart/categories_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesCubit extends Cubit<CategoriesStates> {
  CategoriesCubit() : super(CategoriesInitialState());
  RemoteDataSource remoteDataSource = RemoteDataSource();
  Future<void> getCategories() async {
    emit(CategoriesLoadingState());
    await remoteDataSource.getCategoryData().then(
      (value) {
        log("Value: $value");
        emit(CategoriesSuccessState(categories: value));
      },
      onError: (error) {
        log("Error: $error");
        emit(CategoriesFailureState(errorMess: error.toString()));
      },
    );
  }
}

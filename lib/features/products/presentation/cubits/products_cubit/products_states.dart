// features/products/presentation/cubits/products_cubit/products_states.dart
import 'package:first_app/features/products/data/models/product_model.dart';

abstract class ProductsStates {}

class ProductsInitialState extends ProductsStates {}

class ProductsLoadingState extends ProductsStates {}

class ProductsFailureState extends ProductsStates {
  final String errorMess;

  ProductsFailureState({required this.errorMess});
}

class ProductsSuccessState extends ProductsStates {
  final List<ProductModel> products;

  ProductsSuccessState({required this.products});
}

class DeleteProductLoading extends ProductsStates {}

class DeleteProductSuccess extends ProductsStates {}

class DeleteProductFailure extends ProductsStates {}

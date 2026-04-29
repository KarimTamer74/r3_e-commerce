// features/products/presentation/cubits/categories_cubit.dart/categories_states.dart
abstract class CategoriesStates {}

class CategoriesInitialState extends CategoriesStates {}

class CategoriesLoadingState extends CategoriesStates {}

class CategoriesFailureState extends CategoriesStates {
  final String errorMess;

  CategoriesFailureState({required this.errorMess});
}

class CategoriesSuccessState extends CategoriesStates {
  final List<dynamic> categories;

  CategoriesSuccessState({required this.categories});
}

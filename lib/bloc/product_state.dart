import 'package:sneakers_app/data/models/product_model.dart';

abstract class ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProductModel> product;

  ProductLoaded(this.product);

  void toggleFavorite() {}
}

class ProductError extends ProductState {
  final String message;

  ProductError(this.message);
}

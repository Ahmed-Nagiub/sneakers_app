import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers_app/bloc/product_event.dart';
import 'package:sneakers_app/bloc/product_state.dart';
import 'package:sneakers_app/data/models/product_model.dart';
import 'package:sneakers_app/view_models/product_view_model.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductViewModel viewModel;

  ProductBloc(this.viewModel) : super(ProductLoading()) {
    on<FetchProduct>(_onFetchProduct);
  }

  void _onFetchProduct(FetchProduct event, Emitter<ProductState> emit) async {
    try {
      emit(ProductLoading());
      final result = await viewModel.getProduct();
      result.fold((left) {
        emit(ProductError(left));
      }, (right) async {
        emit(ProductLoaded(right));
      });
    } catch (e) {
      emit(ProductError('Failed to fetch products'));
    }
  }
}

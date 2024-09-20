import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers_app/bloc/product_bloc.dart';
import 'package:sneakers_app/bloc/product_event.dart';
import 'package:sneakers_app/bloc/product_state.dart';
import 'package:sneakers_app/data/repository/product_repo.dart';
import 'package:sneakers_app/view_models/product_view_model.dart';
import 'package:sneakers_app/widget/product_card.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
        child: BlocProvider(
          create: (context) => ProductBloc(ProductViewModel(ProductRepo()))..add(FetchProduct()),
          child: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return const Center(child: CircularProgressIndicator.adaptive());
              } else if (state is ProductLoaded) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.73,
                  ),
                  itemCount: state.product.length,
                  itemBuilder: (context, index) {
                    final productItem = state.product[index];
                    return ProductCard(
                      productItem: productItem,
                    );
                  },
                );
              } else if (state is ProductError) {
                return Center(child: Text(state.message));
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}

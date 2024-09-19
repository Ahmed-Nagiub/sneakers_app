import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers_app/bloc/sneakers_bloc.dart';
import 'package:sneakers_app/bloc/sneakers_event.dart';
import 'package:sneakers_app/bloc/sneakers_state.dart';
import 'package:sneakers_app/view_models/sneakers_view_model.dart';
import 'package:sneakers_app/widget/sneakers_card.dart';


class SneakersListScreen extends StatelessWidget {
  const SneakersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
        child: BlocProvider(
          create: (context) => SneakersBloc(SneakersViewModel())..add(FetchSneakers()),
          child: BlocBuilder<SneakersBloc, SneakersState>(
            builder: (context, state) {
              if (state is SneakersLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is SneakersLoaded) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.73,
                  ),
                  itemCount: state.sneakers.length,
                  itemBuilder: (context, index) {
                    final sneakersItem = state.sneakers[index];
                    return SneakersCard(sneakersItem: sneakersItem);
                  },
                );
              } else if (state is SneakersError) {
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

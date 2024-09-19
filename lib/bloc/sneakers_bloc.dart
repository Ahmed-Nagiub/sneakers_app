import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers_app/bloc/sneakers_event.dart';
import 'package:sneakers_app/bloc/sneakers_state.dart';
import 'package:sneakers_app/models/sneakers_model.dart';
import 'package:sneakers_app/view_models/sneakers_view_model.dart';

class SneakersBloc extends Bloc<SneakersEvent, SneakersState> {
  final SneakersViewModel viewModel;

  SneakersBloc(this.viewModel) : super(SneakersLoading()) {
    on<FetchSneakers>(_onFetchShoes);
  }

  void _onFetchShoes(FetchSneakers event, Emitter<SneakersState> emit) async {
    try {
      emit(SneakersLoading());
      List<SneakersItem> shoes = await viewModel.getShoes();
      emit(SneakersLoaded(shoes));
    } catch (e) {
      emit(SneakersError('Failed to fetch shoes'));
    }
  }
}

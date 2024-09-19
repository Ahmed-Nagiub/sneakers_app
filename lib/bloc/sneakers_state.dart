import 'package:sneakers_app/models/sneakers_model.dart';

abstract class SneakersState {}

class SneakersLoading extends SneakersState {}

class SneakersLoaded extends SneakersState {
  final List<SneakersItem> sneakers;

  SneakersLoaded(this.sneakers);
}

class SneakersError extends SneakersState {
  final String message;

  SneakersError(this.message);
}

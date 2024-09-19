import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers_app/bloc/sneakers_bloc.dart';
import 'package:sneakers_app/bloc/sneakers_event.dart';
import 'package:sneakers_app/view/screens/sneakers_screen.dart';
import 'package:sneakers_app/view_models/sneakers_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SneakersBloc(SneakersViewModel())..add(FetchSneakers()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Bloc Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SneakersListScreen(),
      ),
    );
  }
}

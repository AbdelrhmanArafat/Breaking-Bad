import 'package:breaking_bad/bloc/cubit/app_cubit.dart';
import 'package:breaking_bad/bloc/cubit/app_state.dart';
import 'package:breaking_bad/data/api/dio_helper.dart';
import 'package:breaking_bad/data/repository/repository.dart';
import 'package:breaking_bad/presentation/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Repository repository = Repository(DioHelper());
    return BlocProvider(
      create: (context) => AppCubit(repository),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: CharactersScreen(),
          );
        },
      ),
    );
  }
}

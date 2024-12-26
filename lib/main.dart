import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

void main() => runApp(const MyApp());

class CounterCubit extends Cubit<int> {
  CounterCubit(super.initialState);
}

final cubitA = CounterCubit(0); // state starts at 0
final cubitB = CounterCubit(10); // state starts at 10

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}

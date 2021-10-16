import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/app_widget.dart';
import 'modules/views/tuner/bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => TunerBloc(),
      child: const AppWidget(),
    ),
  );
}

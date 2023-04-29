import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_travel_app/cubit/app_cubits.dart';
import 'package:the_travel_app/pages/welcom_page.dart';

import 'app_cubit_state.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<AppCubits, CubitState>(
      builder: (context, state) {
        if (state is WelcomState) {
          return WelcomPage();
        } else {
          return Container();
        }
      },
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_consume_api/cubit/get_user_data_cubit.dart';
import 'package:flutter_consume_api/cubit/post_user_cubit.dart';
import 'package:flutter_consume_api/pages/home_page.dart';
import 'package:flutter_consume_api/pages/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetUserDataCubit(),
        ),
        BlocProvider(
          create: (context) => PostUserCubit(),
        )
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => RegisterPage(),
          'home': (context) => HomePage(),
        },
      ),
    );
  }
}

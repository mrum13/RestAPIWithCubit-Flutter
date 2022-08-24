import 'package:flutter/material.dart';
import 'package:flutter_consume_api/cubit/get_user_data_cubit.dart';
import 'package:flutter_consume_api/models/user_model.dart';
import 'package:flutter_consume_api/services/get_single_user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    context.read<GetUserDataCubit>().getUserData();

    return Scaffold(
        backgroundColor: Colors.white70,
        body: Center(
          child: BlocBuilder<GetUserDataCubit, GetUserDataState>(
            builder: (context, state) {
              String? firstName, lastName, avatar, email, id;

              if (state is GetUserDataSuccess) {
                firstName = state.userModel.data.firstName;
                lastName = state.userModel.data.lastName;
                avatar = state.userModel.data.avatar;
                email = state.userModel.data.email;
                id = state.userModel.data.id.toString();
              } else {
                firstName = "kosong";
                lastName = "kosong";
                email = "kosong";
                id = "0";
                avatar =
                    "https://freepikpsd.com/file/2019/10/none-png-2-Transparent-Images.png";
              }

              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                height: 150,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.network(
                      fit: BoxFit.fill,
                      avatar,
                      height: 100,
                      width: 100,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nama : $firstName $lastName"),
                          Text("Email: $email"),
                          Text("id: $id")
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ));
  }
}

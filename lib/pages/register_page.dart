import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_consume_api/cubit/post_user_cubit.dart';
import 'package:flutter_consume_api/widgets/custom_text_form_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController =
        TextEditingController(text: '');
    final TextEditingController jobController = TextEditingController(text: '');

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormField(
                title: "Nama",
                hintText: "Masukkan Nama ...",
                controller: nameController),
            const SizedBox(
              height: 4,
            ),
            CustomTextFormField(
                title: "Pekerjaan",
                hintText: "Masukkan Pekerjaan ...",
                controller: jobController),
            const SizedBox(
              height: 24,
            ),
            BlocConsumer<PostUserCubit, PostUserState>(
              listener: (context, state) {
                if (state is PostUserFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.red, content: Text(state.error)));
                } else if (state is PostUserSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.green,
                      content: Text(state.responseCode)));
                }
              },
              builder: (context, state) {
                if (state is PostUserLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return GestureDetector(
                  onTap: () {
                    context.read<PostUserCubit>().signUp(
                        name: nameController.toString(),
                        job: jobController.toString());
                  },
                  child: Container(
                    height: 44,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.green),
                    child: const Center(
                      child: Text(
                        "Daftar",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

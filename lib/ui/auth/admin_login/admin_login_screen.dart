import 'package:cleaning_house/cubits/admin/admin_cubit.dart';
import 'package:cleaning_house/ui/auth/widgets/global_button.dart';
import 'package:cleaning_house/ui/auth/widgets/global_text_field.dart';
import 'package:cleaning_house/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome To App'),
      ),
      body: BlocConsumer<AdminCubit, AdminState>(
        builder: (context, state) {
          if ((state is AdminLoadingState)) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 12,
              ),
              GlobalTextField(
                controller: controller1,
                hintText: 'gmail',
                textInputType: TextInputType.name,
                textInputAction: TextInputAction.done,
                onChanged: (v) {},
                inputFormatter: [],
              ),
              GlobalTextField(
                controller: controller2,
                hintText: 'PASSWORD',
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.done,
                onChanged: (v) {},
                inputFormatter: [],
              ),
              GlobalButton(
                  title: 'Kirish',
                  onTap: () {
                    context.read<AdminCubit>().sendCodeToGmailAndLogin(gmail: controller1.text, password: controller2.text);
                     Navigator.pushNamed(context, RouteNames.enterToAdminPanelScreen);
                  }),
            ],
          );
        },
        listener: (context, state) {
          if (state is AdminErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Something Went Wrong')));
          }
          if (state is AdminLoggedState) {
            Navigator.pushNamed(context, RouteNames.adminPanelScreen);
          }
        },
      ),
    );
  }
}

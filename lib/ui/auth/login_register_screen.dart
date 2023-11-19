import 'package:cleaning_house/cubits/auth/auth_cubit.dart';
import 'package:cleaning_house/cubits/user_data/user_data_cubit.dart';
import 'package:cleaning_house/network_side/models/customer/customer_field_key.dart';
import 'package:cleaning_house/network_side/models/customer/customer_post_model.dart';
import 'package:cleaning_house/ui/auth/widgets/global_button.dart';
import 'package:cleaning_house/ui/auth/widgets/global_text_field.dart';
import 'package:cleaning_house/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class UserRegisterScreen extends StatefulWidget {
  const UserRegisterScreen({super.key});

  @override
  State<UserRegisterScreen> createState() => _UserRegisterScreenState();
}

class _UserRegisterScreenState extends State<UserRegisterScreen> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome To App'),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        builder: (context, state) {
          if ((state is AuthLoadingState) || (state is AuthLoggedState)) {
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
                hintText: 'Ismingizni kiriting',
                textInputType: TextInputType.name,
                textInputAction: TextInputAction.done,
                onChanged: (v) {
                  context.read<UserDataCubit>().updateCustomerField(
                      fieldKey: CustomerFielKeys.name, value: v);
                },
                inputFormatter: [],
              ),
              GlobalTextField(
                controller: controller2,
                hintText: '+998 (XX) XXX-XX-XX',
                textInputType: TextInputType.phone,
                textInputAction: TextInputAction.done,
                onChanged: (v) {
                  context.read<UserDataCubit>().updateCustomerField(
                      fieldKey: CustomerFielKeys.phoneNumber, value: v);
                },
                inputFormatter: [
                  MaskTextInputFormatter(
                      mask: '+998 (##) ###-##-##',
                      filter: {"#": RegExp('[0-9]')},
                      type: MaskAutoCompletionType.lazy),
                ],
              ),
              GlobalButton(
                  title: 'Kirish',
                  onTap: () {
                    if (context.read<UserDataCubit>().canRegister()) {
                      context.read<AuthCubit>().registerUser(
                          customerPostModel: CustomerPostModel(
                              name: controller1.text,
                              phone_number: controller2.text));
                    }
                  }),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, RouteNames.adminPanelScreen2);
                  },
                  child: Text('Admin Panel'))
            ],
          );
        },
        listener: (context, state) {
          if (state is AuthErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Something Went Wrong')));
          }
          if (state is AuthLoggedState) {
            Navigator.pushNamed(context, RouteNames.tabBoxScreen);
          }
        },
      ),
    );
  }
}

import 'package:cleaning_house/cubits/admin/admin_cubit.dart';
import 'package:cleaning_house/ui/auth/widgets/global_button.dart';
import 'package:cleaning_house/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits/auth/auth_cubit.dart';
import '../../../utils/colors.dart';

class GmailVerifyScreen extends StatefulWidget {
  const GmailVerifyScreen({super.key});

  @override
  State<GmailVerifyScreen> createState() => _GmailVerifyScreenState();
}

class _GmailVerifyScreenState extends State<GmailVerifyScreen> {
  int code = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gmail Confirm"),
      ),
      body: BlocConsumer<AdminCubit, AdminState>(
        builder: (context, state) {
          if (state is AuthLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                textAlign: TextAlign.start,
                onSubmitted: (v){
 code = int.parse(v);
                },
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'Code',
                  hintStyle: Theme.of(context).textTheme.titleMedium,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 1, color: AppColors.C_0FC36D),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 1, color: AppColors.C_0FC36D),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 1, color: AppColors.C_0FC36D),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 1, color: AppColors.C_0FC36D),
                  ),
                ),
              ),
              GlobalButton(
                  title: 'Confirm',
                  onTap: () {
                    context.read<AdminCubit>().verifyCode(code);
                  }),
              const SizedBox(
                height: 50,
              ),
            ],
          );
        },
        listener: (context, state) {
          if (state is AdminLoggedState) {
            Navigator.pushNamedAndRemoveUntil(
                context, RouteNames.adminPanelScreen, (c) => false);
          }
          if (state is AdminErrorState) {
             Center(
              child: Text(state.errorText),
            );
          }
        },
      ),
    );
  }
}

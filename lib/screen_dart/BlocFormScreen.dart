import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../bloc/form_bloc.dart';
import '../bloc/form_event.dart';
import '../bloc/form_state.dart';
import '../model/form_item.dart';
import '../widgets/customfiled_dart.dart';

class BlocFormScreen extends StatelessWidget {
  BlocFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FormBloc, AppFormState>(
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.all(24),
            child: Form(
              key: state.formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Welcome to Eriell",
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            Text(""),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomFormField(
                          hintText: 'name',
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r'[a-z]'),
                            )
                          ],
                          onChange: (val) {
                            BlocProvider.of<FormBloc>(context).add(
                                NameChanged(name: BlocFormItem(value: val!)));
                          },
                          validator: (val) {
                            return state.name.error;
                          },
                        ),
                        const SizedBox(height: 45),
                        Customnumber(
                          hintText: 'phone',
                          inputFormatters: [],
                          onChange: (val) {
                            BlocProvider.of<FormBloc>(context).add(
                                PhoneChanged(phone: BlocFormItem(value: val!)));
                          },
                          validator: (val) {
                            return state.phone.error;
                          },
                        ),
                        const SizedBox(height: 45),
                        ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<FormBloc>(context)
                                .add(const FormSubmitEvent());
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: Colors.blueAccent,
                          ),
                          child: const Text(
                            "Login",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

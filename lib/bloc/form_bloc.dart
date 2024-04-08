import 'package:eriell_test_app/utils_dart/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../model/form_item.dart';
import '../utils_dart/utils.dart';
import 'form_event.dart';
import 'form_state.dart';

class FormBloc extends Bloc<FormScreenEvent, AppFormState> {
  FormBloc() : super(const AppFormState()) {
    on<InitEvent>(_initState);
    on<NameChanged>(_onNameChanged);
    on<PhoneChanged>(_onPhoneChanged);
    on<FormSubmitEvent>(_onFormSubmitted);
  }

  final formKey = GlobalKey<FormState>();

  Future<void> _initState(InitEvent event, Emitter<AppFormState> emit) async {
    emit(state.copyWith(formKey: formKey));
  }

  Future<void> _onNameChanged(
      NameChanged event, Emitter<AppFormState> emit) async {
    emit(
      state.copyWith(
        name: BlocFormItem(
          value: event.name.value,
          error: event.name.value.isValidName ? null : 'Enter name',
        ),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onPhoneChanged(
      PhoneChanged event, Emitter<AppFormState> emit) async {
    emit(
      state.copyWith(
        phone: BlocFormItem(
          value: event.phone.value,
          error: event.phone.value.isValidPhone ? null : 'Enter phone',
        ),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onFormSubmitted(
      FormSubmitEvent event,
      Emitter<AppFormState> emit,
      ) async {
    if (state.formKey!.currentState!.validate()) {
      goHome();
    }
  }}
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';


import '../model/form_item.dart';

class AppFormState extends Equatable {
  const AppFormState({
    this.name = const BlocFormItem(error: 'Enter name'),
    this.phone = const BlocFormItem(error: 'Enter phone'),
    this.formKey,
  });
  final BlocFormItem name;
  final BlocFormItem phone;
  final GlobalKey<FormState>? formKey;

  AppFormState copyWith({
    BlocFormItem? name,
    BlocFormItem? phone,
    GlobalKey<FormState>? formKey,
  }) {
    return AppFormState(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      formKey: formKey,
    );
  }

  @override
  List<Object> get props => [ name, phone];
}

enum FormStatus { none, inProgress, valid, invalid }
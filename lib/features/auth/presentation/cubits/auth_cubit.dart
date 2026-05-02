// features/auth/presentation/cubits/auth_cubit.dart
import 'dart:developer';

import 'package:first_app/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:first_app/features/auth/presentation/cubits/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());
  AuthRemoteDataSource authRemoteDataSource = AuthRemoteDataSource();
  Future<void> login({required String email, required String password}) async {
    emit(LoginLoadingState());
    await authRemoteDataSource
        .login(email: email, pass: password)
        .then(
          (val) {
            log("Success", name: 'Auth Cubit');
            emit(LoginSuccessState());
          },
          onError: (error) {
            log("Error: $error", name: 'Auth Cubit');
            emit(LoginFailureState());
          },
        );
  }
}

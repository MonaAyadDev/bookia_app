part of 'register_cubit.dart';

sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterError extends RegisterState {}

final class Registersuccess extends RegisterState {}

final class RegisterLoding extends RegisterState {}

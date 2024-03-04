part of 'store_cubit.dart';

@immutable
sealed class StoreState {}

final class StoreInitial extends StoreState {}
final class StoreSuccess extends StoreState {}
final class StoreLoading extends StoreState {}
final class StoreFaulier extends StoreState {}

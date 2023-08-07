// ignore_for_file: prefer_const_constructors
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon_application/pokemon_list_app.dart';
import 'package:pokemon_application/repositories/pokemon_list/pokemon_list.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractPokemonRepositorty>(
      () => PokemonListRepository(dio: Dio()));
  runApp(const PokemonListApp());
}

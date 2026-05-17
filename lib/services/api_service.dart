import 'package:dio/dio.dart';
import 'package:rickandmorty_app/models/characters_model.dart';
import 'dart:developer';

class ApiService {
  final _dio = Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'));

  Future<CharactersModel> getCharacters() async {
    try {
      final response = await _dio.get('/character');
      log('Characters fetched successfully');
      return CharactersModel.fromJson(response.data);
    } on DioException catch (e) {
      log('Dio error ehile fetch characters', error: e);
      throw Exception('Failed to fetch characters');
    } catch (e) {
      log('Unexceptted error occurred', error: e);
      throw Exception('Somethıng went wrong');
    }
  }
}


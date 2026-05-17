import 'package:flutter/material.dart';
import 'package:rickandmorty_app/app/getit.dart';
import 'package:rickandmorty_app/models/characters_model.dart';
import 'package:rickandmorty_app/services/api_service.dart';

class CharactersViewModel extends ChangeNotifier {
  final _apiService = locator<ApiService>();

  CharactersModel? _characterModel;
  CharactersModel? get charactersModel => _characterModel;

  void getCharacter() async {
    _characterModel = await _apiService.getCharacters();
    notifyListeners();
  }

  bool loadMore = false;

  void getCharacterMore() async {

  if (loadMore) return;

  loadMore = true;

  final data = await _apiService.getCharacters(
    url: _characterModel?.info.next,
  );

  loadMore = false;

  _characterModel!.results.addAll(data.results);

  notifyListeners();
}
}
